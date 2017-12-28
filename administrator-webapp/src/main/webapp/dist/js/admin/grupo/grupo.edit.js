$(function(){
	var saveEdit = function() {
		$('#f_edit_cardGroup').submit();
		return false;
	};
	
	$("#btn-save-cardGroup").button().live('click', saveEdit);
	
});
