$(function(){
	var saveAgreement = function() {
		$('#f_add_agreement').submit();
		return false;
	};
	
	$("#btn-save-agreement").button().live('click', saveAgreement);
	
	$("#dateInicio").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd/mm/yy',
		minDate: new Date(2010, 1 - 1, 1),
		yearRange: '2010:2030',
		showOn: "button",
		buttonImage: "/invoicing-web/images/calendar.png",
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
		buttonImage: "/invoicing-web/images/calendar.png",
		buttonImageOnly: true
	});
	$("#dateFin").datepicker($.datepicker.regional['es']);
	
});
