LastAirBnb.Views.PhotosPalette = Backbone.View.extend({
  template: JST['photos/palette'],

  initialize: function (options) {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var curatedPhotos = new LastAirBnb.Collections.Photos(
      this.collection.filter(function (photo) {
        return photo.get('url') !== this.model.get('cover_photo_url')
      }.bind(this))
    );
    var content = this.template({ photos: curatedPhotos });
    this.$el.html(content);
    return this;
  },

});
