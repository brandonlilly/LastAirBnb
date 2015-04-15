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

  photos: function () {
    if (this._photos) {
      return this._photos;
    }
    this._photos = new LastAirBnb.Collections.Photos();
    return this._photos;
  },

  parse: function (response) {
    if (response.home_type) {
      this.set('home_type', response.home_type.name);
      delete response.home_type;
    }
    if (response.cover_photo) {
      this.set('cover_photo_url', response.cover_photo.url);
      delete response.cover_photo;
    }
    if (response.photos) {
      this.photos().set(response.photos, { parse: true });
      delete response.photos;
    }
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews;
    }
    return response;
  }

});
