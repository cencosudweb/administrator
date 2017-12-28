$(function(){
	var saveEdit = function() {
		$('#f_edit_soporte').submit();
		return false;
	};
	
	$("#btn-save-soporte").button().live('click', saveEdit);
	
});
