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
    var content = this.template({
      reservation: this.model,
      listing: this.listing,
      guests: LastAirBnb.searchParams.guests,
      checkin: LastAirBnb.searchParams.checkin,
      checkout: LastAirBnb.searchParams.checkout,
    });
    this.$el.html(content);
    this.$('#checkin').datepicker({ minDate: 0 });
    this.$('#checkout').datepicker({ minDate: 1 });
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

      }.bind(this),
      error: function () {
        if (reservation.start_date && reservation.end_date) {
          $('.reservation-errors').html('You must be logged in!');
        } else {
          $('.reservation-errors').html('You must choose valid dates!');
        }
      }
    });
  },

});
