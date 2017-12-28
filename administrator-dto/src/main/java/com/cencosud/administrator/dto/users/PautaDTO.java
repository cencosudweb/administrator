/**
 *@name ChannelDTO.java
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
 * @description Clase ChannelDTO para la transferencia de datos
 */

public class PautaDTO implements Serializable {
	
	private static final long serialVersionUID = 3657265432071279059L;

	private Long id;

	private int numeroRequerimiento;
	
	private PrioridadDTO prioridad;

	private String descripcionIssue;
	
	private ReportadoDTO reportado;
	
	private AreaDTO area;
	
	private String observacion;
	
	
	private TiendaDTO tienda;
	
	private PadrinoDTO padrino;
	
	private GerenteDTO gerente;
	
	private ContratanteDTO contratante;
	
	private SoporteDTO soporte;
	
	private EstadoDTO estado;
	
	private String fechaVisita;

	private String fechaVisita2;
	
	
	private String valorTienda;
	
	private String valorPadrino;
	
	private String valorGerente;
	
	private String valorContratante;
	
	private String valorSoporte;
	
	private String typeSelected;
	
	private String valid;
	
	private String archive;
	
	private String ticketCu;

	public PautaDTO(){}
	
	public PautaDTO(Long id){
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
	public PrioridadDTO getPrioridad() {
		return prioridad;
	}

	/**
	 * @param prioridad the prioridad to set
	 */
	public void setPrioridad(PrioridadDTO prioridad) {
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
	public ReportadoDTO getReportado() {
		return reportado;
	}

	/**
	 * @param reportado the reportado to set
	 */
	public void setReportado(ReportadoDTO reportado) {
		this.reportado = reportado;
	}

	/**
	 * @return the area
	 */
	public AreaDTO getArea() {
		return area;
	}

	/**
	 * @param area the area to set
	 */
	public void setArea(AreaDTO area) {
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
	public TiendaDTO getTienda() {
		return tienda;
	}

	/**
	 * @param tienda the tienda to set
	 */
	public void setTienda(TiendaDTO tienda) {
		this.tienda = tienda;
	}

	/**
	 * @return the padrino
	 */
	public PadrinoDTO getPadrino() {
		return padrino;
	}

	/**
	 * @param padrino the padrino to set
	 */
	public void setPadrino(PadrinoDTO padrino) {
		this.padrino = padrino;
	}

	/**
	 * @return the gerente
	 */
	public GerenteDTO getGerente() {
		return gerente;
	}

	/**
	 * @param gerente the gerente to set
	 */
	public void setGerente(GerenteDTO gerente) {
		this.gerente = gerente;
	}

	/**
	 * @return the contratante
	 */
	public ContratanteDTO getContratante() {
		return contratante;
	}

	/**
	 * @param contratante the contratante to set
	 */
	public void setContratante(ContratanteDTO contratante) {
		this.contratante = contratante;
	}

	/**
	 * @return the soporte
	 */
	public SoporteDTO getSoporte() {
		return soporte;
	}

	/**
	 * @param soporte the soporte to set
	 */
	public void setSoporte(SoporteDTO soporte) {
		this.soporte = soporte;
	}

	/**
	 * @return the estado
	 */
	public EstadoDTO getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(EstadoDTO estado) {
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
	 * @return the fechaVisita2
	 */
	public String getFechaVisita2() {
		return fechaVisita2;
	}

	/**
	 * @param fechaVisita2 the fechaVisita2 to set
	 */
	public void setFechaVisita2(String fechaVisita2) {
		this.fechaVisita2 = fechaVisita2;
	}

	/**
	 * @return the valorTienda
	 */
	public String getValorTienda() {
		return valorTienda;
	}

	/**
	 * @param valorTienda the valorTienda to set
	 */
	public void setValorTienda(String valorTienda) {
		this.valorTienda = valorTienda;
	}

	/**
	 * @return the valorPadrino
	 */
	public String getValorPadrino() {
		return valorPadrino;
	}

	/**
	 * @param valorPadrino the valorPadrino to set
	 */
	public void setValorPadrino(String valorPadrino) {
		this.valorPadrino = valorPadrino;
	}

	/**
	 * @return the valorGerente
	 */
	public String getValorGerente() {
		return valorGerente;
	}

	/**
	 * @param valorGerente the valorGerente to set
	 */
	public void setValorGerente(String valorGerente) {
		this.valorGerente = valorGerente;
	}

	/**
	 * @return the valorContratante
	 */
	public String getValorContratante() {
		return valorContratante;
	}

	/**
	 * @param valorContratante the valorContratante to set
	 */
	public void setValorContratante(String valorContratante) {
		this.valorContratante = valorContratante;
	}

	/**
	 * @return the valorSoporte
	 */
	public String getValorSoporte() {
		return valorSoporte;
	}

	/**
	 * @param valorSoporte the valorSoporte to set
	 */
	public void setValorSoporte(String valorSoporte) {
		this.valorSoporte = valorSoporte;
	}

	/**
	 * @return the typeSelected
	 */
	public String getTypeSelected() {
		return typeSelected;
	}

	/**
	 * @param typeSelected the typeSelected to set
	 */
	public void setTypeSelected(String typeSelected) {
		this.typeSelected = typeSelected;
	}

	/**
	 * @return the valid
	 */
	public String getValid() {
		return valid;
	}

	/**
	 * @param valid the valid to set
	 */
	public void setValid(String valid) {
		this.valid = valid;
	}

	/**
	 * @return the archive
	 */
	public String getArchive() {
		return archive;
	}

	/**
	 * @param archive the archive to set
	 */
	public void setArchive(String archive) {
		this.archive = archive;
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
