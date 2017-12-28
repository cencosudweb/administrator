$(function(){
	var saveEdit = function() {
		$('#f_edit_contraparte').submit();
		return false;
	};
	
	$("#btn-save-contraparte").button().live('click', saveEdit);
	
});
