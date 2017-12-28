$(function(){
	var saveEdit = function() {
		$('#f_edit_tienda').submit();
		return false;
	};
	
	$("#btn-save-tienda").button().live('click', saveEdit);
	
});
