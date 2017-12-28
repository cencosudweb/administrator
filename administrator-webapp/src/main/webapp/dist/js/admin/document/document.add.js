$(function(){
	var saveDocument = function() {
		//TODO reemplazar por ajax
		
		$('#f_add_document').submit();
		return false;
	};
	
	$("#btn-save-document").button().live('click', saveDocument);
	
	
	
});
