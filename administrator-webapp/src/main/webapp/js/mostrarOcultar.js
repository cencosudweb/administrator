/**
   ======================================================================
	Autor			: Gonzalo Garrido J.
	Empresa			: TAISA -CARDUMEN
	Fecha			: 2013-10-23 
	Descripcion		: Se genera este Script con el fin de mostrar
					  las diferente campa�as o datos en un link
					  mostr�ndo en forma de cascada el cual al 
					  hacer clic en una de ellas esta debe desaparecer
					  y adem�s debe mostrar la cantidad de campa�as 
					  o datos que solictaron que se mostrara.
	Modificaciones	:
	
   ======================================================================

**/

/*hace que se cargue la funci�n lo que predetermina que div estar� oculto hasta llamar a la funci�n nuevamente*/
$(window).ready(function() {
	//alert('mostro');
	muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */	
});

//Funci�n que oculta el div al hacer clic
function muestra_oculta(id)
{
	
	var username1 = getCookie("campana1Cookie");
	var username2 = getCookie("campana2Cookie");
	var username3 = getCookie("campana3Cookie");
	var username4 = getCookie("campana4Cookie");
	var username5 = getCookie("campana5Cookie");
//	var enlaces = document.getElementsByTagName("div" ).length;
//	alert("Numero total de enlaces: " + enlaces);

	var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
	
	if (document.getElementById)
	{ //se obtiene el id
		//$(el).slideToggle('slow');
		el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div	
		//alert('paso 2');
		deleteReload(username1, username2, username3, username4) //LLama a la funci�n "deleteReload" que realiza la consulta de la Cookie
		//(username3, username4);
	}
	
	
}


//Funci�n que borra el Div en caso de refrescar la p�gina consultando si est� creada la Cookie
function deleteReload(userName1, userName2, userName3, userName4)
{
	//alert('paso - deleteReload()');
	//Variables de acumulado para saber e identificar si paso por la condici�n if(userName1 != null && userName1 != "")
	//como es est�tico se almacena en una variable para cada caso y luego se resta con la cantidad de elemntos encontrados
	//dentro de otro elemento.
	var acumulado1;
	var acumulado2;
	var acumulado3;
	var acumulado4;
	var acumulado5;	
	
	//Variables de resultado donde se almacenar�(valga la redundancia) el o los resultados encontrados por cada if
	var sumaResultado;
	var resultadoFinal;
	
	var uno 	 = document.getElementById("child1");
	var dos 	 = document.getElementById("child2");
	var tres 	 = document.getElementById("child3");
	var cuatro 	 = document.getElementById("child4");
	var cinco 	 = document.getElementById("child5");
	

	obj    = document.getElementById('contenido_a_mostrar'); //Obtengo el elemento ID para poder realizar el conteo de los elementos dentro de ese ID
	numero = obj.getElementsByTagName('div').length; 		 //Se almacena en una variable la cantidad de elementos encontrados.
	
	//alert(numero);
	
	if(userName1 != null && userName1 != "")
	{
		//alert('paso 3');
		padre = uno.parentNode;
		padre.removeChild(uno);
		acumulado1 = 1;
	}
	else{
			acumulado1 = 0;
		}
	if(userName2 != null && userName2 != "")
	{
		//alert('paso 4');
		padre = dos.parentNode;
		padre.removeChild(dos);
		acumulado2 = 1;
	}
	else{
			acumulado2 = 0;
		}
	if(userName3 != null && userName3 != "")
	{	
		//alert('paso 5');
		padre = tres.parentNode;
		padre.removeChild(tres);
		acumulado3 = 1;
	}
	else{
			acumulado3 = 0;
		}
	if(userName4 != null && userName4 != "")
	{
		//alert('paso 6');
		padre = cuatro.parentNode;
		padre.removeChild(cuatro);
		acumulado4 = 1;
	}
	else{
			acumulado4 = 0;
		}

	sumaResultado = acumulado1 + acumulado2 + acumulado3 + acumulado4
	sumaResultado = parseInt(sumaResultado )
	
	resultadoFinal = numero - sumaResultado
	
	var div = document.getElementById("colocarResultado"); //Obtenemos el Id de donde se mostrar� el resultado
	div.textContent = resultadoFinal; //Mostramos el resultado en el elemento del id que le asignamos


}


