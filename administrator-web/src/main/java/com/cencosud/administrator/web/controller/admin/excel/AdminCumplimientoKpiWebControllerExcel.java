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

import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;
//import com.cencosud.administrator.dto.users.SystemLogDTO;

/**
 * @author JOSE
 *
 */

@Component
public class AdminCumplimientoKpiWebControllerExcel extends AbstractExcelView {
	
	//private static final SystemLogDTO SystemLogDTO = null;
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HSSFSheet excelSheet = workbook.createSheet("CumplimientokpiWeb List");
		setExcelHeader(excelSheet);
		
		List<CumplimientokpiWeb> cumplimientokpiWebList = (List<CumplimientokpiWeb>) model.get("cumplimientokpiWebList");
		setExcelRows(excelSheet, cumplimientokpiWebList);
		
	}

	private void setExcelHeader(HSSFSheet excelSheet) {
		// TODO Auto-generated method stub
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Id");
		excelHeader.createCell(1).setCellValue("Fecha");
		excelHeader.createCell(2).setCellValue("Cumple");
		excelHeader.createCell(3).setCellValue("Cumple Resumen");
		excelHeader.createCell(4).setCellValue("Cumplimiento");
		excelHeader.createCell(5).setCellValue("Responsable");
		excelHeader.createCell(6).setCellValue("Canal");
		excelHeader.createCell(7).setCellValue("Tipo Despacho");
		excelHeader.createCell(8).setCellValue("Tipo Guia");
		excelHeader.createCell(9).setCellValue("Empresa Transporte");
	}

	private void setExcelRows(HSSFSheet excelSheet,
			List<CumplimientokpiWeb> cumplimientokpiWebList) {
		// TODO Auto-generated method stub
		int record = 1;
		for (CumplimientokpiWeb cumplimientokpiWeb : cumplimientokpiWebList) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(cumplimientokpiWeb.getId());
			excelRow.createCell(1).setCellValue(cumplimientokpiWeb.getFecha());
			excelRow.createCell(2).setCellValue(cumplimientokpiWeb.getCumple().getDescription());
			excelRow.createCell(3).setCellValue(cumplimientokpiWeb.getResumen().getDescription());
			excelRow.createCell(4).setCellValue(cumplimientokpiWeb.getCumplimiento().getDescription());
			excelRow.createCell(5).setCellValue(cumplimientokpiWeb.getResponsable().getDescription());
			excelRow.createCell(6).setCellValue(cumplimientokpiWeb.getOrden().getDescription());
			excelRow.createCell(7).setCellValue(cumplimientokpiWeb.getVenta().getDescription());
			excelRow.createCell(8).setCellValue(cumplimientokpiWeb.getGuia().getDescription());
			excelRow.createCell(9).setCellValue(cumplimientokpiWeb.getDescripcionEmpresa().getDescription());

		}
		
	}

}
