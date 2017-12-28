$(function() {
	$("#padrino1").attr("disabled",true);
	$("#gerente1").attr("disabled",true);
	$("#contraparte1").attr("disabled",true);
	$("#soporte1").attr("disabled",true);
	
	$('#tienda1').change(function() {
		var id = $("#tienda1").find(':selected').val();
		$("#valorTienda").val(id);
		
		//alert('tienda_id='+id);
		if($("#tienda1").val() == '') {
			//alert('ok');
			$("#padrino1").attr("disabled",true);
		} else {
			//alert('nok');
			$("#padrino1").attr("disabled",false);
			
		}
		
		$( "#padrino1" ).load( "../js/admin/pauta/generaselect/generaSelectPadrino.jsp?id="+id, { limit: 25 }, function() {
  			$("#padrino1").attr("disabled",false);
		});
	});
	
	$('#padrino1').change(function() {
		var id = $("#padrino1").find(':selected').val();
		$("#valorPadrino").val(id);
		//alert('padrino_id='+id);
		
		$( "#gerente1" ).load( "../js/admin/pauta/generaselect/generaSelectGerente.jsp?id="+id, { limit: 25 }, function() {
  			$("#gerente1").attr("disabled",false);
		});
		
		//$( "#id_branch" ).load( "../js/admin/incognito/generaselect/generaSelectBranch.jsp?id="+id, { limit: 25 }, function() {
  		//	$("#id_branch").attr("disabled",false);
		//});
		
		
	});
	
	$('#gerente1').change(function() {
		var id = $("#gerente1").find(':selected').val();
		$("#valorGerente").val(id);
		//alert('gerente_id='+id);
		$( "#contraparte1" ).load( "../js/admin/pauta/generaselect/generaSelectContraparte.jsp?id="+id, { limit: 25 }, function() {
  			$("#contraparte1").attr("disabled",false);
		});
	});
	
	$('#contraparte1').change(function() {
		var id = $("#contraparte1").find(':selected').val();
		$("#valorContratante").val(id);
		//alert('Contratante_id='+id);
		$( "#soporte1" ).load( "../js/admin/pauta/generaselect/generaSelectSoporte.jsp?id="+id, { limit: 25 }, function() {
  			$("#soporte1").attr("disabled",false);
		});
	});
	
	$('#soporte1').change(function() {
		var id = $("#soporte1").find(':selected').val();
		//alert('soporte_id='+id);
		$("#valorSoporte").val(id);
		
	});
	
	

});