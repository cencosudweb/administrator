$(function(){
	var saveEdit = function() {
		$('#f_edit_financial').submit();
		return false;
	};
	
	$("#btn-save-financial").button().live('click', saveEdit);
	
});
