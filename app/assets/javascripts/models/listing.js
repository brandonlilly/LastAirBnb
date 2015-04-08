LastAirBnb.Models.Listing = Backbone.Model.extend({
  urlRoot: '/api/listings',

  href: function () {
    return '#/listings/' + this.id;
  },

  reviews: function () {
    if (this._reviews) {
      return this._reviews;
    }
    this._reviews = new LastAirBnb.Collections.Reviews();
    return this._reviews;
  },

  parse: function (response) {
    if (response.home_type) {
      this.set('home_type', response.home_type.name);
      delete response.home_type;
    }
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews;
    }
    return response;
  }

});
