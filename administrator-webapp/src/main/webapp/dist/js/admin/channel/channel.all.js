$(function(){
	var addChannel = function() {
		location.href = "addChannel";
		return false;
	};
	
	$("#btn-add-channel").button().live('click', addChannel);
	
	var deleteChannel = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteChannel);
	
	var setChannelId = function(){
		var idChannel = $(this).attr("idchannel");
		var modo = $(this).attr("modo");
		$("#id_channel").val(idChannel);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setChannelId);
	
});
