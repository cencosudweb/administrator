$(function(){
	var saveCommerce = function() {
		$('#f_add_cardGroup').submit();
		return false;
	};
	
	$("#btn-save-cardGroup").button().live('click', saveCommerce);
	
});
