$(function(){
	var savePadrino = function() {
		$('#f_add_padrino').submit();
		return false;
	};
	
	$("#btn-save-padrino").button().live('click', savePadrino);
	
});
