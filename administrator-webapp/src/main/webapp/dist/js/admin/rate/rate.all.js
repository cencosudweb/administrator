$(function(){
	var addRate = function() {
		location.href = "addRate";
		return false;
	};
	
	$("#btn-add-rate").button().live('click', addRate);
	
	var deleteRate = function() {
		$("#f_delete").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deleteRate);
	
	var setRateId = function(){
		var idRate = $(this).attr("idrate");
		var modo = $(this).attr("modo");
		$("#id_rate").val(idRate);
		$("#modo").val(modo);
	};
	
	$(".delete").button().live('click', setRateId);
	
	
	var allRate = function() {
		$('#f_all_rate').submit();
		return false;
	};
	
	$("#btn-all-rate").button().live('click', allRate);
	
});
