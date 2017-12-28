$(function(){
	var saveGerente = function() {
		$('#f_add_gerente').submit();
		return false;
	};
	
	$("#btn-save-gerente").button().live('click', saveGerente);
	
});
