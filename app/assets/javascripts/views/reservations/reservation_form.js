LastAirBnb.Views.ReservationForm = Backbone.View.extend({
  template: JST['reservations/form'],
  tagName: 'form',
  className: 'reservation-form',

  events: {
    'submit': 'requestBooking'
  },

  initialize: function (options) {
    this.listing = options.listing;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ reservation: this.model, listing: this.listing });
    this.$el.html(content);
    this.$('.datepicker').datepicker({
      minDate: 0
    });
    return this;
  },

  requestBooking: function (event) {
    event.preventDefault();

    var reservation = this.$el.serializeJSON().reservation;
    var attrs = {
      start_date: this._convertDate(reservation.start_date),
      end_date: this._convertDate(reservation.end_date),
      guests: reservation.guests,
      listing_id: this.listing.id
    };

    this.model.save(attrs, {
      success: function (model) {
        console.log('successful reservation request');
      }.bind(this)
    });
  },

  _convertDate: function (date) {
    return date.substring(6) + "/" + date.substring(0,5);
  }

});
