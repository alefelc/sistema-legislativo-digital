$(document).on('ready', function() {
  if ($('#index-derivated-procedures').length) {
    $('#derivated-procedures-table').on('ajax:success', '.btn-confirm-derivation', function() {
      $('#derivated-procedures-table').dataTable().fnDraw();
    });
  }
});
