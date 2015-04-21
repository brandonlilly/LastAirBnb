LastAirBnb.Views.ListingShow = Backbone.View.extend({
  template: JST['listings/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.reviews(), 'sync', this.render);

    this.reviewsIndex = new LastAirBnb.Views.ReviewsIndex({
      collection: this.model.reviews()
    });
    this.reservationForm = new LastAirBnb.Views.ReservationForm({
      model: new LastAirBnb.Models.Reservation(),
      listing: this.model,
      guests: LastAirBnb.searchParams.guests,
      checkin: LastAirBnb.searchParams.checkin,
      checkout: LastAirBnb.searchParams.checkout,
    });
    this.photosPalette = new LastAirBnb.Views.PhotosPalette({
      collection: this.model.photos(),
      model: this.model,
    });
  },

  render: function () {
    var content = this.template({ listing: this.model });
    this.$el.html(content);

    this.$('.reviews').append(this.reviewsIndex.render().$el);
    this.$('.reservation').append(this.reservationForm.render().$el)
    this.$('.listing-photos').append(this.photosPalette.render().$el)
    this.reservationForm.delegateEvents();
    this.photosPalette.delegateEvents();
    this.reviewsIndex.delegateEvents();

    return this;
  },

  remove: function () {
    this.reviewsIndex.remove();
    this.reservationForm.remove();
    this.photosPalette.remove();
    Backbone.View.prototype.remove.call(this);
  }

});
