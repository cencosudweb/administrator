$(function(){
	var saveRate = function() {
		//TODO reemplazar por ajax
		$('#f_edit_rate').submit();
		return false;
	};
	
	$("#btn-save-rate").button().live('click', saveRate);
	
});
