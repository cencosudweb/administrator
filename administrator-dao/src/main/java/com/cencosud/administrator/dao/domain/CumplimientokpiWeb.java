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
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * @author EA7129
 *
 */

@Entity
@Table(name = "cumplimiento_kpiweb")
public class CumplimientokpiWeb implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CUMPLIMIENTO")
	@SequenceGenerator(name = "SEQUENCE_CUMPLIMIENTO", sequenceName = "SEQUENCE_CUMPLIMIENTO", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne
	@JoinColumn(name = "ID_CUMPLE")
	@NotFound(action = NotFoundAction.IGNORE)
	private EstadoCumple cumple;

	@OneToOne
	@JoinColumn(name = "ID_CUMPLE_RESUMEN")
	@NotFound(action = NotFoundAction.IGNORE)
	private EstadoCumpleResumen resumen;

	@OneToOne
	@JoinColumn(name = "ID_CUMPLIMIENTO_2")
	@NotFound(action = NotFoundAction.IGNORE)
	private EstadoCumplimiento cumplimiento;

	@OneToOne
	@JoinColumn(name = "ID_RESPONSABLE")
	@NotFound(action = NotFoundAction.IGNORE)
	private EstadoResponsable responsable;

	@OneToOne
	@JoinColumn(name = "ID_TIPO_ORDEN")
	@NotFound(action = NotFoundAction.IGNORE)
	private TipoOrden orden;

	@OneToOne
	@JoinColumn(name = "ID_TIPO_VENTA")
	@NotFound(action = NotFoundAction.IGNORE)
	private TipoVenta venta;

	@OneToOne
	@JoinColumn(name = "ID_CLIENTE_RETIRA")
	@NotFound(action = NotFoundAction.IGNORE)
	private ClienteRetira cliente;

	@OneToOne
	@JoinColumn(name = "ID_DESC_EMP")
	@NotFound(action = NotFoundAction.IGNORE)
	private DescripcionEmpresa descripcionEmpresa;

	@OneToOne
	@JoinColumn(name = "ID_TIPOGUI")
	@NotFound(action = NotFoundAction.IGNORE)
	private TipoGuia guia;

	@OneToOne
	@JoinColumn(name = "ID_HORARIO")
	@NotFound(action = NotFoundAction.IGNORE)
	private Horario horario;

	@OneToOne
	@JoinColumn(name = "ID_VENTA_EMPRESA")
	@NotFound(action = NotFoundAction.IGNORE)
	private VentaEmpresa empresa;
	
	
	@Column(name = "FECHA_COMPROMISO_EOM")
	private String fecha;
	
	@Column(name = "TIPO_CUMPLIMIENTO")
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
	public EstadoCumple getCumple() {
		return cumple;
	}

	/**
	 * @param cumple the cumple to set
	 */
	public void setCumple(EstadoCumple cumple) {
		this.cumple = cumple;
	}

	/**
	 * @return the resumen
	 */
	public EstadoCumpleResumen getResumen() {
		return resumen;
	}

	/**
	 * @param resumen the resumen to set
	 */
	public void setResumen(EstadoCumpleResumen resumen) {
		this.resumen = resumen;
	}

	/**
	 * @return the cumplimiento
	 */
	public EstadoCumplimiento getCumplimiento() {
		return cumplimiento;
	}

	/**
	 * @param cumplimiento the cumplimiento to set
	 */
	public void setCumplimiento(EstadoCumplimiento cumplimiento) {
		this.cumplimiento = cumplimiento;
	}

	/**
	 * @return the responsable
	 */
	public EstadoResponsable getResponsable() {
		return responsable;
	}

	/**
	 * @param responsable the responsable to set
	 */
	public void setResponsable(EstadoResponsable responsable) {
		this.responsable = responsable;
	}

	/**
	 * @return the orden
	 */
	public TipoOrden getOrden() {
		return orden;
	}

	/**
	 * @param orden the orden to set
	 */
	public void setOrden(TipoOrden orden) {
		this.orden = orden;
	}

	/**
	 * @return the venta
	 */
	public TipoVenta getVenta() {
		return venta;
	}

	/**
	 * @param venta the venta to set
	 */
	public void setVenta(TipoVenta venta) {
		this.venta = venta;
	}

	/**
	 * @return the cliente
	 */
	public ClienteRetira getCliente() {
		return cliente;
	}

	/**
	 * @param cliente the cliente to set
	 */
	public void setCliente(ClienteRetira cliente) {
		this.cliente = cliente;
	}

	/**
	 * @return the descripcionEmpresa
	 */
	public DescripcionEmpresa getDescripcionEmpresa() {
		return descripcionEmpresa;
	}

	/**
	 * @param descripcionEmpresa the descripcionEmpresa to set
	 */
	public void setDescripcionEmpresa(DescripcionEmpresa descripcionEmpresa) {
		this.descripcionEmpresa = descripcionEmpresa;
	}

	/**
	 * @return the guia
	 */
	public TipoGuia getGuia() {
		return guia;
	}

	/**
	 * @param guia the guia to set
	 */
	public void setGuia(TipoGuia guia) {
		this.guia = guia;
	}

	/**
	 * @return the horario
	 */
	public Horario getHorario() {
		return horario;
	}

	/**
	 * @param horario the horario to set
	 */
	public void setHorario(Horario horario) {
		this.horario = horario;
	}

	/**
	 * @return the empresa
	 */
	public VentaEmpresa getEmpresa() {
		return empresa;
	}

	/**
	 * @param empresa the empresa to set
	 */
	public void setEmpresa(VentaEmpresa empresa) {
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
