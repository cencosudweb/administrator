$(function(){
	var saveEdit = function() {
		$('#f_edit_padrino').submit();
		return false;
	};
	
	$("#btn-save-padrino").button().live('click', saveEdit);
	
});
