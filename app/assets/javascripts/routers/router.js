LastAirBnb.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'listings/:id': 'show',
    'listings': 'index',
    'search': 'search',
  },

  initialize: function (options) {
    console.log('router initialize');
    this.$rootEl = options.$rootEl;
  },

  show: function (id) {
    console.log('show');

    var listing = new LastAirBnb.Models.Listing({ id: id });
    listing.fetch();
    var view = new LastAirBnb.Views.ListingShow({
      model: listing
    });
    this._swapView(view);
  },

  index: function () {
    console.log('index');

    var listings = new LastAirBnb.Collections.Listings();
    listings.fetch();
    var view = new LastAirBnb.Views.ListingsIndex({
      collection: listings
    });
    this._swapView(view);
  },

  search: function () {
    console.log('search');

    var listings = new LastAirBnb.Collections.Listings();
    listings.fetch();
    var view  = new LastAirBnb.Views.ListingsSearch({
      collection: listings
    });
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }

});
