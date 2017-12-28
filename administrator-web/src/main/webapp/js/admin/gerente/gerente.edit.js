$(function(){
	var saveEdit = function() {
		$('#f_edit_gerente').submit();
		return false;
	};
	
	$("#btn-save-gerente").button().live('click', saveEdit);
	
});
