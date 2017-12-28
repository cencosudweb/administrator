$(function(){
	var addChannel = function() {
		location.href = "addChannel";
		return false;
	};
	
	$("#btn-add-channel").button().live('click', addChannel);
	
	var deleteChannel = function() {
		var idChannel = $(this).attr("iddocument");
		$("#id_channel").val(idChannel);
	};
	
	$(".btn-danger").button().live('click', deleteChannel);
	
	var setChannelId = function(){
		var idChannel = $(this).attr("idchannel");
		$("#id_channel").val(idChannel);
	};
	
	$(".lockUnlock").button().live('click', setChannelId);
	
});
