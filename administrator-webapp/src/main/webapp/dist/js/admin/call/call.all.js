$(function(){
	var addUser = function() {
		location.href = "addUser";
		return false;
	};
	
	$("#btn-add-user").button().live('click', addUser);
	
	var deleteUser = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteUser);
	
	var setUserId = function(){
		
		
		var customer = $(this).attr("customer");
		var dateInicio = $(this).attr("dateInicio");
		var dateFin = $(this).attr("dateFin");
		var p = $(this).attr("p");
		var terminatecauseid = $(this).attr("terminatecauseid");
		var src = $(this).attr("src");
		var dst = $(this).attr("dst");
		var enterprovider = $(this).attr("enterprovider");
		var userfield = $(this).attr("userfield");
		
		
		$("#customer").val(customer);
		$("#dateInicio").val(dateInicio);
		$("#dateFin").val(dateFin);
		$("#p").val(p);
		$("#terminatecauseid").val(terminatecauseid);
		$("#src").val(src);
		$("#dst").val(dst);
		$("#enterprovider").val(enterprovider);
		$("#userfield").val(userfield);

	};
	
	$(".lockUnlock").button().live('click', setUserId);
	
	$("#dateInicio").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd/mm/yy',
		minDate: new Date(2010, 1 - 1, 1),
		yearRange: '2010:2030',
		showOn: "button",
		buttonImage: "/administrator-web/images/calendar.png",
		buttonImageOnly: true
	});
	$("#dateInicio").datepicker($.datepicker.regional['es']);
	
	$("#dateFin").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd/mm/yy',
		minDate: new Date(2010, 1 - 1, 1),
		yearRange: '2010:2030',
		showOn: "button",
		buttonImage: "/administrator-web/images/calendar.png",
		buttonImageOnly: true
	});
	$("#dateFin").datepicker($.datepicker.regional['es']);
	
	
	
});
