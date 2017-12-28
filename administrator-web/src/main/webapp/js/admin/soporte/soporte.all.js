$(function(){
	var addSoporte = function() {
		location.href = "addSoporte";
		return false;
	};
	
	$("#btn-add-soporte").button().live('click', addSoporte);
	
	var deleteSoporte = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteSoporte);
	
	var setSoporteId = function(){
		var idSoporte = $(this).attr("idsoporte");
		var modo = $(this).attr("modo");
		$("#id_soporte").val(idSoporte);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setSoporteId);
	
});
