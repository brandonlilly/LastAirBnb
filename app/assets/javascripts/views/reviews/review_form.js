LastAirBnb.Views.ReviewForm = Backbone.View.extend({
  template: JST['reviews/form'],
  tagName: 'form',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    return this;
  },

});
