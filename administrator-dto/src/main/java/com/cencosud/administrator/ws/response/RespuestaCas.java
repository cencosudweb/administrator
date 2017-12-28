/**
 *@name RespuestaCas.java
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
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.cencosud.administrator.utils.Constantes;
/**
 * @description 
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@XmlRootElement(name = Constantes.RESPUESTA_CAS)
@XmlAccessorType(XmlAccessType.FIELD)
public class RespuestaCas implements Serializable {
	
	private static final long	serialVersionUID	= -8290755471943508491L;
	
	/* Elementos XML/ Propiedades JSON */
	
	@JsonProperty(Constantes.CODIGO_RESPUESTA)
	@XmlAttribute(name = Constantes.CODIGO_RESPUESTA)
	private String				codigoRespuesta;
	
	@JsonProperty(Constantes.DESCRIPCION_RESPUESTA)
	@XmlAttribute(name = Constantes.DESCRIPCION_RESPUESTA)
	private String				descripcionRespuesta;
	
	public String getCodigoRespuesta() {
	
		return codigoRespuesta;
	}
	
	public void setCodigoRespuesta(String codigoRespuesta) {
	
		this.codigoRespuesta = codigoRespuesta;
	}
	
	public String getDescripcionRespuesta() {
	
		return descripcionRespuesta;
	}
	
	public void setDescripcionRespuesta(String descripcionRespuesta) {
	
		this.descripcionRespuesta = descripcionRespuesta;
	}
	
	@Override
	public String toString() {
	
		return "RespuestaCas [codigoRespuesta=" + codigoRespuesta
				+ ", descripcionRespuesta=" + descripcionRespuesta + "]";
	}

}
