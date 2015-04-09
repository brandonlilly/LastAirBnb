LastAirBnb.Views.MapShow = Backbone.View.extend({

  attributes: {
    id: "map-canvas"
  },

  initialize: function () {
    this._markers = {};
  },

  initMap: function () {
    console.log('initializing map');
    var mapOptions = {
      center: { lat: 37.7833, lng: -122.4167},
      zoom: 12
    };
    this._map = new google.maps.Map(this.el, mapOptions);
  },


});
