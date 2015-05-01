LastAirBnb.Modals.LoginModal = Backbone.Modal.extend({
  template: JST['users/login_modal'],

  viewContainer: '.my-container',
  submitEl: '.bbm-button',

  views: {
    'click #login-tab': {
      name: 'login-tab',
      view: JST['users/login_form'],
      onActive: 'setActive'
    },
    'click #signin-tab': {
      name: 'signin-tab',
      view: JST['users/signin_form'],
      onActive: 'setActive'
    }
  },

  setActive: function(options) {
    this.$('.bbm-modal__tab a').removeClass('active');
    this.$('#'+options.name).addClass('active');
  }
});
