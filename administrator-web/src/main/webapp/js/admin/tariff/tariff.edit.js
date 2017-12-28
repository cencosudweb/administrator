$(function(){
	var saveTariff = function() {
		//TODO reemplazar por ajax
		$('#f_edit_tariff').submit();
		return false;
	};
	
	$("#btn-save-tariff").button().live('click', saveTariff);
	
});
