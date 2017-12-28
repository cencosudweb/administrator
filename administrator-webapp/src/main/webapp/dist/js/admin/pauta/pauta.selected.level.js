$(function() {
	$("#padrino").attr("disabled",true);
	$("#gerente").attr("disabled",true);
	$("#contraparte").attr("disabled",true);
	$("#soporte").attr("disabled",true);
	
	$('#tienda').change(function() {
		var id = $("#tienda").find(':selected').val();
		$("#valorTienda").val(id);
		
		//alert('tienda_id='+id);
		if($("#tienda").val() == '') {
			//alert('ok');
			$("#padrino").attr("disabled",true);
		} else {
			//alert('nok');
			$("#padrino").attr("disabled",false);
			
		}
		
		$( "#padrino" ).load( "../js/admin/pauta/generaselect/generaSelectPadrino.jsp?id="+id, { limit: 25 }, function() {
  			$("#padrino").attr("disabled",false);
		});
	});
	
	$('#padrino').change(function() {
		var id = $("#padrino").find(':selected').val();
		$("#valorPadrino").val(id);
		//alert('padrino_id='+id);
		
		$( "#gerente" ).load( "../js/admin/pauta/generaselect/generaSelectGerente.jsp?id="+id, { limit: 25 }, function() {
  			$("#gerente").attr("disabled",false);
		});
		
		//$( "#id_branch" ).load( "../js/admin/incognito/generaselect/generaSelectBranch.jsp?id="+id, { limit: 25 }, function() {
  		//	$("#id_branch").attr("disabled",false);
		//});
		
		
	});
	
	$('#gerente').change(function() {
		var id = $("#gerente").find(':selected').val();
		$("#valorGerente").val(id);
		//alert('gerente_id='+id);
		$( "#contraparte" ).load( "../js/admin/pauta/generaselect/generaSelectContraparte.jsp?id="+id, { limit: 25 }, function() {
  			$("#contraparte").attr("disabled",false);
		});
	});
	
	$('#contraparte').change(function() {
		var id = $("#contraparte").find(':selected').val();
		$("#valorContratante").val(id);
		//alert('Contratante_id='+id);
		$( "#soporte" ).load( "../js/admin/pauta/generaselect/generaSelectSoporte.jsp?id="+id, { limit: 25 }, function() {
  			$("#soporte").attr("disabled",false);
		});
	});
	
	$('#soporte').change(function() {
		var id = $("#soporte1").find(':selected').val();
		//alert('soporte_id='+id);
		$("#valorSoporte").val(id);
		
	});
	
	

});