LastAirBnb.Views.ListingShow = Backbone.View.extend({
  template: JST['listings/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.reviews(), 'sync', this.render);

    this.reviewsIndex = new LastAirBnb.Views.ReviewsIndex({
      collection: this.model.reviews()
    });
  },

  render: function () {
    var content = this.template({ listing: this.model });
    this.$el.html(content);

    this.$('.reviews').append(this.reviewsIndex.render().$el);
    
    return this;
  },

  remove: function () {
    this.reviewsIndex.remove();
    Backbone.View.prototype.remove.call(this);
  }


});
