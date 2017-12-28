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

import com.cencosud.administrator.dao.domain.SystemLog;
//import com.cencosud.administrator.dto.users.SystemLogDTO;

/**
 * @author JOSE
 *
 */

@Component
public class AdminLogExcel extends AbstractExcelView {
	
	//private static final SystemLogDTO SystemLogDTO = null;
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HSSFSheet excelSheet = workbook.createSheet("Log List");
		setExcelHeader(excelSheet);
		
		List<SystemLog> systemLogList = (List<SystemLog>) model.get("systemLogList");
		setExcelRows(excelSheet, systemLogList);
		
	}

	private void setExcelHeader(HSSFSheet excelSheet) {
		// TODO Auto-generated method stub
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Id");
		excelHeader.createCell(1).setCellValue("Creationdate");
		excelHeader.createCell(2).setCellValue("Iduser");
		excelHeader.createCell(3).setCellValue("Action");
		excelHeader.createCell(4).setCellValue("Ipaddress");
	}

	private void setExcelRows(HSSFSheet excelSheet,
			List<SystemLog> systemLogList) {
		// TODO Auto-generated method stub
		int record = 1;
		for (SystemLog systemLog : systemLogList) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(systemLog.getId());
			excelRow.createCell(1).setCellValue(systemLog.getCreationdate());
			excelRow.createCell(2).setCellValue(systemLog.getIduser());
			excelRow.createCell(3).setCellValue(systemLog.getAction());
			excelRow.createCell(4).setCellValue(systemLog.getIpaddress());
			
		}
		
	}

}
