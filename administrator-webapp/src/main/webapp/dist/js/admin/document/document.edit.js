$(function(){
	var saveDocument = function() {
		//TODO reemplazar por ajax
		$('#f_edit_document').submit();
		return false;
	};
	
	$("#btn-save-document").button().live('click', saveDocument);
	
});
