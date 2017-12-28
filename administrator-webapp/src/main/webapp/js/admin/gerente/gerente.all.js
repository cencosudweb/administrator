$(function(){
	var addGerente = function() {
		location.href = "addGerente";
		return false;
	};
	
	$("#btn-add-gerente").button().live('click', addGerente);
	
	var deleteGerente = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteGerente);
	
	var setGerenteId = function(){
		var idGerente = $(this).attr("idgerente");
		var modo = $(this).attr("modo");
		$("#id_gerente").val(idGerente);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setGerenteId);
	
});
