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
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 
 *  @description Clase Channel
 *
 */

@Entity
@Table(name = "pautas")
public class Pauta implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_PAUTAS")
	@SequenceGenerator(name = "SEQUENCE_PAUTAS", sequenceName = "SEQUENCE_PAUTAS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "numero_requerimiento")
	private int numeroRequerimiento;

	@OneToOne
	@JoinColumn(name="id_prioridad")
	@NotFound(action = NotFoundAction.IGNORE)
	private Prioridad prioridad;

	
	@Column(name = "descripcion_issue")
	private String descripcionIssue;
	

	@OneToOne
	@JoinColumn(name="id_reportado")
	@NotFound(action = NotFoundAction.IGNORE)
	private Reportado reportado;
	
	
	@OneToOne
	@JoinColumn(name="id_area")
	@NotFound(action = NotFoundAction.IGNORE)
	private Area area;
	
	@Column(name = "observacion")
	private String observacion;
	
	

	@OneToOne
	@JoinColumn(name="id_tienda")
	@NotFound(action = NotFoundAction.IGNORE)
	private Tienda tienda;
	

	@OneToOne
	@JoinColumn(name="id_padrino")
	@NotFound(action = NotFoundAction.IGNORE)
	private Padrino padrino;
	
	@OneToOne
	@JoinColumn(name="id_gerente")
	@NotFound(action = NotFoundAction.IGNORE)
	private Gerente gerente;
	
	
	@OneToOne
	@JoinColumn(name="id_contratante")
	@NotFound(action = NotFoundAction.IGNORE)
	private Contratante contratante;
	
	
	@OneToOne
	@JoinColumn(name="id_soporte")
	@NotFound(action = NotFoundAction.IGNORE)
	private Soporte soporte;
	
	
	@OneToOne
	@JoinColumn(name="id_estado")
	@NotFound(action = NotFoundAction.IGNORE)
	private Estado estado;
	
	@Column(name = "fecha_visita")
	private String fechaVisita;
	
	@Column(name = "ticket_cu")
	private String ticketCu;
	
	public Pauta(){}
	
	public Pauta(Long id){
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
	 * @return the numeroRequerimiento
	 */
	public int getNumeroRequerimiento() {
		return numeroRequerimiento;
	}

	/**
	 * @param numeroRequerimiento the numeroRequerimiento to set
	 */
	public void setNumeroRequerimiento(int numeroRequerimiento) {
		this.numeroRequerimiento = numeroRequerimiento;
	}

	/**
	 * @return the prioridad
	 */
	public Prioridad getPrioridad() {
		return prioridad;
	}

	/**
	 * @param prioridad the prioridad to set
	 */
	public void setPrioridad(Prioridad prioridad) {
		this.prioridad = prioridad;
	}

	/**
	 * @return the descripcionIssue
	 */
	public String getDescripcionIssue() {
		return descripcionIssue;
	}

	/**
	 * @param descripcionIssue the descripcionIssue to set
	 */
	public void setDescripcionIssue(String descripcionIssue) {
		this.descripcionIssue = descripcionIssue;
	}

	/**
	 * @return the reportado
	 */
	public Reportado getReportado() {
		return reportado;
	}

	/**
	 * @param reportado the reportado to set
	 */
	public void setReportado(Reportado reportado) {
		this.reportado = reportado;
	}

	/**
	 * @return the area
	 */
	public Area getArea() {
		return area;
	}

	/**
	 * @param area the area to set
	 */
	public void setArea(Area area) {
		this.area = area;
	}

	/**
	 * @return the observacion
	 */
	public String getObservacion() {
		return observacion;
	}

	/**
	 * @param observacion the observacion to set
	 */
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	/**
	 * @return the tienda
	 */
	public Tienda getTienda() {
		return tienda;
	}

	/**
	 * @param tienda the tienda to set
	 */
	public void setTienda(Tienda tienda) {
		this.tienda = tienda;
	}

	/**
	 * @return the padrino
	 */
	public Padrino getPadrino() {
		return padrino;
	}

	/**
	 * @param padrino the padrino to set
	 */
	public void setPadrino(Padrino padrino) {
		this.padrino = padrino;
	}

	/**
	 * @return the gerente
	 */
	public Gerente getGerente() {
		return gerente;
	}

	/**
	 * @param gerente the gerente to set
	 */
	public void setGerente(Gerente gerente) {
		this.gerente = gerente;
	}

	/**
	 * @return the contratante
	 */
	public Contratante getContratante() {
		return contratante;
	}

	/**
	 * @param contratante the contratante to set
	 */
	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}

	/**
	 * @return the soporte
	 */
	public Soporte getSoporte() {
		return soporte;
	}

	/**
	 * @param soporte the soporte to set
	 */
	public void setSoporte(Soporte soporte) {
		this.soporte = soporte;
	}

	/**
	 * @return the estado
	 */
	public Estado getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	/**
	 * @return the fechaVisita
	 */
	public String getFechaVisita() {
		return fechaVisita;
	}

	/**
	 * @param fechaVisita the fechaVisita to set
	 */
	public void setFechaVisita(String fechaVisita) {
		this.fechaVisita = fechaVisita;
	}

	/**
	 * @return the ticketCu
	 */
	public String getTicketCu() {
		return ticketCu;
	}

	/**
	 * @param ticketCu the ticketCu to set
	 */
	public void setTicketCu(String ticketCu) {
		this.ticketCu = ticketCu;
	}

	
	
	
}
