LastAirBnb.Views.HomeSearchView = Backbone.View.extend({
  template: JST['root/home_search'],
  tagName: 'form',
  events: {
    'submit': 'submit'
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.$('#checkin').datepicker({ minDate: 0 });
    this.$('#checkout').datepicker({ minDate: 1 });

    var locations = [];
    for(var k in LastAirBnb.Locations) {
      if (LastAirBnb.Locations[k].searchable) locations.push(k);
    }

    this.$('.search-input').autocomplete({
      source: locations,
      autoFocus: true,
      minLength: 0,
      appendTo: this.$('.home-search-input-wrap'),
    });

    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var location = LastAirBnb.Locations[this.$('.search-input').val()];
    if (location) {
      LastAirBnb.setParams(location);
    }
    LastAirBnb.searchParams.checkIn = this.$('#checkin').val();
    LastAirBnb.searchParams.checkOut = this.$('#checkout').val();
    Backbone.history.navigate('#/search', { trigger: true });
  },

});
