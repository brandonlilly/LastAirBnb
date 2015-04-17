window.LastAirBnb = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Locations: {},
  mapParams: {},
  searchParams: {},
  initialize: function() {
    console.log('Backbone starting up');
    new LastAirBnb.Routers.Router({ $rootEl: $('#main') });

    this.searchForm = new LastAirBnb.Views.SearchForm();
    this.$search = $('#search');
    this.$search.html(this.searchForm.render().$el);

    Backbone.history.start();
  },

  setParams: function (params) {
    this.mapParams.lat = params.lat;
    this.mapParams.lng = params.lng;
    this.mapParams.zoom = params.zoom;
  },

};

$(document).ready(function(){
  if (window.location.pathname === '/') {
    LastAirBnb.initialize();
  }
});
