$(document).ready(function() {
  if ($('.alert.alert-dismissable.hide-alert').length) {
    setTimeout(function() {
      // $('.alert.alert-dismissable.hide-alert').hide(3000)
      $('.alert.alert-dismissable.hide-alert').slideUp(3000);
    }, 10000);
  }
});
