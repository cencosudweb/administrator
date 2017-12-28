$(function(){
	var addPadrino = function() {
		location.href = "addPadrino";
		return false;
	};
	
	$("#btn-add-padrino").button().live('click', addPadrino);
	
	var deletePadrino = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deletePadrino);
	
	var setPadrinoId = function(){
		var idPadrino = $(this).attr("idpadrino");
		var modo = $(this).attr("modo");
		$("#id_padrino").val(idPadrino);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setPadrinoId);
	
});