function pasoOnclick(i)
{
	//alert('paso - pasoOnclick()');	
	//Variables de Paso que en cada condici�n que pase le agregue un 1
	var acumulado1;
	var acumulado2;
	var acumulado3;
	var acumulado4;
	var acumulado5;
	
	//Variables de resultado
	var sumaResultado;
	var resultadoFinal;	
	
	//Rescata el valor que viene del id al hacer clic.
	var uno 	= document.getElementById("child1");
	var dos 	= document.getElementById("child2");
	var tres 	= document.getElementById("child3");
	var cuatro 	= document.getElementById("child4");
	var cinco 	= document.getElementById("child5");
	
	//Se obtiene el id donde se quiere colocar la cantidad de Campa�as que se ingresaron
	obj = document.getElementById('contenido_a_mostrar');
	//Contamos cuantos elementos se ingresaron para poder realizar la resta en cada de remover alg�n elemento
	numero = obj.getElementsByTagName('div').length;
	
	//alert(numero);
	if (i==0)
	{
		//alert('paso 1 - pasoOnclick');
		username	= "campana1";      	//Se le asigna un valor a la Cookie
		nameCookie 	= "campana1Cookie"; //Se le asigna un nombre a la Cookie
		
		var nomCookieTrue = checkCookie(username, nameCookie); //Vamos a la funci�n checkCookie y creamos nuestra Cookie para cuando seleccione un opci�n
	
		padre = uno.parentNode; //Identificamos el Nodo con el id
		padre.removeChild(uno); //Borramos o que contenga el nodo que rescatamos con la variable "padre"
		
		var ocultarCont = document.getElementById("contenido_a_mostrar"); 					  //se define la variable "ocultarCont" para ocultar la opci�n al hacer clic	
		//$(ocultarCont).slideToggle('slow');
		ocultarCont.style.display = (ocultarCont.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
		
		acumulado1 = 1; //Acumulado que ser� sumado y restado con la cantidad de elementos(tag) que tenga el Form 
	}
	else{
			acumulado1 = 0;
		}	
	if (i==1)
	{
		//alert('paso 2 - pasoOnclick');
		username	= "campana2";		//Se le asigna un valor a la Cookie
		nameCookie 	= "campana2Cookie"; //Se le asigna un nombre a la Cookie
		var nomCookieTrue = checkCookie(username, nameCookie); //Vamos a la funci�n checkCookie y creamos nuestra Cookie para cuando seleccione un opci�n
		
		padre = dos.parentNode; //Identificamos el Nodo con el id
		padre.removeChild(dos); //Borramos o que contenga el nodo que rescatamos con la variable "padre"
		
		var ocultarCont = document.getElementById("contenido_a_mostrar"); 					  //se define la variable "ocultarCont" 	
		$(ocultarCont).slideToggle('slow');
		//ocultarCont.style.display = (ocultarCont.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div		
		
		acumulado2 = 1; //Acumulado que ser� sumado y restado con la cantidad de elementos(tag) que tenga el Form
	}
	else{
			acumulado2 = 0; //Acumulado que ser� sumado y restado con la cantidad de elementos(tag) que tenga el Form
		}	
	if (i==2)
	{	
		//alert('paso 3 - pasoOnclick');
		username	= "campana3";		//Se le asigna un valor a la Cookie
		nameCookie 	= "campana3Cookie"; //Se le asigna un nombre a la Cookie
		var nomCookieTrue = checkCookie(username, nameCookie); //Vamos a la funci�n checkCookie y creamos nuestra Cookie para cuando seleccione un opci�n
		
		padre = tres.parentNode; //Identificamos el Nodo con el id
		padre.removeChild(tres); //Borramos o que contenga el nodo que rescatamos con la variable "padre"

		var ocultarCont = document.getElementById("contenido_a_mostrar"); //se define la variable "ocultarCont" 	
		$(ocultarCont).slideToggle('slow');		
		//ocultarCont.style.display = (ocultarCont.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
		
		acumulado3 = 1; //Acumulado que ser� sumado y restado con la cantidad de elementos(tag) que tenga el Form
	}
	else{
			acumulado3 = 0;
		}	
	if (i==3)
	{
		//alert('paso 4 - pasoOnclick');
		username		  = "campana4";		//Se le asigna un valor a la Cookie
		nameCookie 		  = "campana4Cookie";	//Se le asigna un nombre a la Cookie	
		var nomCookieTrue = checkCookie(username, nameCookie); //Vamos a la funci�n checkCookie y creamos nuestra Cookie para cuando seleccione un opci�n
		
		padre = cuatro.parentNode; //Identificamos el Nodo con el id
		padre.removeChild(cuatro); //Borramos o que contenga el nodo que rescatamos con la variable "padre"

		var ocultarCont = document.getElementById("contenido_a_mostrar"); 					  //se define la variable "ocultarCont" 	
		$(ocultarCont).slideToggle('slow');		
		//ocultarCont.style.display = (ocultarCont.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
		
		acumulado4 = 1; //Acumulado que ser� sumado y restado con la cantidad de elementos(tag) que tenga el Form
	}
	else{
			acumulado4 = 0;
		}	

	sumaResultado  = acumulado1 + acumulado2 + acumulado3 + acumulado4	
	resultadoFinal = numero - sumaResultado 

	var div = document.getElementById("colocarResultado");  //Obtenemos el Id de donde se mostrar� el resultado
	div.textContent = resultadoFinal; 						//Mostramos el resultado en el elemento del id que le asignamos

}

//Funcion que crea la Cookie
function checkCookie(username, nameCookie)
{
	if (username!= null && username!= "")
	{
	//	alert('paso');
		setCookie(nameCookie,username,365); // LLama a la funcion "setCookie"  con los par�metros enviados para su creaci�n
	}
}

//Funci�n que verifica si existe una Cookie
function getCookie(c_name)
{
	//alert(c_name);
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");

	if (c_start == -1)
	{
		c_start = c_value.indexOf(c_name + "=");
		//alert(c_start);		
	}
	if (c_start == -1)
	{
		c_value = null;
		//alert(c_value);		
	}
	else
	{
		c_start 	= c_value.indexOf("=", c_start) + 1;
		var c_end 	= c_value.indexOf(";", c_start);
		
		if (c_end == -1)
		{
			c_end = c_value.length;
		}
			c_value = unescape(c_value.substring(c_start,c_end));
	}
		//alert(c_value);
		return c_value;
}
//Funci�n que recibe como par�metros los datos necesarios para la creaci�n de la Cookie
function setCookie(c_name, value, exdays)
{
	var exdate = new Date();
	//alert(exdate);	
	exdate.setDate(exdate.getDate() + exdays);	
	//alert(exdays);
	var c_value = escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	//alert(c_value);	
	document.cookie=c_name + "=" + c_value; //Se crea la Cookie ingresando el nombre y valor
	
}

//*******Codigo suelto******
//	alert(d);
//	while (d.hasChildNodes())
//	padre = d.parentNode;
//	padre.removeChild(d);
//
//	d.removeChild(d.lastChild);	
//	d.removeChild(d.firstChild);
//	alert('paso');
/*
window.onload = function()
{/*hace que se cargue la funci�n lo que predetermina que div estar� oculto hasta llamar a la funci�n nuevamente*/
	//alert('entro');
	//muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */		

	// Obtener el hash de la p�gina
//}
