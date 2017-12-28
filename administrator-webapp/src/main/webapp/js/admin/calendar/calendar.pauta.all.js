$(function(){
	
	
	$("#fechaVisita2").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd/mm/yy',
		minDate: new Date(2010, 1 - 1, 1),
		yearRange: '2010:2030',
		showOn: "button",
		buttonImage: "/administrator-web/images/calendar.png",
		buttonImageOnly: true
	});
	$("#fechaVisita2").datepicker($.datepicker.regional['es']);
	
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
