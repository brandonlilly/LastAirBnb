LastAirBnb.Models.Listing = Backbone.Model.extend({
  urlRoot: '/api/listings',

  href: function () {
    return '#/listings/' + this.id;
  },

});
