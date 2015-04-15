LastAirBnb.Views.ListingsSearchInterface = Backbone.View.extend({
  template: JST['listings/search_interface'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.minPrice = 10, this.maxPrice = 1000;
    this.lowPrice = this.minPrice, this.highPrice = this.maxPrice;
  },

  render: function () {
    var content = this.template({ listings: this.collection });
    this.$el.html(content);

    var $priceRange = this.$("#price-range");
    $priceRange.slider({
      range: true,
      min: this.minPrice,
      max: this.maxPrice,
      values: [this.lowPrice, this.highPrice],
      slide: function (event, ui) {
        this.lowPrice = ui.values[0];
        this.highPrice = ui.values[1];
        this.updateRangeIndicator();
      }.bind(this)
    });
    this.updateRangeIndicator();

    this.collection.forEach(function (listing) {
      var view = new LastAirBnb.Views.ListingListItem({ model: listing });
      this.$('.listings-items').append(view.render().$el);
    }.bind(this));

    return this;
  },

  updateRangeIndicator: function () {
    $("#price-min").html(this.lowPrice + ' yuan');
    if (this.highPrice < this.maxPrice) {
      $("#price-max").html(this.highPrice + ' yuan');
    } else {
      $("#price-max").html(this.maxPrice + '+ yuan');
    }
  }

});
