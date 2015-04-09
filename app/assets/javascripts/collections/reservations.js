LastAirBnb.Collections.Reservations = Backbone.Collection.extend({
  url: '/api/reservations',
  model: LastAirBnb.Models.Reservation,

});
