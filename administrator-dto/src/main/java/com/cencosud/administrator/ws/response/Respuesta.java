/**
 *@name RespuestaAuth.java
 * 
 *@version 1.0 
 * 
 *@date 12-04-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.ws.response;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.cencosud.administrator.utils.Constantes;

/**
 * @description 
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@XmlRootElement(name = Constantes.RESPUESTA)
@XmlAccessorType(XmlAccessType.FIELD)
public class Respuesta implements Serializable {
	
	
private static final long	serialVersionUID	= -8290755471943508491L;
	
	/* Elementos XML/ Propiedades JSON */
	
	
	private String				descripcionRespuesta;
	
	public String getDescripcionRespuesta() {
	
		return descripcionRespuesta;
	}
	
	public void setDescripcionRespuesta(String descripcionRespuesta) {
	
		this.descripcionRespuesta = descripcionRespuesta;
	}
	
	@Override
	public String toString() {
	
		return "RespuestaCas [descripcionRespuesta=" + descripcionRespuesta + "]";
	}

}
