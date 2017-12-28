/**
 *@name Channel.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */

package com.cencosud.administrator.dto.users;

import java.io.Serializable;


import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 *  @description Clase Channel
 *
 */

public class CuadraturaVentaVerdeDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;
	private Long id;

	private String solicitudOriginal;
	
	private int numeroOrden;
	
	private String fechaCreacionOrden;
	
	private String ponumb;
	
	private String ex14Error;
	
	private String despa;
	
	private int tipoEstado;
	
	private int tipoRelacion;
	
	private String relNum;
	
	private String iNumBr;
	
	private String relBl5;
	
	private String logEncontradoEnJda;
	
	public CuadraturaVentaVerdeDTO(){}
	
	public CuadraturaVentaVerdeDTO(Long id){
		this.id = id;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the solicitudOriginal
	 */
	public String getSolicitudOriginal() {
		return solicitudOriginal;
	}

	/**
	 * @param solicitudOriginal the solicitudOriginal to set
	 */
	public void setSolicitudOriginal(String solicitudOriginal) {
		this.solicitudOriginal = solicitudOriginal;
	}

	/**
	 * @return the numeroOrden
	 */
	public int getNumeroOrden() {
		return numeroOrden;
	}

	/**
	 * @param numeroOrden the numeroOrden to set
	 */
	public void setNumeroOrden(int numeroOrden) {
		this.numeroOrden = numeroOrden;
	}

	/**
	 * @return the fechaCreacionOrden
	 */
	public String getFechaCreacionOrden() {
		return fechaCreacionOrden;
	}

	/**
	 * @param fechaCreacionOrden the fechaCreacionOrden to set
	 */
	public void setFechaCreacionOrden(String fechaCreacionOrden) {
		this.fechaCreacionOrden = fechaCreacionOrden;
	}

	/**
	 * @return the ponumb
	 */
	public String getPonumb() {
		return ponumb;
	}

	/**
	 * @param ponumb the ponumb to set
	 */
	public void setPonumb(String ponumb) {
		this.ponumb = ponumb;
	}

	/**
	 * @return the ex14Error
	 */
	public String getEx14Error() {
		return ex14Error;
	}

	/**
	 * @param ex14Error the ex14Error to set
	 */
	public void setEx14Error(String ex14Error) {
		this.ex14Error = ex14Error;
	}

	/**
	 * @return the despa
	 */
	public String getDespa() {
		return despa;
	}

	/**
	 * @param despa the despa to set
	 */
	public void setDespa(String despa) {
		this.despa = despa;
	}

	/**
	 * @return the tipoEstado
	 */
	public int getTipoEstado() {
		return tipoEstado;
	}

	/**
	 * @param tipoEstado the tipoEstado to set
	 */
	public void setTipoEstado(int tipoEstado) {
		this.tipoEstado = tipoEstado;
	}

	/**
	 * @return the tipoRelacion
	 */
	public int getTipoRelacion() {
		return tipoRelacion;
	}

	/**
	 * @param tipoRelacion the tipoRelacion to set
	 */
	public void setTipoRelacion(int tipoRelacion) {
		this.tipoRelacion = tipoRelacion;
	}

	/**
	 * @return the relNum
	 */
	public String getRelNum() {
		return relNum;
	}

	/**
	 * @param relNum the relNum to set
	 */
	public void setRelNum(String relNum) {
		this.relNum = relNum;
	}

	/**
	 * @return the iNumBr
	 */
	public String getiNumBr() {
		return iNumBr;
	}

	/**
	 * @param iNumBr the iNumBr to set
	 */
	public void setiNumBr(String iNumBr) {
		this.iNumBr = iNumBr;
	}

	/**
	 * @return the relBl5
	 */
	public String getRelBl5() {
		return relBl5;
	}

	/**
	 * @param relBl5 the relBl5 to set
	 */
	public void setRelBl5(String relBl5) {
		this.relBl5 = relBl5;
	}

	/**
	 * @return the logEncontradoEnJda
	 */
	public String getLogEncontradoEnJda() {
		return logEncontradoEnJda;
	}

	/**
	 * @param logEncontradoEnJda the logEncontradoEnJda to set
	 */
	public void setLogEncontradoEnJda(String logEncontradoEnJda) {
		this.logEncontradoEnJda = logEncontradoEnJda;
	}

	
	


	
}
