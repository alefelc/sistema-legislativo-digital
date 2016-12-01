class Initiator {
  static updateType() {
    $('#initiator-new .legal-person').hide()
    $('#initiator-new').on('change', '#person_type', () => {
      if ($('#person_type').val() == 'Fisica') {
        $('#initiator-new .legal-person').hide(1000)
        $('#initiator-new .person').show(1000)
      } else {
        $('#initiator-new .legal-person').show(1000)
        $('#initiator-new .person').hide(1000)
      }
    })
  }
  static submitModal() {
    $('form.new_person').on('ajax:success', () => {
      $('#initiator-new.modal').modal('hide');
    });
    $('#initiator-new').on('ajax:error', () => {
      alert('Something went wrong!');
    });
  }
}
