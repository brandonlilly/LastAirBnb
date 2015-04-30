LastAirBnb.Views.MapShow = Backbone.View.extend({

  attributes: {
    id: "map-canvas"
  },

  initialize: function () {
    this._markers = {};
    this._labels = [];

    this.listenTo(this.collection, 'add', this.addMarker);
    this.listenTo(this.collection, 'remove', this.removeMarker);
  },

  initMap: function () {
    this._map = this.generateMap();
    LastAirBnb.Map = this._map;

    this.collection.each(this.addMarker.bind(this));
    this.attachMapListeners();

    this.attachLabels();
  },

  generateMap: function () {
    var MAP_TYPE = "avatar";
    var avatarTypeOptions = {
      getTileUrl: function(coord, zoom) {
        var coord = this.getNormalizedCoord(coord, zoom);
        if (!coord) { return null; }
        return "https://s3-us-west-1.amazonaws.com/lastairbnb/map/tile_" +
          zoom + "_" + coord.x + "-" + coord.y + ".png";
      }.bind(this),
      tileSize: new google.maps.Size(256, 256),
      maxZoom: 5,
      minZoom: 0,
      radius: 1738000,
    };

    var avatarMapType = new google.maps.ImageMapType(avatarTypeOptions);

    var mapOptions = {
      center: {
        lat: LastAirBnb.mapParams.lat || 27.21555620902969,
        lng: LastAirBnb.mapParams.lng || 2.1807861328125
      },
      zoom: LastAirBnb.mapParams.zoom || 3,
      streetViewControl: false,
      mapTypeControlOptions: { mapTypeIds: [MAP_TYPE] },
    };

    var map = new google.maps.Map(this.el, mapOptions);
    map.mapTypes.set(MAP_TYPE, avatarMapType);
    map.setMapTypeId(MAP_TYPE);
    return map;
  },

  attachMapListeners: function () {
    google.maps.event.addListener(this._map, 'idle', this.search.bind(this));
    google.maps.event.addListener(this._map, 'click', this.displayLatLng.bind(this));
  },

  search: function (event) {
    LastAirBnb.setParams({
      lat: this._map.getCenter().lat(),
      lng: this._map.getCenter().lng(),
      zoom: this._map.getZoom()
    });

    var mapBounds = this._map.getBounds();
    var ne = mapBounds.getNorthEast();
    var sw  = mapBounds.getSouthWest();

    var filterData = {
      lat: [sw.lat(), ne.lat()],
      lng: [sw.lng(), ne.lng()],
      priceRange: $('#price-range').slider('values'),
      priceMax: $('#price-range').slider('option').max,
    };

    this.collection.fetch({
      data: { filter_data: filterData }
    });
  },

  addMarker: function (listing) {
    if (this._markers[listing.id]) { return };
    var view = this;

    var latLng = new google.maps.LatLng(
      listing.get('lat'), listing.get('lng')
    );

    // var marker = new google.maps.Marker({
    //   position: latLng,
    //   map: this._map,
    //   title: listing.get('title')
    // });

    marker = new ListingMarker({
      position: latLng,
      map: this._map,
      marker_id: '123',
      listing: listing,
    });

    // google.maps.event.addListener(marker, 'click', function (event) {
    // });

    // google.maps.event.addDomListener(marker.el, "click", function(event) {
    //   google.maps.event.trigger(self, "click");
    //   console.log('clicked ' + listing.escape('name'));
    //   // alert('You clicked on a custom marker!');
    // });

    this._markers[listing.id] = marker;
  },

  removeMarker: function (listing) {
    if (!this._markers[listing.id]) { return };
    var marker = this._markers[listing.id];
    marker.setMap(null);
    delete this._markers[listing.id];
  },

  showMarkerInfo: function (event, marker) {
    var infoWindow = new google.maps.InfoWindow({
      content: marker.title
    });
    infoWindow.open(this._map, marker);
  },

  attachLabels: function () {
    var locations  = LastAirBnb.Locations;

    var styles = {
      'city': {
        fontSize: 16,
        minZoom: 3,
      },
      'minor': {
        fontSize: 14,
        minZoom: 4,
        fontColor: 'rgba(255, 255, 255, 0.9)',
      },
      'geography': {
        fontSize: 18,
        minZoom: 3,
        maxZoom: 4,
      },
    }

    this._labels = []
    for(var name in locations) {
      var location = locations[name];
      var style = styles[location.styleType];
      this._labels.push(new MapLabel({
        text:         name,
        position:     new google.maps.LatLng(location.lat, location.lng),
        map:          this._map,
        fontSize:     style.fontSize     || 14,
        fontColor:    style.fontColor    || '#eee',
        fontFamily:   style.fontFamily   || 'Helvetica Neue',
        minZoom:      style.minZoom      || 3,
        maxZoom:      style.maxZoom      || 5,
        strokeWeight: style.strokeWeight || 2,
        strokeColor:  style.strokeColor  || '#000',
        align:        style.align        || 'center',
      }));
    };
  },

  remove: function () {
    LastAirBnb.Map = null;
    Backbone.View.prototype.remove.call(this);
  },

  highlightMarker: function (listingId) {
    this._markers[listingId].highlight();
  },

  unhighlightMarker: function (listingId) {
    this._markers[listingId].unhighlight();
  },

  displayLatLng: function (event) {
    console.log('lat: ' + event.latLng.lat() + ', lng: ' + event.latLng.lng());
  },

  getNormalizedCoord: function(coord, zoom) {
    var y = coord.y, x = coord.x;
    var tileRange = 1 << zoom;
    if (y < 0 || y >= tileRange) {
      return null;
    }
    if (x < 0 || x >= tileRange) {
      x = (x % tileRange + tileRange) % tileRange;
    }
    return { x: x, y: y };
  },

});
