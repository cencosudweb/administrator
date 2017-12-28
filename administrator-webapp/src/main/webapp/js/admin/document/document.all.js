$(function(){
	var addDocument = function() {
		location.href = "addDocument";
		return false;
	};
	
	$("#btn-add-document").button().live('click', addDocument);
	
	var deleteDocument = function() {
		$("#f_lock").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deleteDocument);
	
	var setDocumentId = function(){
		var idDocument = $(this).attr("iddocument");
		var modo = $(this).attr("modo");
		$("#id_document").val(idDocument);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setDocumentId);
	
	
	var allDocument = function() {
		$('#f_all_document').submit();
		return false;
	};
	
	$("#btn-all-document").button().live('click', allDocument);
	
});
