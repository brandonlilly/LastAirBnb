LastAirBnb.Collections.Listings = Backbone.Collection.extend({
  url: '/api/listings',
  model: LastAirBnb.Models.Listing,
  
});
