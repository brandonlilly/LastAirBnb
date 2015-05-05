LastAirBnb.Modals.LoginModal = Backbone.Modal.extend({
  template: JST['users/login_modal'],

  viewContainer: '.my-container',

  events: {
    'submit .login-form': 'login',
    'submit .signup-form': 'signup',
    'click  .guest-login': 'guestLogin',
  },

  views: {
    'click #login-tab': {
      name: 'login-tab',
      view: JST['users/login_form'],
      onActive: 'setActive'
    },
    'click #signup-tab': {
      name: 'signup-tab',
      view: JST['users/signup_form'],
      onActive: 'setActive'
    }
  },

  setActive: function(options) {
    this.$('.bbm-modal__tab a').removeClass('active');
    this.$('#'+options.name).addClass('active');
  },

  login: function (event) {
    if (event) {
      event.preventDefault();
    }
    var userData = $('.login-form').serializeJSON();

    $.ajax({
      url: '/sessions',
      type: 'POST',
      data: userData,
      success: function () {
        window.location.reload(true);
      },
      error: function (response) {
        this.$('.session-errors ul').html('<li>Invalid log in</li>');
        this.$('.session-errors').height(52);
      }.bind(this)
    });
  },

  signup: function (event) {
    event.preventDefault();
    var userData = $(event.currentTarget).serializeJSON();

    $.ajax({
      url: '/users',
      type: 'POST',
      data: userData,
      success: function () {
        window.location.reload(true);
      },
      error: function (response) {
        if (response.responseJSON) {
          var errors = '';
          response.responseJSON.forEach(function (error) {
            errors += ('<li>' + error + '</li>');
          });
          this.$('.session-errors ul').html(errors);
          this.$('.session-errors').height(37 * response.responseJSON.length + 15);
        }
      }.bind(this)
    });
  },

  guestLogin: function() {
    event.preventDefault();
    var email = 'korra@lastairbnb.com';
    var password = 'password';

    this.$('.session-errors').height(0);

    if (this.currentIndex !== 0) {
      this.openAt(0)
    }
    setTimeout(function () {
      this.animateInput('.login-email', email, function() {
        this.animateInput('.login-password', password, function () {
          this.login();
        }.bind(this))
      }.bind(this))
    }.bind(this), 0);
  },

  animateInput: function (selector, text, success) {
    var _index = 0;
    var textInterval = setInterval(function () {
      var $el = $(selector);
      var currentVal = $el.val();
      _index++;
      $el.val(text.substr(0, _index));
      if (_index >= text.length) {
        clearInterval(textInterval);
        success();
      }
    }.bind(this), 50);
  }

});
