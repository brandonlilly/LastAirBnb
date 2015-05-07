$.Carousel = function (el) {
  this.$el = $(el);
  this.activeIdx = 0;
  this.$imgs = this.$el.find('.carousel-img');

  if (this.$imgs.length > 1) {
    $left =  $('<div class="cycle-left"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></div>');
    $right = $('<div class="cycle-right"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></div>');
    this.$el.append($left).append($right);

    $left.on('click', this.cycle.bind(this, -1));
    $right.on('click', this.cycle.bind(this, 1));
  }
};

$.Carousel.prototype.cycle = function (dir, event) {
  event.preventDefault();
  this.$imgs.eq(this.activeIdx).removeClass('active');
  this.activeIdx = (this.activeIdx + dir) % (this.$imgs.length);
  this.$imgs.eq(this.activeIdx).addClass('active');
};


$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};
