LastAirBnb.Views.ReservationsIndex = Backbone.View.extend({
  template: JST['reservations/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ reservations: this.collection });
    this.$el.html(content);
    return this;
  },

});
