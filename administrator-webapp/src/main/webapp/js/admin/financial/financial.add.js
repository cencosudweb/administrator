$(function(){
	var saveFinancial = function() {
		$('#f_add_financial').submit();
		return false;
	};
	
	$("#btn-save-financial").button().live('click', saveFinancial);
	
});
