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

package com.cencosud.administrator.dao.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 *  @description Clase CuadraturaVentaVerde
 *
 */

@Entity
@Table(name = "cuadratura_venta_verde")
public class CuadraturaVentaVerde implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CUA_VENTA_VERDE")
	@SequenceGenerator(name = "SEQUENCE_CUA_VENTA_VERDE", sequenceName = "SEQUENCE_CUA_VENTA_VERDE", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "SOLICITUDORIGINAL")
	private String solicitudOriginal;
	
	@Column(name = "N_ORDEN_DISTRIBU")
	private int numeroOrden;
	
	@Column(name = "FECHA_CREACION_ORDEN")
	private String fechaCreacionOrden;
	
	@Column(name = "PONUMB")
	private String ponumb;
	
	@Column(name = "EX14ERROR")
	private String ex14Error;
	
	@Column(name = "DESPA")
	private String despa;
	
	@Column(name = "TIPO_ESTADO")
	private int tipoEstado;
	
	@Column(name = "TIPO_RELACION")
	private int tipoRelacion;
	
	@Column(name = "RELNUM")
	private String relNum;
	
	@Column(name = "INUMBR")
	private String iNumBr;
	
	@Column(name = "RELBL5")
	private String relBl5;
	
	@Column(name = "LOGENCONTRADOENJDA")
	private String logEncontradoEnJda;
	
	
	

	
	public CuadraturaVentaVerde(){}
	
	public CuadraturaVentaVerde(Long id){
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
