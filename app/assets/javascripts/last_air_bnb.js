window.LastAirBnb = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Backbone starting up');
    new LastAirBnb.Routers.Router({ $rootEl: $('#main') });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  if (window.location.pathname === '/') {
    LastAirBnb.initialize();
  }
});
