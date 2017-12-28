$(function(){
	var addCardGroup = function() {
		location.href = "addCardGroup";
		return false;
	};
	
	$("#btn-add-cardGroup").button().live('click', addCardGroup);
	
	var addFileGroup = function() {
		location.href = "addFileGroup";
		return false;
	};
	
	$("#btn-add-fileGroup").button().live('click', addFileGroup);
	
	var deleteCardGroup = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteCardGroup);
	
	
	
	var setCardGroupId = function(){
		var idCardGroup = $(this).attr("idcardGroup");
		var modo = $(this).attr("modo");
		$("#id_cardGroup").val(idCardGroup);
		$("#modo").val(modo);
	};
	
	var exportCardGroup = function() {
		//alert('Export');
		location.href = "downloadExcelCardGroup";
		return false;
	};
	
	var exportCsvCardGroup = function() {
		alert('Export CSV');
		location.href = "viewCSVCardGroup";
		return false;
	};
	
	var exportPdfCardGroup = function() {
		alert('Export PDF');
		location.href = "downloadPDFCardGroup";
		return false;
	};
	
	$("#btn-export-cardgroup").button().live('click', exportCardGroup);
	$("#btn-export-csv-cardgroup").button().live('click', exportCsvCardGroup);
	$("#btn-export-pdf-cardgroup").button().live('click', exportPdfCardGroup);
	
	$(".lockUnlock").button().live('click', setCardGroupId);
	
});
