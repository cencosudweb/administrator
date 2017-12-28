/**
 * 
 */
package com.cencosud.administrator.web.controller.admin.excel;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cencosud.administrator.dao.domain.Cumplimiento;
import com.cencosud.administrator.web.utils.DateUtils;
/**
 * @author JOSE
 *
 */

@Component
public class AdminCumplimientoControllerExcel extends AbstractExcelView {
	
	//private static final SystemLogDTO SystemLogDTO = null;
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HSSFSheet excelSheet = workbook.createSheet("Cumplimiento List");
		setExcelHeader(excelSheet);
		
		List<Cumplimiento> cumplimientoList = (List<Cumplimiento>) model.get("cumplimientoList");
		setExcelRows(excelSheet, cumplimientoList);
		
	}

	private void setExcelHeader(HSSFSheet excelSheet) {
		// TODO Auto-generated method stub
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Llave");
		excelHeader.createCell(1).setCellValue("Tc_Po_Line_Id");
		excelHeader.createCell(2).setCellValue("Cumplimiento_Formula");
		
		excelHeader.createCell(3).setCellValue("Cumpl_Calc");
		excelHeader.createCell(4).setCellValue("Cumpl_Eom");
		excelHeader.createCell(5).setCellValue("Cumpl_Btk");
		excelHeader.createCell(6).setCellValue("Fecha_Compromiso_Eom");
		excelHeader.createCell(7).setCellValue("Fecha_Compromiso_Btk");
		excelHeader.createCell(8).setCellValue("Estado_Calce_Eom");
		excelHeader.createCell(9).setCellValue("Sub_Estado_Calce_Eom");
		excelHeader.createCell(10).setCellValue("Fecha_Calce_Eom");
		excelHeader.createCell(11).setCellValue("Hora_Calce_Eom");
		excelHeader.createCell(12).setCellValue("Estado_Calce_Btk");
		excelHeader.createCell(13).setCellValue("Sub_Estado_Calce_Btk");
		excelHeader.createCell(14).setCellValue("Fecha_Calce_Btk");
		excelHeader.createCell(15).setCellValue("Hora_Calce_Btk");
		excelHeader.createCell(16).setCellValue("Cruce_Estado");
		excelHeader.createCell(17).setCellValue("Cruce_Sub_Estado");
		excelHeader.createCell(18).setCellValue("N_Solicitud_Cliente");
		excelHeader.createCell(19).setCellValue("N_Orden_Distribu");
		excelHeader.createCell(20).setCellValue("Fecha_Creacion_Orden");
		excelHeader.createCell(21).setCellValue("Est_Orden");
		excelHeader.createCell(22).setCellValue("Estado_De_Linea");
		excelHeader.createCell(23).setCellValue("Sku");
		excelHeader.createCell(24).setCellValue("Cant_Desc_Sku");
		excelHeader.createCell(25).setCellValue("Local_Venta");
		excelHeader.createCell(26).setCellValue("Depart");
		excelHeader.createCell(27).setCellValue("Bodega_Desp");
		excelHeader.createCell(28).setCellValue("Rut_Cliente");
		excelHeader.createCell(29).setCellValue("Nombre_Cliente");
		excelHeader.createCell(30).setCellValue("Apellido_Cliente");
		excelHeader.createCell(31).setCellValue("Direccion_Cliente");
		excelHeader.createCell(32).setCellValue("Cod_Comuna");
		excelHeader.createCell(33).setCellValue("Comuna");
		excelHeader.createCell(34).setCellValue("Ciudad");
		excelHeader.createCell(35).setCellValue("Region");
		excelHeader.createCell(36).setCellValue("Horario");
		excelHeader.createCell(37).setCellValue("Tipo_Orden");
		excelHeader.createCell(38).setCellValue("Tipo_Venta");
		excelHeader.createCell(39).setCellValue("O_Faclility_Alias_Id");
		excelHeader.createCell(40).setCellValue("Region_Entrega");
		excelHeader.createCell(41).setCellValue("Tipo_De_Orden");
		excelHeader.createCell(42).setCellValue("Guia");
		excelHeader.createCell(43).setCellValue("Rut_Emp");
		excelHeader.createCell(44).setCellValue("Desc_Emp");
		excelHeader.createCell(45).setCellValue("Tipo_Gui");
		excelHeader.createCell(46).setCellValue("Cliente_Retira");
		excelHeader.createCell(47).setCellValue("Fecha_Primer_Intento");
		excelHeader.createCell(48).setCellValue("Numero_Intentos");
		excelHeader.createCell(49).setCellValue("Fecha_CreaPkt");
		excelHeader.createCell(50).setCellValue("Hora_CreaPkt");
		excelHeader.createCell(51).setCellValue("Nro_Ola");
		excelHeader.createCell(52).setCellValue("Fecha_Inicio_Ola");
		excelHeader.createCell(53).setCellValue("Hora_Inicio_Ola");
		excelHeader.createCell(54).setCellValue("Fecha_Termino_Ola");
		excelHeader.createCell(55).setCellValue("Hora_Termino_Ola");
		excelHeader.createCell(56).setCellValue("Fecha_Cierre_Carga");
		excelHeader.createCell(57).setCellValue("Hora_Cierre_Carga");
		excelHeader.createCell(58).setCellValue("Fece_Migui");
		excelHeader.createCell(59).setCellValue("Lead_Time_Transpotre");
		excelHeader.createCell(60).setCellValue("Dia_Semana_Eta");
		excelHeader.createCell(61).setCellValue("Entrega_Dia_Compromiso");
		excelHeader.createCell(62).setCellValue("Venta_Empresa");
		excelHeader.createCell(63).setCellValue("Cumple");
		excelHeader.createCell(64).setCellValue("Cumplimiento_2");
		excelHeader.createCell(65).setCellValue("Cumple_Resumen");
		excelHeader.createCell(66).setCellValue("Bodega_Despacho");
		excelHeader.createCell(67).setCellValue("Dif_Eta_Carga");
		excelHeader.createCell(68).setCellValue("Fecha_Carga_Requerida");
		excelHeader.createCell(69).setCellValue("Eval_Sistem");
		excelHeader.createCell(70).setCellValue("Eval_Cd");
		excelHeader.createCell(71).setCellValue("Eval_1Er_Intento");
		excelHeader.createCell(72).setCellValue("Cumplimiento_Cliente");
		excelHeader.createCell(73).setCellValue("Responsable");
		excelHeader.createCell(74).setCellValue("Tipo_Cumplimiento");
		
	}

	private void setExcelRows(HSSFSheet excelSheet,
			List<Cumplimiento> cumplimientoList) {
		// TODO Auto-generated method stub
		int record = 1;
		for (Cumplimiento cumplimiento : cumplimientoList) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			
			excelRow.createCell(0).setCellValue(cumplimiento.getLlave());
			excelRow.createCell(1).setCellValue(cumplimiento.getTcPoLineId());
			excelRow.createCell(2).setCellValue(cumplimiento.getCumplimientoFormula());
			excelRow.createCell(3).setCellValue(cumplimiento.getCumplCalc());
			excelRow.createCell(4).setCellValue(cumplimiento.getCumplEom());
			excelRow.createCell(5).setCellValue(cumplimiento.getCumplBtk());
			//excelRow.createCell(5).setCellValue(DateUtils.DeStringADate(cumplimiento.getFechaCompromisoEom()));
			//excelRow.createCell(5).setCellValue(DateUtils.DeStringADate(cumplimiento.getFechaCompromisoEom()));
			excelRow.createCell(6).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCompromisoEom()))));
			excelRow.createCell(7).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCompromisoBtk()))));
			excelRow.createCell(8).setCellValue(cumplimiento.getEstadoCalceEom());
			excelRow.createCell(9).setCellValue(cumplimiento.getSubEstadoCalceEom());
			excelRow.createCell(10).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCalceEom()))));
			excelRow.createCell(11).setCellValue(cumplimiento.getHoraCalceEom());
			excelRow.createCell(12).setCellValue(cumplimiento.getEstadoCalceBtk());
			excelRow.createCell(13).setCellValue(cumplimiento.getSubEstadoCalceBtk());
			excelRow.createCell(14).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCalceBtk()))));
			excelRow.createCell(15).setCellValue(cumplimiento.getHoraCalceBtk());
			excelRow.createCell(16).setCellValue(cumplimiento.getCruceEstado());
			excelRow.createCell(17).setCellValue(cumplimiento.getCruceSubEstado());
			excelRow.createCell(18).setCellValue(cumplimiento.getnSolicitudCliente());
			excelRow.createCell(19).setCellValue(cumplimiento.getnOrdenDistribu());
			excelRow.createCell(20).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCreacionOrden()))));
			excelRow.createCell(21).setCellValue(cumplimiento.getEstOrden());
			excelRow.createCell(22).setCellValue(cumplimiento.getEstadoDeLinea());
			excelRow.createCell(23).setCellValue(cumplimiento.getSku());
			excelRow.createCell(24).setCellValue(cumplimiento.getCantDescSku());
			excelRow.createCell(25).setCellValue(cumplimiento.getLocalVenta());
			excelRow.createCell(26).setCellValue(cumplimiento.getDepart());
			excelRow.createCell(27).setCellValue(cumplimiento.getBodegaDesp());
			excelRow.createCell(28).setCellValue(cumplimiento.getRutCliente());
			excelRow.createCell(29).setCellValue(cumplimiento.getNombreCliente());
			excelRow.createCell(30).setCellValue(cumplimiento.getApellidoCliente());
			excelRow.createCell(31).setCellValue(cumplimiento.getDireccionCliente());
			excelRow.createCell(32).setCellValue(cumplimiento.getCodComuna());
			excelRow.createCell(33).setCellValue(cumplimiento.getComuna());
			excelRow.createCell(34).setCellValue(cumplimiento.getCiudad());
			excelRow.createCell(35).setCellValue(cumplimiento.getRegion());
			excelRow.createCell(36).setCellValue(cumplimiento.getHorario());
			excelRow.createCell(37).setCellValue(cumplimiento.getTipoOrden());
			excelRow.createCell(38).setCellValue(cumplimiento.getTipoVenta());
			excelRow.createCell(39).setCellValue(cumplimiento.getoFaclilityAliasId());
			excelRow.createCell(40).setCellValue(cumplimiento.getRegionEntrega());
			excelRow.createCell(41).setCellValue(cumplimiento.getTipoDeOrden());
			excelRow.createCell(42).setCellValue(cumplimiento.getGuia());
			excelRow.createCell(43).setCellValue(cumplimiento.getRutEmp());
			excelRow.createCell(44).setCellValue(cumplimiento.getDescEmp());
			excelRow.createCell(45).setCellValue(cumplimiento.getTipoGui());
			excelRow.createCell(46).setCellValue(cumplimiento.getClienteRetira());
			excelRow.createCell(47).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaPrimerIntento()))));
			excelRow.createCell(48).setCellValue(cumplimiento.getNumeroIntentos());
			excelRow.createCell(49).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCreaPkt()))));
			excelRow.createCell(50).setCellValue(cumplimiento.getHoraCreaPkt());
			excelRow.createCell(51).setCellValue(cumplimiento.getNroOla());
			excelRow.createCell(52).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaInicioOla()))));
			excelRow.createCell(53).setCellValue(cumplimiento.getHoraInicioOla());
			excelRow.createCell(54).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaTerminoOla()))));
			excelRow.createCell(55).setCellValue(cumplimiento.getHoraTerminoOla());
			excelRow.createCell(56).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFechaCierreCarga()))));
			excelRow.createCell(57).setCellValue(cumplimiento.getHoraCierreCarga());
			excelRow.createCell(58).setCellValue(DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate(cumplimiento.getFeceMigui()))));
			excelRow.createCell(59).setCellValue(cumplimiento.getLeadTimeTranspotre());
			excelRow.createCell(60).setCellValue( (Integer.parseInt(cumplimiento.getDiaSemanaEta()) - 1) );
			excelRow.createCell(61).setCellValue(cumplimiento.getEntregaDiaCompromiso());
			excelRow.createCell(62).setCellValue(cumplimiento.getVentaEmpresa());
			excelRow.createCell(63).setCellValue(cumplimiento.getCumple());
			excelRow.createCell(64).setCellValue(cumplimiento.getCumplimiento_2());
			excelRow.createCell(65).setCellValue(cumplimiento.getCumpleResumen());
			excelRow.createCell(66).setCellValue(cumplimiento.getBodegaDespacho());
			excelRow.createCell(67).setCellValue(cumplimiento.getDifEtaCarga());
			excelRow.createCell(68).setCellValue(cumplimiento.getFechaCargaRequerida());
			excelRow.createCell(69).setCellValue(cumplimiento.getEvalSistem());
			excelRow.createCell(70).setCellValue(cumplimiento.getEvalCd());
			excelRow.createCell(71).setCellValue(cumplimiento.getEval1ErIntento());
			excelRow.createCell(72).setCellValue(cumplimiento.getCumplimientoCliente());
			excelRow.createCell(73).setCellValue(cumplimiento.getResponsable());
			excelRow.createCell(74).setCellValue(cumplimiento.getTipoCumplimiento());
			
		}
		
		
		
	}

}
