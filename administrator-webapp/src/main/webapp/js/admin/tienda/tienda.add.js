$(function(){
	var saveTienda = function() {
		$('#f_add_tienda').submit();
		return false;
	};
	
	$("#btn-save-tienda").button().live('click', saveTienda);
	
});
