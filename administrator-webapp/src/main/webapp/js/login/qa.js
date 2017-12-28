$(function() {
	
	$('#btn-save-qa').click(function() {
		$('#f_qa').submit();
	});
	
	$('#btn-save-fqa').click(function() {
		$('#f_fqa').submit();
	});
		
	$('#select_q_1').change(function() {
		if ($(this).attr('value') == '-1') {
			$("#q_1").val("");
			$('#q_1').show('slow', function() {});
		} else {
			$("#q_1").val($(this).find(":selected").text());
			$('#q_1').hide('slow', function() {});
		}
	});
	
	$('#select_q_2').change(function() {
		if ($(this).attr('value') == '-1') {
			$("#q_2").val("");
			$('#q_2').show('slow', function() {});
		} else {
			$("#q_2").val($(this).find(":selected").text());
			$('#q_2').hide('slow', function() {});
		}
	});

	$('#select_q_3').change(function() {
		if ($(this).attr('value') == '-1') {
			$("#q_3").val("");
			$('#q_3').show('slow', function() {});
		} else {
			$("#q_3").val($(this).find(":selected").text());
			$('#q_3').hide('slow', function() {});
		}
	});
	
});
