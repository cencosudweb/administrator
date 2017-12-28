$(function(){
	var saveChannel = function() {
		//TODO reemplazar por ajax
		
		$('#f_add_channel').submit();
		return false;
	};
	
	$("#btn-save-channel").button().live('click', saveChannel);
	
	
	
});
