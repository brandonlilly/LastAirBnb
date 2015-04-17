LastAirBnb.Views.WelcomeView = Backbone.View.extend({
  template: JST['root/welcome'],
  events: {
    'click .discover-item': 'discoverSearch',
  },

  initialize: function () {
    this.homeSearch = new LastAirBnb.Views.HomeSearchView();
    $('.navbar').addClass('welcome-style');

  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.$('.home-search').html(this.homeSearch.render().$el);
    return this;
  },

  remove: function () {
    this.homeSearch.remove();
    $('.navbar').removeClass('welcome-style');
    Backbone.View.prototype.remove.call(this);
  },

  discoverSearch: function (event) {
    var location = $(event.currentTarget).find('h2').html();
    LastAirBnb.setParams(LastAirBnb.Locations[location]);
    Backbone.history.navigate('#/search', { trigger: true });
  },

});
