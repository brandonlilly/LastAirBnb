LastAirBnb.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  href: function () {
    return '#/users/' + this.id;
  },

});
