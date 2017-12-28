$(function(){
	var saveProvider = function() {
		$('#f_add_provider').submit();
		return false;
	};
	
	$("#btn-save-provider").button().live('click', saveProvider);
	
});
