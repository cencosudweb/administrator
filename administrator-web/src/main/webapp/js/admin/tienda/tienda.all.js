$(function(){
	var addTienda = function() {
		location.href = "addTienda";
		return false;
	};
	
	$("#btn-add-tienda").button().live('click', addTienda);
	
	var deleteTienda = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteTienda);
	
	var setTiendaId = function(){
		var idTienda = $(this).attr("idtienda");
		var modo = $(this).attr("modo");
		$("#id_tienda").val(idTienda);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setTiendaId);
	
});
