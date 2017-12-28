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
		var idUsuario = $(this).attr("iduser");
		var modo = $(this).attr("modo");
		$("#id_user").val(idUsuario);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setUserId);
	
	
	var allUser = function() {
		$('#f_all_user').submit();
		return false;
	};
	
	$("#btn-all-user").button().live('click', allUser);
	
	
	$("#dateInicio").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd/mm/yy',
		minDate: new Date(2010, 1 - 1, 1),
		yearRange: '2010:2030',
		showOn: "button",
		buttonImage: "/administrator-webapp/images/calendar.png",
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
		buttonImage: "/administrator-webapp/images/calendar.png",
		buttonImageOnly: true
	});
	$("#dateFin").datepicker($.datepicker.regional['es']);
	
});
