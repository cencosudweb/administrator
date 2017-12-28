$(function(){
	var saveUser = function() {
		//TODO reemplazar por ajax
		$('#f_edit_user').submit();
		return false;
	};
	
	$("#btn-save-user").button().live('click', saveUser);
	
});
