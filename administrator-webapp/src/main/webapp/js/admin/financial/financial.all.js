$(function(){
	var addFinancial = function() {
		location.href = "addFinancial";
		return false;
	};
	
	$("#btn-add-financial").button().live('click', addFinancial);
	
	var deleteFinancial = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteFinancial);
	
	var setFinancialId = function(){
		var idFinancial = $(this).attr("idfinancial");
		var modo = $(this).attr("modo");
		$("#id_financial").val(idFinancial);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setFinancialId);
	
});
