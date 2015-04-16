LastAirBnb.Views.SearchForm = Backbone.View.extend({
  template: JST['root/search_form'],
  tagName: 'form',
  className: 'navbar-form navbar-left',
  events: {
    'submit': 'search',
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    var locations = [];
    for(var k in LastAirBnb.Locations) locations.push(k);

    this.$('input').autocomplete({
      source: locations,
      autoFocus: true,
      minLength: 0,
      appendTo: this.$('.search-input-wrap'),
    });

    return this;
  },

  search: function (event) {
    event.preventDefault();
    var location = this.$('input').val();
    LastAirBnb.setParams(LastAirBnb.Locations[location]);
    Backbone.history.navigate('#/search', { trigger: true });
  },

});
