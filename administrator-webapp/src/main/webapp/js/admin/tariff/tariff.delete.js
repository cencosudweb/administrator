$(function(){
	var addTariff = function() {
		location.href = "addTariff";
		return false;
	};
	
	$("#btn-add-tariff").button().live('click', addTariff);
	
	var deleteTariff = function() {
		var idTariff = $(this).attr("idtariff");
		$("#id_tariff").val(idTariff);
	};
	
	$(".btn-danger").button().live('click', deleteTariff);
	
	var setTariffId = function(){
		var idTariff = $(this).attr("idtariff");
		$("#id_tariff").val(idTariff);
	};
	
	$(".lockUnlock").button().live('click', setTariffId);
	
});
