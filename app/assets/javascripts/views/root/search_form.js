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
    for(var k in LastAirBnb.Locations) {
      if (LastAirBnb.Locations[k].searchable) locations.push(k);
    }

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
    var location = LastAirBnb.Locations[this.$('input').val()];
    if (location) {
      LastAirBnb.setParams(location);
    }

    if (LastAirBnb.Map) {
      LastAirBnb.Map.setCenter({
        lat: LastAirBnb.mapParams.lat,
        lng: LastAirBnb.mapParams.lng
      });
      LastAirBnb.Map.setZoom(LastAirBnb.mapParams.zoom);
    } else {
      Backbone.history.navigate('#/search', { trigger: true });
    }

  },

});
