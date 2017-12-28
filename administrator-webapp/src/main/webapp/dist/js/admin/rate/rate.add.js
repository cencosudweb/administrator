$(function(){
	var saveRate = function() {
		//TODO reemplazar por ajax
		
		$('#f_add_rate').submit();
		return false;
	};
	
	$("#btn-save-rate").button().live('click', saveRate);
	
	$('#select_rol').change(function() {
		if ($(this).attr('value') == '2') {
			$('#div_instituciones_financieras').show('slow', function() {});
			$('#div_comercios').hide('slow', function() {});
			$("#typeSelectedId").val("2");
		} else {
			$('#div_instituciones_financieras').hide('slow', function() {});
			$('#div_comercios').show('slow', function() {});
			$("#typeSelectedId").val("3");
		}
	});
	
});
