LastAirBnb.Models.Review = Backbone.Model.extend({
  urlRoot: '/api/reviews',

  user: function () {
    if (this._user) {
      return this._user;
    }
    this._user = new LastAirBnb.Models.User();
    return this._user;
  },

  parse: function (response) {
    if (response.user) {
      this.user().set(response.user, { parse: true });
      delete response.user;
    }
    return response;
  }

});
