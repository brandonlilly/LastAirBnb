LastAirBnb.Collections.Listings = Backbone.Collection.extend({
  url: '/api/listings',
  model: LastAirBnb.Models.Listing,

  getOrFetch: function (id) {
    var listings = this;

    var listing = this.get(id);
    if (listing) {
      listing.fetch();
    } else {
      listing = new LastAirBnb.Models.Listing({ id: id });
      listing.fetch({
        success: function() {
          listings.add(listing);
        }
      });
    }

    return listing;
  }

});
