/**
 * 
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author EA7129
 *
 */

public class CuadraturaCtlDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;

	private int carga;

	private String bodega;
	
	private String fecha;
	
	private String tipo;
	
	private int tranNbr;
	
	private int tienda;
	
	private int guias;
	
	private int detalles;
	
	private int cantWms;
	
	private String procesadoJda;
	
	private int encontrados;
	
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
