$(function(){

	var deleteUser = function() {
		$("#f_lock1").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deleteUser);
	
	
	
});
