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
@Table(name = "cuadratura_ctl")
public class CuadraturaCtl implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_cuadratura_ctl")
	@SequenceGenerator(name = "SEQUENCE_cuadratura_ctl", sequenceName = "SEQUENCE_cuadratura_ctl", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "carga")
	private int carga;

	@Column(name = "bodega")
	private String bodega;
	
	@Column(name = "fecha")
	private String fecha;
	
	@Column(name = "tipo")
	private String tipo;
	
	@Column(name = "tran_nbr")
	private int tranNbr;
	
	@Column(name = "tienda")
	private int tienda;
	
	@Column(name = "guias")
	private int guias;
	
	@Column(name = "detalles")
	private int detalles;
	
	@Column(name = "cant_wms")
	private int cantWms;
	
	@Column(name = "procesado_jda")
	private String procesadoJda;
	
	@Column(name = "encontrados")
	private int encontrados;

	@Column(name = "stat_code")
	private int statCode;

	
	

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
	 * @return the carga
	 */
	public int getCarga() {
		return carga;
	}


	/**
	 * @param carga the carga to set
	 */
	public void setCarga(int carga) {
		this.carga = carga;
	}


	/**
	 * @return the bodega
	 */
	public String getBodega() {
		return bodega;
	}


	/**
	 * @param bodega the bodega to set
	 */
	public void setBodega(String bodega) {
		this.bodega = bodega;
	}


	/**
	 * @return the fecha
	 */
	public String getFecha() {
		return fecha;
	}


	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}


	/**
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}


	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	/**
	 * @return the tranNbr
	 */
	public int getTranNbr() {
		return tranNbr;
	}


	/**
	 * @param tranNbr the tranNbr to set
	 */
	public void setTranNbr(int tranNbr) {
		this.tranNbr = tranNbr;
	}


	/**
	 * @return the tienda
	 */
	public int getTienda() {
		return tienda;
	}


	/**
	 * @param tienda the tienda to set
	 */
	public void setTienda(int tienda) {
		this.tienda = tienda;
	}


	/**
	 * @return the guias
	 */
	public int getGuias() {
		return guias;
	}


	/**
	 * @param guias the guias to set
	 */
	public void setGuias(int guias) {
		this.guias = guias;
	}


	/**
	 * @return the detalles
	 */
	public int getDetalles() {
		return detalles;
	}


	/**
	 * @param detalles the detalles to set
	 */
	public void setDetalles(int detalles) {
		this.detalles = detalles;
	}


	/**
	 * @return the cantWms
	 */
	public int getCantWms() {
		return cantWms;
	}


	/**
	 * @param cantWms the cantWms to set
	 */
	public void setCantWms(int cantWms) {
		this.cantWms = cantWms;
	}


	/**
	 * @return the procesadoJda
	 */
	public String getProcesadoJda() {
		return procesadoJda;
	}


	/**
	 * @param procesadoJda the procesadoJda to set
	 */
	public void setProcesadoJda(String procesadoJda) {
		this.procesadoJda = procesadoJda;
	}


	/**
	 * @return the encontrados
	 */
	public int getEncontrados() {
		return encontrados;
	}


	/**
	 * @param encontrados the encontrados to set
	 */
	public void setEncontrados(int encontrados) {
		this.encontrados = encontrados;
	}


	/**
	 * @return the statCode
	 */
	public int getStatCode() {
		return statCode;
	}


	/**
	 * @param statCode the statCode to set
	 */
	public void setStatCode(int statCode) {
		this.statCode = statCode;
	}

	
	

}
