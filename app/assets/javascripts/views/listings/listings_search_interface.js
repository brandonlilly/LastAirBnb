LastAirBnb.Views.ListingsSearchInterface = Backbone.View.extend({
  template: JST['listings/search_interface'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.minPrice = 10, this.maxPrice = 1000;
    this.lowPrice = LastAirBnb.searchParams.lowPrice || this.minPrice;
    this.highPrice = LastAirBnb.searchParams.highPrice || this.maxPrice;
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
        this.setPrices(ui.values[0], ui.values[1])
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

  setPrices: function (lowPrice, highPrice) {
    this.lowPrice = lowPrice;
    this.highPrice = highPrice;
    LastAirBnb.searchParams.lowPrice = lowPrice;
    LastAirBnb.searchParams.highPrice = highPrice;
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
