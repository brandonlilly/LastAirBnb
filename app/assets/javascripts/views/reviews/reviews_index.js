LastAirBnb.Views.ReviewsIndex = Backbone.View.extend({
  template: JST['reviews/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ reviews: this.collection });
    this.$el.html(content);

    this.collection.each(function (review) {
      var view = new LastAirBnb.Views.ReviewShow({ model: review });
      this.$('.review-list').append(view.render().$el);
    }, this);
    return this;
  },

});
