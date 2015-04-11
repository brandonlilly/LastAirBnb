LastAirBnb.Views.ListingsSearchInterface = Backbone.View.extend({
  template: JST['listings/search_interface'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ listings: this.collection });
    this.$el.html(content);


    var minPrice = 10, maxPrice = 1000;
    var $priceRange = this.$("#price-range");
    $priceRange.slider({
      range: true,
      min: minPrice,
      max: maxPrice,
      slide: function (event, ui) {
        // debugger
        $("#price-min").html(ui.values[0] + ' yuan');
        if (ui.values[1] < maxPrice) {
          $("#price-max").html(ui.values[1] + ' yuan');
        } else {
          $("#price-max").html( maxPrice + '+ yuan');
        }
      }
    });

    // $priceRange.slider('option', 'slide').call($priceRange);

    // $("#price-min").html(minPrice + ' yuan');
    // $("#price-max").html(maxPrice + '+ yuan');

    this.collection.forEach(function (listing) {
      var view = new LastAirBnb.Views.ListingListItem({ model: listing });
      this.$('.listings-items').append(view.render().$el);
    }.bind(this));

    return this;
  },

});
