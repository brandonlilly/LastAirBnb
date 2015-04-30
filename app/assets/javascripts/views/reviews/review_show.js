LastAirBnb.Views.ReviewShow = Backbone.View.extend({
  template: JST['reviews/show'],
  tagName: 'div',
  className: 'review-item row',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    return this;
  },

});
