LastAirBnb.Views.ListingListItem = Backbone.View.extend({
  template: JST['listings/list_item'],
  className: 'listing-item col-md-6 col-space-2',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ listing: this.model });
    this.$el.html(content);
    return this;
  },

});
