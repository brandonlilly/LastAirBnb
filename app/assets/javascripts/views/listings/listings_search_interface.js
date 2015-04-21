LastAirBnb.Views.ListingsSearchInterface = Backbone.View.extend({
  template: JST['listings/search_interface'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.minPrice = 10, this.maxPrice = 4000;
    this.lowPrice = LastAirBnb.searchParams.lowPrice || this.minPrice;
    this.highPrice = LastAirBnb.searchParams.highPrice || this.maxPrice;
    this._listItems = [];
  },

  render: function () {
    var content = this.template({
      guests: LastAirBnb.searchParams.guests,
      checkin: LastAirBnb.searchParams.checkin,
      checkout: LastAirBnb.searchParams.checkout,
    });
    this.$el.html(content);
    this.$('#checkin').datepicker({ minDate: 0 });
    this.$('#checkout').datepicker({ minDate: 1 });

    var $priceRange = this.$("#price-range");
    $priceRange.slider({
      range: true,
      min: this.minPrice,
      max: this.maxPrice,
      values: [this.lowPrice, this.highPrice],
      slide: function (event, ui) {
        this.setPrices(ui.values[0], ui.values[1])
        this.updateRangeIndicator();
      }.bind(this),
      stop: function (event, ui) {
        this.renderListItems();
      }.bind(this)
    });

    this.updateRangeIndicator();
    this.renderListItems();

    return this;
  },

  filterListings: function (listings) {
    return new LastAirBnb.Collections.Listings(
      listings.filter(function (listing) {
        if (listing.get('price') >= this.highPrice && this.highPrice >= this.maxPrice) {
          return true;
        }
        return listing.get('price') >= this.lowPrice && listing.get('price') <= this.highPrice;
      }.bind(this))
    );
  },

  removeListItems: function () {
    this._listItems.forEach(function (view) {
      view.remove();
    });
    this._listItems = [];
  },

  renderListItems: function (listings) {
    this.removeListItems();
    this.filterListings(this.collection).forEach(function (listing) {
      var view = new LastAirBnb.Views.ListingListItem({ model: listing });
      this._listItems.push(view);
      this.$('.listings-items').append(view.render().$el);
    }.bind(this));
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
  },

  remove: function () {
    this.removeListItems();
    Backbone.View.prototype.remove.call(this);
  }

});
