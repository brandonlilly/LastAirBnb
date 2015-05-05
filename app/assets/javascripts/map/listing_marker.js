// http://humaan.com/custom-html-markers-google-maps/

ListingMarker = function (options) {
	this.options = 	options;
  this.latlng = 	options.position;
	this.listing =  options.listing;
	this.template = JST['listings/listing_marker'];

	this.setMap(options.map);
};

ListingMarker.prototype = new google.maps.OverlayView();

ListingMarker.prototype.draw = function() {
  if (!this.el) {
		this.el = this.el = document.createElement('div');
		this.el.className = 'listing-marker';
		this.el.innerHTML = this.template({ listing: this.listing });

		if (typeof(this.options.marker_id) !== 'undefined') {
			this.el.dataset.marker_id = this.options.marker_id;
		}

		google.maps.event.addDomListener(this.el, "click", function(event) {
			// console.log('You clicked on ' + this.listing.escape('title') + '!');
			google.maps.event.trigger(self, "click");
		}.bind(this));

		var panes = this.getPanes();
		panes.overlayImage.appendChild(this.el);
	}

	var point = this.getProjection().fromLatLngToDivPixel(this.latlng);

	if (point) {
		this.el.style.left = (point.x - this.el.offsetWidth / 2) + 'px';
		this.el.style.top = (point.y - 40) + 'px';
	}
};

ListingMarker.prototype.remove = function() {
	if (this.el) {
		this.el.parentNode.removeChild(this.el);
		this.el = null;
	}
};

ListingMarker.prototype.getPosition = function() {
	return this.latlng;
};

ListingMarker.prototype.highlight = function() {
	if (this.el) {
		this.el.classList.add('active');
	}
};

ListingMarker.prototype.unhighlight = function() {
	if (this.el) {
		this.el.classList.remove('active');
	}
};
