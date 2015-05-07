LastAirBnb.Views.ListingListItem = Backbone.View.extend({
  template: JST['listings/list_item'],
  className: 'listing-item col-md-6',

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render);
    this.mapShow = options.mapShow;
  },

  render: function () {
    var content = this.template({ listing: this.model });
    this.$el.html(content);
    this.$('.img-viewport').carousel();
    return this;
  },

});
