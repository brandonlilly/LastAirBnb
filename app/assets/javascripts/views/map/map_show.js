LastAirBnb.Views.MapShow = Backbone.View.extend({

  attributes: {
    id: "map-canvas"
  },

  initialize: function () {
    this._markers = {};

    this.listenTo(this.collection, 'add', this.addMarker);
    this.listenTo(this.collection, 'remove', this.removeMarker);
  },

  initMap: function () {
    console.log('initializing map');
    var mapOptions = {
      center: { lat: 37.7833, lng: -122.4167},
      zoom: 12
    };
    this._map = new google.maps.Map(this.el, mapOptions);

    this.collection.each(this.addMarker.bind(this));
    this.attachMapListeners();
  },

  attachMapListeners: function () {
    google.maps.event.addListener(this._map, 'idle', this.search.bind(this));
  },

  search: function (event) {
    console.log('searching');
    var mapBounds = this._map.getBounds();
    var ne = mapBounds.getNorthEast();
    var sw  = mapBounds.getSouthWest();

    var filterData = {
      lat: [sw.lat(), ne.lat()],
      lng: [sw.lng(), ne.lng()],
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

    var marker = new google.maps.Marker({
      position: latLng,
      map: this._map,
      title: listing.get('title')
    });

    google.maps.event.addListener(marker, 'click', function (event) {
      view.showMarkerInfo(event, marker);
    });

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

});
