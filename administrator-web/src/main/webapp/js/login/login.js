$(function() {
	$(function() {
		$('#btn-login').click(function() {
			alert('ok');
			$('#f_login').submit();
		});
	});

	$(function() {
		$('#btn-reset').click(function() {
			$('#f_reset').submit();
		});
	});
	
	$(function() {
		$('#btn-show-question').click(function() {
			$('#f_forgot').submit();
		});
	});
	
	$('#j_password').keypress(function(e) {
		if (e.which == 13) {
			e.preventDefault();
			$('#f_login').submit();
		}
	});
});
