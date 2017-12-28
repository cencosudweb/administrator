$(function(){
	var addTariff = function() {
		location.href = "addTariff";
		return false;
	};
	
	$("#btn-add-tariff").button().live('click', addTariff);
	
	var deleteTariff = function() {
		$("#f_lock").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deleteTariff);
	
	var setTariffId = function(){
		var idTariff = $(this).attr("idtariff");
		var modo = $(this).attr("modo");
		$("#id_tariff").val(idTariff);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setTariffId);
	
	
	var allTariff = function() {
		$('#f_all_tariff').submit();
		return false;
	};
	
	$("#btn-all-tariff").button().live('click', allTariff);
	
});
