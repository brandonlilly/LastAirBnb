LastAirBnb.Models.Review = Backbone.Model.extend({
  urlRoot: '/api/reviews',

  user: function () {
    if (this._user) {
      return this._user;
    }
    this._user = new LastAirBnb.Models.User();
    return this._user;
  },

  date: function () {
    var months = [
        "January", "February", "March", "April", "May", "June", "July",
        "August", "September", "October", "November", "December"
    ];
    var date = new Date(this.escape('created_at'));
    return months[date.getMonth()] + " " + date.getFullYear();
  },

  parse: function (response) {
    if (response.user) {
      this.user().set(response.user, { parse: true });
      delete response.user;
    }
    return response;
  }

});
