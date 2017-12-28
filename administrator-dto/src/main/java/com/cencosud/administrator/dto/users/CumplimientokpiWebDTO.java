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

public class CumplimientokpiWebDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;

	private EstadoCumpleDTO cumple;

	private EstadoCumpleResumenDTO resumen;

	private EstadoCumplimientoDTO cumplimiento;

	private EstadoResponsableDTO responsable;

	private TipoOrdenDTO orden;

	private TipoVentaDTO venta;

	private ClienteRetiraDTO cliente;

	private DescripcionEmpresaDTO descripcionEmpresa;

	private TipoGuiaDTO guia;

	private HorarioDTO horario;

	private VentaEmpresaDTO empresa;
	
	private String fecha;
	
	private int tipoCumplimiento;

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
	 * @return the cumple
	 */
	public EstadoCumpleDTO getCumple() {
		return cumple;
	}

	/**
	 * @param cumple the cumple to set
	 */
	public void setCumple(EstadoCumpleDTO cumple) {
		this.cumple = cumple;
	}

	/**
	 * @return the resumen
	 */
	public EstadoCumpleResumenDTO getResumen() {
		return resumen;
	}

	/**
	 * @param resumen the resumen to set
	 */
	public void setResumen(EstadoCumpleResumenDTO resumen) {
		this.resumen = resumen;
	}

	/**
	 * @return the cumplimiento
	 */
	public EstadoCumplimientoDTO getCumplimiento() {
		return cumplimiento;
	}

	/**
	 * @param cumplimiento the cumplimiento to set
	 */
	public void setCumplimiento(EstadoCumplimientoDTO cumplimiento) {
		this.cumplimiento = cumplimiento;
	}

	/**
	 * @return the responsable
	 */
	public EstadoResponsableDTO getResponsable() {
		return responsable;
	}

	/**
	 * @param responsable the responsable to set
	 */
	public void setResponsable(EstadoResponsableDTO responsable) {
		this.responsable = responsable;
	}

	/**
	 * @return the orden
	 */
	public TipoOrdenDTO getOrden() {
		return orden;
	}

	/**
	 * @param orden the orden to set
	 */
	public void setOrden(TipoOrdenDTO orden) {
		this.orden = orden;
	}

	/**
	 * @return the venta
	 */
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
	 * @return the cliente
	 */
	public ClienteRetiraDTO getCliente() {
		return cliente;
	}

	/**
	 * @param cliente the cliente to set
	 */
	public void setCliente(ClienteRetiraDTO cliente) {
		this.cliente = cliente;
	}

	/**
	 * @return the descripcionEmpresa
	 */
	public DescripcionEmpresaDTO getDescripcionEmpresa() {
		return descripcionEmpresa;
	}

	/**
	 * @param descripcionEmpresa the descripcionEmpresa to set
	 */
	public void setDescripcionEmpresa(DescripcionEmpresaDTO descripcionEmpresa) {
		this.descripcionEmpresa = descripcionEmpresa;
	}

	/**
	 * @return the guia
	 */
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
	 * @return the horario
	 */
	public HorarioDTO getHorario() {
		return horario;
	}

	/**
	 * @param horario the horario to set
	 */
	public void setHorario(HorarioDTO horario) {
		this.horario = horario;
	}

	/**
	 * @return the empresa
	 */
	public VentaEmpresaDTO getEmpresa() {
		return empresa;
	}

	/**
	 * @param empresa the empresa to set
	 */
	public void setEmpresa(VentaEmpresaDTO empresa) {
		this.empresa = empresa;
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
	 * @return the tipoCumplimiento
	 */
	public int getTipoCumplimiento() {
		return tipoCumplimiento;
	}

	/**
	 * @param tipoCumplimiento the tipoCumplimiento to set
	 */
	public void setTipoCumplimiento(int tipoCumplimiento) {
		this.tipoCumplimiento = tipoCumplimiento;
	}

	

}
