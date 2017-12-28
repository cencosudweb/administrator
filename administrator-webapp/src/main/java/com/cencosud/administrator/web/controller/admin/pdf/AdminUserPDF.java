/**
 * 
 */
package com.cencosud.administrator.web.controller.admin.pdf;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import java.util.List;
//import java.util.Map;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.cencosud.administrator.dao.domain.SystemLog;


/**
 * @author JOSE
 *
 */

@Component
public class AdminUserPDF extends AbstractITextPdfView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<SystemLog> logList = (List<SystemLog>) model.get("logList");
		
		doc.add(new Paragraph("Listado de Logs"));
		
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] {1.0f, 1.0f, 1.0f, 1.0f, 1.0f});
		table.setSpacingBefore(1);
		
		//definir la fuente para la fila de encabezado de tabla
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setColor(BaseColor.WHITE);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell.setPadding(1);
		
		// write table header 
		cell.setPhrase(new Phrase("ID", font));
		table.addCell(cell);
			
		cell.setPhrase(new Phrase("Action", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Description", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Ip", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Fecha", font));
		table.addCell(cell);
		
		// write table row data
		for (SystemLog log : logList) {
			table.addCell(String.valueOf(log.getId()));
			table.addCell(log.getAction());
			table.addCell(log.getDescription());
			table.addCell(String.valueOf(log.getIpaddress()));
			table.addCell(String.valueOf(log.getCreationdate()));
		}
		doc.add(table);
	}

}
