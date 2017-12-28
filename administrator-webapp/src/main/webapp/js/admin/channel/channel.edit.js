$(function(){
	var saveChannel = function() {
		//TODO reemplazar por ajax
		$('#f_edit_channel').submit();
		return false;
	};
	
	$("#btn-save-channel").button().live('click', saveChannel);
	
});
