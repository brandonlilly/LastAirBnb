LastAirBnb.Views.ReviewShow = Backbone.View.extend({
  template: JST['reviews/show'],
  tagName: 'li',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    return this;
  },

});
