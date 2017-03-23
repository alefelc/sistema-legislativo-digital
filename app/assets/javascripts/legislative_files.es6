$(document).on('ready', function() {
	if ($('#legislative-file-show').length) {
		$('input, textarea, select').prop('disabled', true);
	}
});
