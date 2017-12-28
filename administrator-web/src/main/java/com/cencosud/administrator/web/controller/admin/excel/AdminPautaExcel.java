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

import com.cencosud.administrator.dao.domain.Pauta;

/**
 * @author JOSE
 *
 */

@Component
public class AdminPautaExcel extends AbstractExcelView {
	
	//private static final SystemLogDTO SystemLogDTO = null;
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HSSFSheet excelSheet = workbook.createSheet("Pauta List");
		setExcelHeader(excelSheet);
		
		List<Pauta> pautaList = (List<Pauta>) model.get("pautaList");
		setExcelRows(excelSheet, pautaList);
		
	}

	private void setExcelHeader(HSSFSheet excelSheet) {
		// TODO Auto-generated method stub
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Prioridad");
		excelHeader.createCell(1).setCellValue("Descripcion");
		excelHeader.createCell(2).setCellValue("Reportado");
		excelHeader.createCell(3).setCellValue("Area");
		excelHeader.createCell(4).setCellValue("Estado");
		excelHeader.createCell(5).setCellValue("Tienda");
		excelHeader.createCell(6).setCellValue("Fecha Visita");
	}

	private void setExcelRows(HSSFSheet excelSheet,
			List<Pauta> pautaList) {
		// TODO Auto-generated method stub
		int record = 1;
		for (Pauta pauta : pautaList) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(pauta.getPrioridad().getDescription());
			excelRow.createCell(1).setCellValue(pauta.getDescripcionIssue());
			excelRow.createCell(2).setCellValue(pauta.getPadrino().getDescription());
			excelRow.createCell(3).setCellValue(pauta.getArea().getDescription());
			excelRow.createCell(4).setCellValue(pauta.getEstado().getDescription());
			excelRow.createCell(5).setCellValue(pauta.getTienda().getDescription());
			excelRow.createCell(6).setCellValue(pauta.getFechaVisita());
			
		}
		
	}

}
