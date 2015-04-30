LastAirBnb.Views.ReviewsIndex = Backbone.View.extend({
  template: JST['reviews/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this._reviews = [];
  },

  render: function () {
    var content = this.template({ reviews: this.collection });
    this.$el.html(content);

    this.removeReviews();
    this.collection.each(function (review) {
      var view = new LastAirBnb.Views.ReviewShow({ model: review });
      this.$('.review-list').append(view.render().$el);
      this._reviews.push(view);
    }, this);
    return this;
  },

  removeReviews: function () {
    this._reviews.forEach(function (review) {
      review.remove();
    });
    this._reviews = [];
  },

  remove: function () {
    this.removeReviews();
    Backbone.View.prototype.remove.call(this);
  },

});
