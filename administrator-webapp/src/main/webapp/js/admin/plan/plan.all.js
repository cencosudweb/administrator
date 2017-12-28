$(function(){
	var addPlan = function() {
		location.href = "addPlan";
		return false;
	};
	
	$("#btn-add-plan").button().live('click', addPlan);
	
	var deletePlan = function() {
		$("#f_delete").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deletePlan);
	
	var setPlanId = function(){
		var idPlan = $(this).attr("idplan");
		var modo = $(this).attr("modo");
		$("#id_plan").val(idPlan);
		$("#modo").val(modo);
	};
	
	$(".delete").button().live('click', setPlanId);
	
	
	var allPlan = function() {
		$('#f_all_plan').submit();
		return false;
	};
	
	$("#btn-all-plan").button().live('click', allPlan);
	
});
