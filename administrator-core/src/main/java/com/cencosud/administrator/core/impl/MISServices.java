/**
 *@name MISServices 
 * 
 *@version 1.0 
 * 
 *@date 18 de Julio de 2015 
 * 
 *@author Cesar Machado 
 * 
 *@copyright Inversiones Security. All rights reserved.
 */

package com.cencosud.administrator.core.impl;


import org.apache.log4j.Logger;
import com.cencosud.administrator.utils.Constantes;
import com.cencosud.administrator.ws.response.BodyResp;
import com.cencosud.administrator.ws.response.RespuestaCas;



/**
 * @description Clase abstracta que define algunos atributos o metodos que seran comunes en los services,
 *              Asi como tambien sera usado algunos atributos en los interceptores
*/

public abstract class MISServices {
	
	static Logger				logger	= Logger.getLogger(MISServices.class);
	

	/** 
	 * definicion de la transaccion en ejecucion
	 *
	*/
	//private String				transaccion;

	
	/**
	 * Direccion IP de quien consume el servicio
	 * */
	private String				ipAddress;
	

	
	/**
	* metodo que devuelve un objeto generico de respuesta para cuando alguno de los datos de 
	* entrada de la peticion son incorrectos
	* 
	* @return BodyResp  Objeto con una respuesta generica.
	*/
	protected BodyResp respuestaGenerica() {
	
		BodyResp bodyResp = new BodyResp();
		RespuestaCas respuestaCas = new RespuestaCas();
		respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR);
		respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR);
		bodyResp.setRespuestaCas(respuestaCas);
		return bodyResp;
	}
	
	
	
	public String getIpAddress() {
	
		return ipAddress;
	}
	
	public void setIpAddress(String ipAddress) {
	
		this.ipAddress = ipAddress;
	}
	
}
