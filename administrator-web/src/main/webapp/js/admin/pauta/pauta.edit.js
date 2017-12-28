$(function(){
	var savePauta = function() {
		//TODO reemplazar por ajax
		
		//alert('ok');
		//var tienda = $("#tienda").val();
		//$("#typeSelectedId").val(tienda);
		
		
		if($("#tienda1").val() == '') {
			//alert('Por favor, primero debes ingresar tienda');
			//$("#texto").val("Por favor, primero debes ingresar tienda");

			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			
			//$( "#myModal" ).dialog();
			 
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#padrino1").val() == '') {
			//alert('Por favor, primero debes ingresar padrino');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#gerente1").val() == '') {
			//alert('Por favor, primero debes ingresar gerente');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#contraparte1").val() == '') {
			//alert('Por favor, primero debes ingresar contraparte');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#soporte1").val() == '') {
			//alert('Por favor, primero debes ingresar soporte integral');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#reportado1").val() == '') {
			//alert('Por favor, primero debes ingresar reportados');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#area1").val() == '') {
			//alert('Por favor, primero debes ingresar area');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		
		if($("#prioridad1").val() == '') {
			//alert('Por favor, primero debes ingresar prioridad');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#descripcionIssue").val() == '') {
			//alert('Por favor, primero debes ingresar descripcin issue');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		if($("#observacion").val() == '') {
			//alert('Por favor, primero debes ingresar observacion');
			$( "#dialog-confirm" ).dialog({
			  resizable: false,
			  height: "auto",
			  width: 400,
			  modal: true,
			  buttons: {
				"Aceptar": function() {
				  $( this ).dialog( "close" );
				}/*,
				Cancel: function() {
				  $( this ).dialog( "close" );
				}*/
			  }
			});
			$("#tienda1").focus();
			return false;
		} 
		
		
		$('#f_edit_pauta').submit();
		return false;
	};
	
	$("#btn-save-pauta").button().live('click', savePauta);
	
});
