/**
 * 
 */
package com.cencosud.administrator.dao.domain;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "cumplimiento")
public class Cumplimiento implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CUMPLIMIENTO")
	@SequenceGenerator(name = "SEQUENCE_CUMPLIMIENTO", sequenceName = "SEQUENCE_CUMPLIMIENTO", allocationSize = 1)
	private Long id;

	@Column(name = "TC_PO_LINE_ID")
	private String tcPoLineId;

	@Column(name = "CUMPL_CALC")
	private String cumplCalc;

	@Column(name = "CUMPL_EOM")
	private String cumplEom;

	@Column(name = "CUMPL_BTK")
	private String cumplBtk;

	@Column(name = "FECHA_COMPROMISO_EOM")
	private String fechaCompromisoEom;

	@Column(name = "FECHA_COMPROMISO_BTK")
	private String fechaCompromisoBtk;

	@Column(name = "ESTADO_CALCE_EOM")
	private String estadoCalceEom;

	@Column(name = "SUBESTADO_CALCE_EOM")
	private String subEstadoCalceEom;

	@Column(name = "FECHA_CALCE_EOM")
	private String fechaCalceEom;

	@Column(name = "HORA_CALCE_EOM")
	private String horaCalceEom;
	
	
	@Column(name = "ESTADO_CALCE_BTK")
	private String estadoCalceBtk;
	
	@Column(name = "SUBESTADO_CALCE_BTK")
	private String subEstadoCalceBtk;
	
	
	@Column(name = "FECHA_CALCE_BTK")
	private String fechaCalceBtk;

	
	
	@Column(name = "HORA_CALCE_BTK")
	private String horaCalceBtk;
	
	
	@Column(name = "CRUCE_ESTADO")
	private String cruceEstado;
	
	
	@Column(name = "CRUCE_SUB_ESTADO")
	private String cruceSubEstado;
	
	@Column(name = "N_SOLICITUD_CLIENTE")
	private String nSolicitudCliente;
	
	@Column(name = "N_ORDEN_DISTRIBU")
	private String nOrdenDistribu;
	
	@Column(name = "FECHA_CREACION_ORDEN")
	private String fechaCreacionOrden;
	
	@Column(name = "EST_ORDEN")
	private String estOrden;
	
	@Column(name = "ESTADO_DE_LINEA")
	private String estadoDeLinea;
	
	@Column(name = "SKU")
	private String sku;
	
	@Column(name = "CANT_DESC_SKU")
	private String cantDescSku;
	
	@Column(name = "LOCAL_VENTA")
	private String localVenta;
	
	@Column(name = "DEPART")
	private String depart;
	
	@Column(name = "BODEGADESP")
	private String bodegaDesp;
	
	@Column(name = "RUTCLIENTE")
	private String rutCliente;
	
	@Column(name = "NOMBRECLIENTE")
	private String nombreCliente;
	
	@Column(name = "APELLIDOCLIENTE")
	private String apellidoCliente;
	
	@Column(name = "DIRECCION_CLIENTE")
	private String direccionCliente;
	
	@Column(name = "COD_COMUNA")
	private String codComuna;
	
	@Column(name = "COMUNA")
	private String comuna;
	
	@Column(name = "CIUDAD")
	private String ciudad;
	
	@Column(name = "REGION")
	private String region;
	
	@Column(name = "HORARIO")
	private String horario;
	
	@Column(name = "TIPO_ORDEN")
	private String tipoOrden;
	
	@Column(name = "TIPO_VENTA")
	private String tipoVenta;
	
	@Column(name = "O_FACILITY_ALIAS_ID")
	private String oFaclilityAliasId;
	
	@Column(name = "REGIONENTREGA")
	private String regionEntrega;
	
	@Column(name = "TIPO_DE_ORDEN")
	private String tipoDeOrden;
	
	@Column(name = "GUIA")
	private String guia;
	
	@Column(name = "RUT_EMP")
	private String rutEmp;
	
	@Column(name = "DESC_EMP")
	private String descEmp;
	
	@Column(name = "TIPOGUI")
	private String tipoGui;
	
	@Column(name = "CLIENTE_RETIRA")
	private String clienteRetira;
	
	@Column(name = "FECHA_PRIMER_INTENTO")
	private String fechaPrimerIntento;
	
	@Column(name = "NUMERO_INTENTOS")
	private String numeroIntentos;
	
	@Column(name = "FECHA_CREA_PKT")
	private String fechaCreaPkt;
	
	@Column(name = "HORA_CREA_PKT")
	private String horaCreaPkt;
	
	@Column(name = "NRO_OLA")
	private String nroOla;
	
	@Column(name = "FECHA_INICIO_OLA")
	private String fechaInicioOla;
	
	@Column(name = "HORA_INICIO_OLA")
	private String horaInicioOla;
	
	@Column(name = "FECHA_TERMINO_OLA")
	private String fechaTerminoOla;
	
	@Column(name = "HORA_TERMINO_OLA")
	private String horaTerminoOla;
	
	@Column(name = "FECHA_CIERRE_CARGA")
	private String fechaCierreCarga;
	
	@Column(name = "HORA_CIERRE_CARGA")
	private String horaCierreCarga;
	
	@Column(name = "FECEMIGUI")
	private String feceMigui;
	
	@Column(name = "LEAD_TIME_TRANSPORTE")
	private String leadTimeTranspotre;
	
	@Column(name = "DIA_SEMANA_ETA")
	private String diaSemanaEta;
	
	@Column(name = "ENTREGA_DIA_COMPROMISO")
	private String entregaDiaCompromiso;
	
	@Column(name = "VENTA_EMPRESA")
	private String ventaEmpresa;
	
	@Column(name = "CUMPLE")
	private String cumple;
	
	@Column(name = "CUMPLIMIENTO_2")
	private String cumplimiento_2;
	
	@Column(name = "CUMPLE_RESUMEN")
	private String cumpleResumen;
	
	@Column(name = "BODEGA_DESPACHO")
	private String bodegaDespacho;
	
	@Column(name = "DIF_ETA_CARGA")
	private String difEtaCarga;
	
	@Column(name = "FECHA_CARGA_REQUERIDA")
	private String fechaCargaRequerida;
	
	@Column(name = "EVAL_SISTEMA")
	private String evalSistem;
	
	@Column(name = "EVAL_CD")
	private String evalCd;
	
	@Column(name = "EVAL_1ER_INTENTO")
	private String eval1ErIntento;
	
	@Column(name = "CUMPLIMIENTO_CLIENTE")
	private String cumplimientoCliente;
	
	@Column(name = "RESPONSABLE")
	private String responsable;
	
	@Column(name = "TIPO_CUMPLIMIENTO")
	private String tipoCumplimiento;
	
	@Column(name = "LLAVE")
	private String llave;
	
	@Column(name = "FECHA_INGRESO")
	private Date fechaIngreso;

	@Column(name = "CUMPLIMIENTO_FORMULA")
	private String cumplimientoFormula;

	
	
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
	 * @return the tcPoLineId
	 */
	public String getTcPoLineId() {
		return tcPoLineId;
	}

	/**
	 * @param tcPoLineId the tcPoLineId to set
	 */
	public void setTcPoLineId(String tcPoLineId) {
		this.tcPoLineId = tcPoLineId;
	}

	/**
	 * @return the cumplCalc
	 */
	public String getCumplCalc() {
		return cumplCalc;
	}

	/**
	 * @param cumplCalc the cumplCalc to set
	 */
	public void setCumplCalc(String cumplCalc) {
		this.cumplCalc = cumplCalc;
	}

	/**
	 * @return the cumplEom
	 */
	public String getCumplEom() {
		return cumplEom;
	}

	/**
	 * @param cumplEom the cumplEom to set
	 */
	public void setCumplEom(String cumplEom) {
		this.cumplEom = cumplEom;
	}

	/**
	 * @return the cumplBtk
	 */
	public String getCumplBtk() {
		return cumplBtk;
	}

	/**
	 * @param cumplBtk the cumplBtk to set
	 */
	public void setCumplBtk(String cumplBtk) {
		this.cumplBtk = cumplBtk;
	}

	/**
	 * @return the fechaCompromisoEom
	 */
	public String getFechaCompromisoEom() {
		return fechaCompromisoEom;
	}

	/**
	 * @param fechaCompromisoEom the fechaCompromisoEom to set
	 */
	public void setFechaCompromisoEom(String fechaCompromisoEom) {
		this.fechaCompromisoEom = fechaCompromisoEom;
	}

	/**
	 * @return the fechaCompromisoBtk
	 */
	public String getFechaCompromisoBtk() {
		return fechaCompromisoBtk;
	}

	/**
	 * @param fechaCompromisoBtk the fechaCompromisoBtk to set
	 */
	public void setFechaCompromisoBtk(String fechaCompromisoBtk) {
		this.fechaCompromisoBtk = fechaCompromisoBtk;
	}

	/**
	 * @return the estadoCalceEom
	 */
	public String getEstadoCalceEom() {
		return estadoCalceEom;
	}

	/**
	 * @param estadoCalceEom the estadoCalceEom to set
	 */
	public void setEstadoCalceEom(String estadoCalceEom) {
		this.estadoCalceEom = estadoCalceEom;
	}

	/**
	 * @return the subEstadoCalceEom
	 */
	public String getSubEstadoCalceEom() {
		return subEstadoCalceEom;
	}

	/**
	 * @param subEstadoCalceEom the subEstadoCalceEom to set
	 */
	public void setSubEstadoCalceEom(String subEstadoCalceEom) {
		this.subEstadoCalceEom = subEstadoCalceEom;
	}

	/**
	 * @return the fechaCalceEom
	 */
	public String getFechaCalceEom() {
		return fechaCalceEom;
	}

	/**
	 * @param fechaCalceEom the fechaCalceEom to set
	 */
	public void setFechaCalceEom(String fechaCalceEom) {
		this.fechaCalceEom = fechaCalceEom;
	}

	/**
	 * @return the horaCalceEom
	 */
	public String getHoraCalceEom() {
		return horaCalceEom;
	}

	/**
	 * @param horaCalceEom the horaCalceEom to set
	 */
	public void setHoraCalceEom(String horaCalceEom) {
		this.horaCalceEom = horaCalceEom;
	}

	/**
	 * @return the estadoCalceBtk
	 */
	public String getEstadoCalceBtk() {
		return estadoCalceBtk;
	}

	/**
	 * @param estadoCalceBtk the estadoCalceBtk to set
	 */
	public void setEstadoCalceBtk(String estadoCalceBtk) {
		this.estadoCalceBtk = estadoCalceBtk;
	}

	/**
	 * @return the subEstadoCalceBtk
	 */
	public String getSubEstadoCalceBtk() {
		return subEstadoCalceBtk;
	}

	/**
	 * @param subEstadoCalceBtk the subEstadoCalceBtk to set
	 */
	public void setSubEstadoCalceBtk(String subEstadoCalceBtk) {
		this.subEstadoCalceBtk = subEstadoCalceBtk;
	}

	/**
	 * @return the fechaCalceBtk
	 */
	public String getFechaCalceBtk() {
		return fechaCalceBtk;
	}

	/**
	 * @param fechaCalceBtk the fechaCalceBtk to set
	 */
	public void setFechaCalceBtk(String fechaCalceBtk) {
		this.fechaCalceBtk = fechaCalceBtk;
	}

	/**
	 * @return the horaCalceBtk
	 */
	public String getHoraCalceBtk() {
		return horaCalceBtk;
	}

	/**
	 * @param horaCalceBtk the horaCalceBtk to set
	 */
	public void setHoraCalceBtk(String horaCalceBtk) {
		this.horaCalceBtk = horaCalceBtk;
	}

	/**
	 * @return the cruceEstado
	 */
	public String getCruceEstado() {
		return cruceEstado;
	}

	/**
	 * @param cruceEstado the cruceEstado to set
	 */
	public void setCruceEstado(String cruceEstado) {
		this.cruceEstado = cruceEstado;
	}

	/**
	 * @return the cruceSubEstado
	 */
	public String getCruceSubEstado() {
		return cruceSubEstado;
	}

	/**
	 * @param cruceSubEstado the cruceSubEstado to set
	 */
	public void setCruceSubEstado(String cruceSubEstado) {
		this.cruceSubEstado = cruceSubEstado;
	}

	/**
	 * @return the nSolicitudCliente
	 */
	public String getnSolicitudCliente() {
		return nSolicitudCliente;
	}

	/**
	 * @param nSolicitudCliente the nSolicitudCliente to set
	 */
	public void setnSolicitudCliente(String nSolicitudCliente) {
		this.nSolicitudCliente = nSolicitudCliente;
	}

	/**
	 * @return the nOrdenDistribu
	 */
	public String getnOrdenDistribu() {
		return nOrdenDistribu;
	}

	/**
	 * @param nOrdenDistribu the nOrdenDistribu to set
	 */
	public void setnOrdenDistribu(String nOrdenDistribu) {
		this.nOrdenDistribu = nOrdenDistribu;
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
	 * @return the estOrden
	 */
	public String getEstOrden() {
		return estOrden;
	}

	/**
	 * @param estOrden the estOrden to set
	 */
	public void setEstOrden(String estOrden) {
		this.estOrden = estOrden;
	}

	/**
	 * @return the estadoDeLinea
	 */
	public String getEstadoDeLinea() {
		return estadoDeLinea;
	}

	/**
	 * @param estadoDeLinea the estadoDeLinea to set
	 */
	public void setEstadoDeLinea(String estadoDeLinea) {
		this.estadoDeLinea = estadoDeLinea;
	}

	/**
	 * @return the sku
	 */
	public String getSku() {
		return sku;
	}

	/**
	 * @param sku the sku to set
	 */
	public void setSku(String sku) {
		this.sku = sku;
	}

	/**
	 * @return the cantDescSku
	 */
	public String getCantDescSku() {
		return cantDescSku;
	}

	/**
	 * @param cantDescSku the cantDescSku to set
	 */
	public void setCantDescSku(String cantDescSku) {
		this.cantDescSku = cantDescSku;
	}

	/**
	 * @return the localVenta
	 */
	public String getLocalVenta() {
		return localVenta;
	}

	/**
	 * @param localVenta the localVenta to set
	 */
	public void setLocalVenta(String localVenta) {
		this.localVenta = localVenta;
	}

	/**
	 * @return the depart
	 */
	public String getDepart() {
		return depart;
	}

	/**
	 * @param depart the depart to set
	 */
	public void setDepart(String depart) {
		this.depart = depart;
	}

	/**
	 * @return the bodegaDesp
	 */
	public String getBodegaDesp() {
		return bodegaDesp;
	}

	/**
	 * @param bodegaDesp the bodegaDesp to set
	 */
	public void setBodegaDesp(String bodegaDesp) {
		this.bodegaDesp = bodegaDesp;
	}

	/**
	 * @return the rutCliente
	 */
	public String getRutCliente() {
		return rutCliente;
	}

	/**
	 * @param rutCliente the rutCliente to set
	 */
	public void setRutCliente(String rutCliente) {
		this.rutCliente = rutCliente;
	}

	/**
	 * @return the nombreCliente
	 */
	public String getNombreCliente() {
		return nombreCliente;
	}

	/**
	 * @param nombreCliente the nombreCliente to set
	 */
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	/**
	 * @return the apellidoCliente
	 */
	public String getApellidoCliente() {
		return apellidoCliente;
	}

	/**
	 * @param apellidoCliente the apellidoCliente to set
	 */
	public void setApellidoCliente(String apellidoCliente) {
		this.apellidoCliente = apellidoCliente;
	}

	/**
	 * @return the direccionCliente
	 */
	public String getDireccionCliente() {
		return direccionCliente;
	}

	/**
	 * @param direccionCliente the direccionCliente to set
	 */
	public void setDireccionCliente(String direccionCliente) {
		this.direccionCliente = direccionCliente;
	}

	/**
	 * @return the codComuna
	 */
	public String getCodComuna() {
		return codComuna;
	}

	/**
	 * @param codComuna the codComuna to set
	 */
	public void setCodComuna(String codComuna) {
		this.codComuna = codComuna;
	}

	/**
	 * @return the comuna
	 */
	public String getComuna() {
		return comuna;
	}

	/**
	 * @param comuna the comuna to set
	 */
	public void setComuna(String comuna) {
		this.comuna = comuna;
	}

	/**
	 * @return the ciudad
	 */
	public String getCiudad() {
		return ciudad;
	}

	/**
	 * @param ciudad the ciudad to set
	 */
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	/**
	 * @return the region
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * @param region the region to set
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * @return the horario
	 */
	public String getHorario() {
		return horario;
	}

	/**
	 * @param horario the horario to set
	 */
	public void setHorario(String horario) {
		this.horario = horario;
	}

	/**
	 * @return the tipoOrden
	 */
	public String getTipoOrden() {
		return tipoOrden;
	}

	/**
	 * @param tipoOrden the tipoOrden to set
	 */
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}

	/**
	 * @return the tipoVenta
	 */
	public String getTipoVenta() {
		return tipoVenta;
	}

	/**
	 * @param tipoVenta the tipoVenta to set
	 */
	public void setTipoVenta(String tipoVenta) {
		this.tipoVenta = tipoVenta;
	}

	/**
	 * @return the oFaclilityAliasId
	 */
	public String getoFaclilityAliasId() {
		return oFaclilityAliasId;
	}

	/**
	 * @param oFaclilityAliasId the oFaclilityAliasId to set
	 */
	public void setoFaclilityAliasId(String oFaclilityAliasId) {
		this.oFaclilityAliasId = oFaclilityAliasId;
	}

	/**
	 * @return the regionEntrega
	 */
	public String getRegionEntrega() {
		return regionEntrega;
	}

	/**
	 * @param regionEntrega the regionEntrega to set
	 */
	public void setRegionEntrega(String regionEntrega) {
		this.regionEntrega = regionEntrega;
	}

	/**
	 * @return the tipoDeOrden
	 */
	public String getTipoDeOrden() {
		return tipoDeOrden;
	}

	/**
	 * @param tipoDeOrden the tipoDeOrden to set
	 */
	public void setTipoDeOrden(String tipoDeOrden) {
		this.tipoDeOrden = tipoDeOrden;
	}

	/**
	 * @return the guia
	 */
	public String getGuia() {
		return guia;
	}

	/**
	 * @param guia the guia to set
	 */
	public void setGuia(String guia) {
		this.guia = guia;
	}

	/**
	 * @return the rutEmp
	 */
	public String getRutEmp() {
		return rutEmp;
	}

	/**
	 * @param rutEmp the rutEmp to set
	 */
	public void setRutEmp(String rutEmp) {
		this.rutEmp = rutEmp;
	}

	/**
	 * @return the descEmp
	 */
	public String getDescEmp() {
		return descEmp;
	}

	/**
	 * @param descEmp the descEmp to set
	 */
	public void setDescEmp(String descEmp) {
		this.descEmp = descEmp;
	}

	/**
	 * @return the tipoGui
	 */
	public String getTipoGui() {
		return tipoGui;
	}

	/**
	 * @param tipoGui the tipoGui to set
	 */
	public void setTipoGui(String tipoGui) {
		this.tipoGui = tipoGui;
	}

	/**
	 * @return the clienteRetira
	 */
	public String getClienteRetira() {
		return clienteRetira;
	}

	/**
	 * @param clienteRetira the clienteRetira to set
	 */
	public void setClienteRetira(String clienteRetira) {
		this.clienteRetira = clienteRetira;
	}

	/**
	 * @return the fechaPrimerIntento
	 */
	public String getFechaPrimerIntento() {
		return fechaPrimerIntento;
	}

	/**
	 * @param fechaPrimerIntento the fechaPrimerIntento to set
	 */
	public void setFechaPrimerIntento(String fechaPrimerIntento) {
		this.fechaPrimerIntento = fechaPrimerIntento;
	}

	/**
	 * @return the numeroIntentos
	 */
	public String getNumeroIntentos() {
		return numeroIntentos;
	}

	/**
	 * @param numeroIntentos the numeroIntentos to set
	 */
	public void setNumeroIntentos(String numeroIntentos) {
		this.numeroIntentos = numeroIntentos;
	}

	/**
	 * @return the fechaCreaPkt
	 */
	public String getFechaCreaPkt() {
		return fechaCreaPkt;
	}

	/**
	 * @param fechaCreaPkt the fechaCreaPkt to set
	 */
	public void setFechaCreaPkt(String fechaCreaPkt) {
		this.fechaCreaPkt = fechaCreaPkt;
	}

	/**
	 * @return the horaCreaPkt
	 */
	public String getHoraCreaPkt() {
		return horaCreaPkt;
	}

	/**
	 * @param horaCreaPkt the horaCreaPkt to set
	 */
	public void setHoraCreaPkt(String horaCreaPkt) {
		this.horaCreaPkt = horaCreaPkt;
	}

	/**
	 * @return the nroOla
	 */
	public String getNroOla() {
		return nroOla;
	}

	/**
	 * @param nroOla the nroOla to set
	 */
	public void setNroOla(String nroOla) {
		this.nroOla = nroOla;
	}

	/**
	 * @return the fechaInicioOla
	 */
	public String getFechaInicioOla() {
		return fechaInicioOla;
	}

	/**
	 * @param fechaInicioOla the fechaInicioOla to set
	 */
	public void setFechaInicioOla(String fechaInicioOla) {
		this.fechaInicioOla = fechaInicioOla;
	}

	/**
	 * @return the horaInicioOla
	 */
	public String getHoraInicioOla() {
		return horaInicioOla;
	}

	/**
	 * @param horaInicioOla the horaInicioOla to set
	 */
	public void setHoraInicioOla(String horaInicioOla) {
		this.horaInicioOla = horaInicioOla;
	}

	/**
	 * @return the fechaTerminoOla
	 */
	public String getFechaTerminoOla() {
		return fechaTerminoOla;
	}

	/**
	 * @param fechaTerminoOla the fechaTerminoOla to set
	 */
	public void setFechaTerminoOla(String fechaTerminoOla) {
		this.fechaTerminoOla = fechaTerminoOla;
	}

	/**
	 * @return the horaTerminoOla
	 */
	public String getHoraTerminoOla() {
		return horaTerminoOla;
	}

	/**
	 * @param horaTerminoOla the horaTerminoOla to set
	 */
	public void setHoraTerminoOla(String horaTerminoOla) {
		this.horaTerminoOla = horaTerminoOla;
	}

	/**
	 * @return the fechaCierreCarga
	 */
	public String getFechaCierreCarga() {
		return fechaCierreCarga;
	}

	/**
	 * @param fechaCierreCarga the fechaCierreCarga to set
	 */
	public void setFechaCierreCarga(String fechaCierreCarga) {
		this.fechaCierreCarga = fechaCierreCarga;
	}

	/**
	 * @return the horaCierreCarga
	 */
	public String getHoraCierreCarga() {
		return horaCierreCarga;
	}

	/**
	 * @param horaCierreCarga the horaCierreCarga to set
	 */
	public void setHoraCierreCarga(String horaCierreCarga) {
		this.horaCierreCarga = horaCierreCarga;
	}

	/**
	 * @return the feceMigui
	 */
	public String getFeceMigui() {
		return feceMigui;
	}

	/**
	 * @param feceMigui the feceMigui to set
	 */
	public void setFeceMigui(String feceMigui) {
		this.feceMigui = feceMigui;
	}

	/**
	 * @return the leadTimeTranspotre
	 */
	public String getLeadTimeTranspotre() {
		return leadTimeTranspotre;
	}

	/**
	 * @param leadTimeTranspotre the leadTimeTranspotre to set
	 */
	public void setLeadTimeTranspotre(String leadTimeTranspotre) {
		this.leadTimeTranspotre = leadTimeTranspotre;
	}

	/**
	 * @return the diaSemanaEta
	 */
	public String getDiaSemanaEta() {
		return diaSemanaEta;
	}

	/**
	 * @param diaSemanaEta the diaSemanaEta to set
	 */
	public void setDiaSemanaEta(String diaSemanaEta) {
		this.diaSemanaEta = diaSemanaEta;
	}

	/**
	 * @return the entregaDiaCompromiso
	 */
	public String getEntregaDiaCompromiso() {
		return entregaDiaCompromiso;
	}

	/**
	 * @param entregaDiaCompromiso the entregaDiaCompromiso to set
	 */
	public void setEntregaDiaCompromiso(String entregaDiaCompromiso) {
		this.entregaDiaCompromiso = entregaDiaCompromiso;
	}

	/**
	 * @return the ventaEmpresa
	 */
	public String getVentaEmpresa() {
		return ventaEmpresa;
	}

	/**
	 * @param ventaEmpresa the ventaEmpresa to set
	 */
	public void setVentaEmpresa(String ventaEmpresa) {
		this.ventaEmpresa = ventaEmpresa;
	}

	/**
	 * @return the cumple
	 */
	public String getCumple() {
		return cumple;
	}

	/**
	 * @param cumple the cumple to set
	 */
	public void setCumple(String cumple) {
		this.cumple = cumple;
	}

	/**
	 * @return the cumplimiento_2
	 */
	public String getCumplimiento_2() {
		return cumplimiento_2;
	}

	/**
	 * @param cumplimiento_2 the cumplimiento_2 to set
	 */
	public void setCumplimiento_2(String cumplimiento_2) {
		this.cumplimiento_2 = cumplimiento_2;
	}

	/**
	 * @return the cumpleResumen
	 */
	public String getCumpleResumen() {
		return cumpleResumen;
	}

	/**
	 * @param cumpleResumen the cumpleResumen to set
	 */
	public void setCumpleResumen(String cumpleResumen) {
		this.cumpleResumen = cumpleResumen;
	}

	/**
	 * @return the bodegaDespacho
	 */
	public String getBodegaDespacho() {
		return bodegaDespacho;
	}

	/**
	 * @param bodegaDespacho the bodegaDespacho to set
	 */
	public void setBodegaDespacho(String bodegaDespacho) {
		this.bodegaDespacho = bodegaDespacho;
	}

	/**
	 * @return the difEtaCarga
	 */
	public String getDifEtaCarga() {
		return difEtaCarga;
	}

	/**
	 * @param difEtaCarga the difEtaCarga to set
	 */
	public void setDifEtaCarga(String difEtaCarga) {
		this.difEtaCarga = difEtaCarga;
	}

	/**
	 * @return the fechaCargaRequerida
	 */
	public String getFechaCargaRequerida() {
		return fechaCargaRequerida;
	}

	/**
	 * @param fechaCargaRequerida the fechaCargaRequerida to set
	 */
	public void setFechaCargaRequerida(String fechaCargaRequerida) {
		this.fechaCargaRequerida = fechaCargaRequerida;
	}

	/**
	 * @return the evalSistem
	 */
	public String getEvalSistem() {
		return evalSistem;
	}

	/**
	 * @param evalSistem the evalSistem to set
	 */
	public void setEvalSistem(String evalSistem) {
		this.evalSistem = evalSistem;
	}

	/**
	 * @return the evalCd
	 */
	public String getEvalCd() {
		return evalCd;
	}

	/**
	 * @param evalCd the evalCd to set
	 */
	public void setEvalCd(String evalCd) {
		this.evalCd = evalCd;
	}

	/**
	 * @return the eval1ErIntento
	 */
	public String getEval1ErIntento() {
		return eval1ErIntento;
	}

	/**
	 * @param eval1ErIntento the eval1ErIntento to set
	 */
	public void setEval1ErIntento(String eval1ErIntento) {
		this.eval1ErIntento = eval1ErIntento;
	}

	/**
	 * @return the cumplimientoCliente
	 */
	public String getCumplimientoCliente() {
		return cumplimientoCliente;
	}

	/**
	 * @param cumplimientoCliente the cumplimientoCliente to set
	 */
	public void setCumplimientoCliente(String cumplimientoCliente) {
		this.cumplimientoCliente = cumplimientoCliente;
	}

	/**
	 * @return the responsable
	 */
	public String getResponsable() {
		return responsable;
	}

	/**
	 * @param responsable the responsable to set
	 */
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	/**
	 * @return the tipoCumplimiento
	 */
	public String getTipoCumplimiento() {
		return tipoCumplimiento;
	}

	/**
	 * @param tipoCumplimiento the tipoCumplimiento to set
	 */
	public void setTipoCumplimiento(String tipoCumplimiento) {
		this.tipoCumplimiento = tipoCumplimiento;
	}

	/**
	 * @return the llave
	 */
	public String getLlave() {
		return llave;
	}

	/**
	 * @param llave the llave to set
	 */
	public void setLlave(String llave) {
		this.llave = llave;
	}

	/**
	 * @return the fechaIngreso
	 */
	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	/**
	 * @param fechaIngreso the fechaIngreso to set
	 */
	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	/**
	 * @return the cumplimientoFormula
	 */
	public String getCumplimientoFormula() {
		return cumplimientoFormula;
	}

	/**
	 * @param cumplimientoFormula the cumplimientoFormula to set
	 */
	public void setCumplimientoFormula(String cumplimientoFormula) {
		this.cumplimientoFormula = cumplimientoFormula;
	}

	
}
