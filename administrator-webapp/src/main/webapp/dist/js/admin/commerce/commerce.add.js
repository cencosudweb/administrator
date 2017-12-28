$(function(){
	var saveCommerce = function() {
		$('#f_add_commerce').submit();
		return false;
	};
	
	$("#btn-save-commerce").button().live('click', saveCommerce);
	
});
