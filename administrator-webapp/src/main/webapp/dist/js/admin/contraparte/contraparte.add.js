$(function(){
	var saveContraparte = function() {
		$('#f_add_contraparte').submit();
		return false;
	};
	
	$("#btn-save-contraparte").button().live('click', saveContraparte);
	
});
