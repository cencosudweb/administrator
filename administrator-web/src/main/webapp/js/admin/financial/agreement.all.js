$(function(){
	var addAgreement = function() {
		location.href = "addAgreement";
		return false;
	};
	
	$("#btn-add-agreement").button().live('click', addAgreement);
	
	var deleteAgreement = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteAgreement);
	
	var setAgreementId = function(){
		var idFinancial = $(this).attr("idagreement");
		var modo = $(this).attr("modo");
		$("#id_agreement").val(idFinancial);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setAgreementId);
	
});
