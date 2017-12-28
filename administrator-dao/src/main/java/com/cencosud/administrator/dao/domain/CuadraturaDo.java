/**
 * 
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
 * @author EA7129
 *
 */

@Entity
@Table(name = "cuadratura_do")
public class CuadraturaDo implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CUADRATURA_DO")
	@SequenceGenerator(name = "SEQUENCE_CUADRATURA_DO", sequenceName = "SEQUENCE_CUADRATURA_DO", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "ORDENNUM")
	private int ordenNum;

	@Column(name = "EST_SC")
	private int estSc;
	
	@Column(name = "F_CREACION")
	private String fCreacion;
	
	@Column(name = "ETA")
	private String eta;
	
	@Column(name = "FECHALIBERADA")
	private String fechaLiberada;
	
	@Column(name = "FACILITY")
	private String facility;
	
	@Column(name = "SOLCLIENTE")
	private String solCliente;
	
	@Column(name = "DO_EOM")
	private String doEom;
	
	@Column(name = "EST_DO")
	private String estDo;
	
	@Column(name = "T_ORDEN")
	private String tOrden;
	
	@Column(name = "ANT_EST")
	private String antEst;

	@Column(name = "NUEV_EST")
	private String nuevEst;
	
	@Column(name = "DO_WMS")
	private String doWms;
	
	@Column(name = "SC")
	private String sc;
	
	@Column(name = "ESTADO")
	private int estado;

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
	 * @return the ordenNum
	 */
	public int getOrdenNum() {
		return ordenNum;
	}

	/**
	 * @param ordenNum the ordenNum to set
	 */
	public void setOrdenNum(int ordenNum) {
		this.ordenNum = ordenNum;
	}

	/**
	 * @return the estSc
	 */
	public int getEstSc() {
		return estSc;
	}

	/**
	 * @param estSc the estSc to set
	 */
	public void setEstSc(int estSc) {
		this.estSc = estSc;
	}

	/**
	 * @return the fCreacion
	 */
	public String getfCreacion() {
		return fCreacion;
	}

	/**
	 * @param fCreacion the fCreacion to set
	 */
	public void setfCreacion(String fCreacion) {
		this.fCreacion = fCreacion;
	}

	/**
	 * @return the eta
	 */
	public String getEta() {
		return eta;
	}

	/**
	 * @param eta the eta to set
	 */
	public void setEta(String eta) {
		this.eta = eta;
	}

	/**
	 * @return the fechaLiberada
	 */
	public String getFechaLiberada() {
		return fechaLiberada;
	}

	/**
	 * @param fechaLiberada the fechaLiberada to set
	 */
	public void setFechaLiberada(String fechaLiberada) {
		this.fechaLiberada = fechaLiberada;
	}

	/**
	 * @return the facility
	 */
	public String getFacility() {
		return facility;
	}

	/**
	 * @param facility the facility to set
	 */
	public void setFacility(String facility) {
		this.facility = facility;
	}

	/**
	 * @return the solCliente
	 */
	public String getSolCliente() {
		return solCliente;
	}

	/**
	 * @param solCliente the solCliente to set
	 */
	public void setSolCliente(String solCliente) {
		this.solCliente = solCliente;
	}

	/**
	 * @return the doEom
	 */
	public String getDoEom() {
		return doEom;
	}

	/**
	 * @param doEom the doEom to set
	 */
	public void setDoEom(String doEom) {
		this.doEom = doEom;
	}

	/**
	 * @return the estDo
	 */
	public String getEstDo() {
		return estDo;
	}

	/**
	 * @param estDo the estDo to set
	 */
	public void setEstDo(String estDo) {
		this.estDo = estDo;
	}

	/**
	 * @return the tOrden
	 */
	public String gettOrden() {
		return tOrden;
	}

	/**
	 * @param tOrden the tOrden to set
	 */
	public void settOrden(String tOrden) {
		this.tOrden = tOrden;
	}

	/**
	 * @return the antEst
	 */
	public String getAntEst() {
		return antEst;
	}

	/**
	 * @param antEst the antEst to set
	 */
	public void setAntEst(String antEst) {
		this.antEst = antEst;
	}

	/**
	 * @return the nuevEst
	 */
	public String getNuevEst() {
		return nuevEst;
	}

	/**
	 * @param nuevEst the nuevEst to set
	 */
	public void setNuevEst(String nuevEst) {
		this.nuevEst = nuevEst;
	}

	/**
	 * @return the doWms
	 */
	public String getDoWms() {
		return doWms;
	}

	/**
	 * @param doWms the doWms to set
	 */
	public void setDoWms(String doWms) {
		this.doWms = doWms;
	}

	/**
	 * @return the sc
	 */
	public String getSc() {
		return sc;
	}

	/**
	 * @param sc the sc to set
	 */
	public void setSc(String sc) {
		this.sc = sc;
	}

	/**
	 * @return the estado
	 */
	public int getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(int estado) {
		this.estado = estado;
	}


	

}
