$(function(){
	var savePlan = function() {
		//TODO reemplazar por ajax
		$('#f_edit_plan').submit();
		return false;
	};
	
	$("#btn-save-plan").button().live('click', savePlan);
	
});
