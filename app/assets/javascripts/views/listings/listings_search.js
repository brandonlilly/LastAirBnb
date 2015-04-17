LastAirBnb.Views.ListingsSearch = Backbone.View.extend({
  template: JST['listings/search'],

  initialize: function () {
    console.log('listingsSearch initialize');
    this.mapShow = new LastAirBnb.Views.MapShow({
      collection: this.collection
    });

    this.listingsSearchInterface = new LastAirBnb.Views.ListingsSearchInterface({
      collection: this.collection
    });
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.$('.search-interface').html(this.listingsSearchInterface.render().$el);
    this.$('.search-map').html(this.mapShow.$el);
    this.mapShow.initMap();
    return this;
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this);
    this.mapShow.remove();
    this.listingsSearchInterface.remove();
  }

});
