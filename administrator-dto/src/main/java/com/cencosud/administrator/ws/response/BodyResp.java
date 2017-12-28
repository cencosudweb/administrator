/**
 *@name BodyResp.java
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
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.cencosud.administrator.dto.users.CumplimientoEstaticoWsDTO;
import com.cencosud.administrator.dto.users.SkuServicioWsDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.utils.Constantes;


/**
 * @description 
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@XmlRootElement(name = Constantes.BODY)
@XmlAccessorType(XmlAccessType.FIELD)
public class BodyResp implements Serializable {
	
private static final long	serialVersionUID	= 6695883932484057201L;
	
	/* Elementos XML/ Propiedades JSON */
	
	
	@XmlElement(name = Constantes.RESPUESTA_CAS)
	private RespuestaCas		respuestaCas;
	
	@XmlElement(name = Constantes.RESPUESTA)
	private Respuesta		respuesta;
	
	@XmlElement(name = "USER")
	private UserDTO user;
	
	@XmlElement(name = "CUMPLIMIENTO")
	private CumplimientoEstaticoWsDTO cumplimiento;
	
	@XmlElement(name = "ORDEN")
	private TipoOrdenDTO orden;
	
	@XmlElement(name = "VENTA")
	private TipoVentaDTO venta;
	
	@XmlElement(name = "GUIA")
	private TipoGuiaDTO guia;
	
	@XmlElement(name = "sku")
	private SkuServicioWsDTO sku;
	
	@JsonProperty(Constantes.RESPUESTA_CAS)
	public RespuestaCas getRespuestaCas() {
	
		return respuestaCas;
	}
	
	public void setRespuestaCas(RespuestaCas respuestaCas) {
	
		this.respuestaCas = respuestaCas;
	}

	/**
	 * @return the respuestaAuth
	 */
	public Respuesta getRespuesta() {
		return respuesta;
	}

	/**
	 * @param respuestaAuth the respuestaAuth to set
	 */
	public void setRespuesta(Respuesta respuesta) {
		this.respuesta = respuesta;
	}

	@JsonProperty("USER")
	public UserDTO getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(UserDTO user) {
		this.user = user;
	}

	@JsonProperty("CUMPLIMIENTO")
	public CumplimientoEstaticoWsDTO getCumplimiento() {
		return cumplimiento;
	}

	public void setCumplimiento(CumplimientoEstaticoWsDTO cumplimiento) {
		this.cumplimiento = cumplimiento;
	}

	@JsonProperty("ORDEN")
	public TipoOrdenDTO getOrden() {
		return orden;
	}

	public void setOrden(TipoOrdenDTO orden) {
		this.orden = orden;
	}

	/**
	 * @return the venta
	 */
	@JsonProperty("VENTA")
	public TipoVentaDTO getVenta() {
		return venta;
	}

	/**
	 * @param venta the venta to set
	 */
	public void setVenta(TipoVentaDTO venta) {
		this.venta = venta;
	}

	/**
	 * @return the guia
	 */
	@JsonProperty("GUIA")
	public TipoGuiaDTO getGuia() {
		return guia;
	}

	/**
	 * @param guia the guia to set
	 */
	public void setGuia(TipoGuiaDTO guia) {
		this.guia = guia;
	}



	/**
	 * @return the sku
	 */
	@JsonProperty("SKU")
	public SkuServicioWsDTO getSku() {
		return sku;
	}

	/**
	 * @param sku the sku to set
	 */
	public void setSku(SkuServicioWsDTO sku) {
		this.sku = sku;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BodyResp [respuestaCas=" + respuestaCas + "]";
	}

}
