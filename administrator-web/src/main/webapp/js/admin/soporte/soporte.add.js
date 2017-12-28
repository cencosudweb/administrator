$(function(){
	var saveSoporte = function() {
		$('#f_add_soporte').submit();
		return false;
	};
	
	$("#btn-save-soporte").button().live('click', saveSoporte);
	
});
