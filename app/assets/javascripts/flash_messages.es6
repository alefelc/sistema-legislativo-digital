$(document).on('ready', () => {
  if ($('.alert.alert-dismissable.hide-alert').length) {
    setTimeout(function() {
      $('.alert.alert-dismissable.hide-alert').hide(3000)
    }, 10000);
  }
});
