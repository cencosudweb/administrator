$(function(){
	var addDocument = function() {
		location.href = "addDocument";
		return false;
	};
	
	$("#btn-add-document").button().live('click', addDocument);
	
	var deleteDocument = function() {
		var idDocument = $(this).attr("iddocument");
		$("#id_document").val(idDocument);
	};
	
	$(".btn-danger").button().live('click', deleteDocument);
	
	var setDocumentId = function(){
		var idDocument = $(this).attr("iddocument");
		$("#id_document").val(idDocument);
	};
	
	$(".lockUnlock").button().live('click', setDocumentId);
	
});
