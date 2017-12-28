$(function(){
	var addUser = function() {
		location.href = "addCommerce";
		return false;
	};
	
	$("#btn-add-commerce").button().live('click', addUser);
	
	var deleteCommerce = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteCommerce);
	
	var setCommerceId = function(){
		var idFinancial = $(this).attr("idcommerce");
		var modo = $(this).attr("modo");
		$("#id_commerce").val(idFinancial);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setCommerceId);
	
});
