$(function(){
	var addPauta = function() {
		location.href = "addPauta";
		return false;
	};
	
	$("#btn-add-pauta").button().live('click', addPauta);
	
	var deletePauta = function() {
		var idPauta = $(this).attr("idpauta");
		$("#id_pauta").val(idPauta);
	};
	
	$(".btn-danger").button().live('click', deletePauta);
	
	var setPautaId = function(){
		var idPauta = $(this).attr("iduser");
		$("#id_pauta").val(idPauta);
	};
	
	$(".lockUnlock").button().live('click', setPautaId);
	
});
