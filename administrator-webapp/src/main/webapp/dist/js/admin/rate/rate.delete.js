$(function(){
	var addRate = function() {
		location.href = "addRate";
		return false;
	};
	
	$("#btn-add-rate").button().live('click', addRate);
	
	var deleteRate = function() {
		var idRate = $(this).attr("idrate");
		$("#id_rate").val(idRate);
	};
	
	$(".btn-danger").button().live('click', deleteRate);
	
	var setRateId = function(){
		var idRate = $(this).attr("idrate");
		$("#id_rate").val(idRate);
	};
	
	$(".lockUnlock").button().live('click', setRateId);
	
});
