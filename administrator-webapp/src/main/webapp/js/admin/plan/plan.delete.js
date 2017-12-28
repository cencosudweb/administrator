$(function(){
	var addPlan = function() {
		location.href = "addPlan";
		return false;
	};
	
	$("#btn-add-plan").button().live('click', addPlan);
	
	var deletePlan = function() {
		var idPlan = $(this).attr("idplan");
		$("#id_plan").val(idPlan);
	};
	
	$(".btn-danger").button().live('click', deletePlan);
	
	var setPlanId = function(){
		var idPlan = $(this).attr("idplan");
		$("#id_plan").val(idPlan);
	};
	
	$(".lockUnlock").button().live('click', setPlanId);
	
});
