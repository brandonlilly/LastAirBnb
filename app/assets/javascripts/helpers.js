_.extend(Backbone.View.prototype, {
  _convertDate: function (date) {
    return date.substring(6) + "/" + date.substring(0,5);
  },
});
