LastAirBnb.Views.ReservationForm = Backbone.View.extend({
  template: JST['reservations/form'],
  // tagName: 'form',
  className: 'reservation-form',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ reservation: this.model });
    this.$el.html(content);
    this.$('.datepicker').datepicker();
    return this;
  },

});
