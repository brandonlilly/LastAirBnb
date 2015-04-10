LastAirBnb.Views.ListingsSearchInterface = Backbone.View.extend({
  template: JST['listings/search_interface'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ listings: this.collection });
    this.$el.html(content);

    this.collection.forEach(function (listing) {
      var view = new LastAirBnb.Views.ListingListItem({ model: listing });
      this.$('.listings-items').append(view.render().$el);
    }.bind(this));

    return this;
  },

});
