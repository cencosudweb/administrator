$(function(){
	var saveEdit = function() {
		$('#f_edit_provider').submit();
		return false;
	};
	
	$("#btn-save-provider").button().live('click', saveEdit);
	
});
