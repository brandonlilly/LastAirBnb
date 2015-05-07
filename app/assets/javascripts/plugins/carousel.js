$.Carousel = function (el) {
  // if (imgUrls.length < 2) {
  //   return;
  // }
  this.$el = $(el);
  this.activeIdx = 0;
  this.$imgs = this.$el.find('.cover-img');

  if (this.$imgs.length > 1) {
    $left =  $('<div class="cycle-left"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></div>');
    $right = $('<div class="cycle-right"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></div>');
    this.$el.append($left).append($right);

    $left.on('click', this.cycle.bind(this, -1));
    $right.on('click', this.cycle.bind(this, 1));
  }
};

$.Carousel.prototype.cycle = function (dir, event) {
  // if (this.transitioning)
  //   return;
  // this.transitioning = true;

  // var oldImg = this.$imgs.eq(this.activeIdx);
  // this.activeIdx = (this.activeIdx + dir) % (this.$imgs.length);
  // var activeImg = this.$imgs.eq(this.activeIdx);
  //
  // console.log(this.activeIdx);
  // (dir === 1) ? oldImg.addClass('right') : oldImg.addClass('left');
  // oldImg.one('transitionend', function() {
  //   oldImg.removeClass('active left right');
  //   this.transitioning = false;
  // }.bind(this));
  //
  // (dir === 1) ? activeImg.addClass('left') : activeImg.addClass('right');
  // activeImg.addClass('active');
  // setTimeout(function(){
  //   activeImg.removeClass('left right');
  // }, 0);



  this.$imgs.eq(this.activeIdx).removeClass('active');
  this.activeIdx = (this.activeIdx + dir) % (this.$imgs.length);
  this.$imgs.eq(this.activeIdx).addClass('active');

  // console.log(this.activeIdx);
  // var imgUrl = this.imgUrls[this.activeIdx]
  // this.$el.css('background-image', 'url(' + imgUrl + ')');

};


$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};
