$(function(){
	var saveUser = function() {
		//TODO reemplazar por ajax
		
		$('#f_add_user').submit();
		return false;
	};
	
	$("#btn-save-user").button().live('click', saveUser);
	
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
