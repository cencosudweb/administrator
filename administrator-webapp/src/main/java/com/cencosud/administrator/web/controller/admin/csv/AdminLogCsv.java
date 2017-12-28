/**
 * 
 */
package com.cencosud.administrator.web.controller.admin.csv;

import java.io.IOException;
import java.util.List;
import java.util.Map;
 


import org.supercsv.io.ICsvBeanWriter;

import com.cencosud.administrator.dao.domain.SystemLog;

/**
 * @author JOSE
 *
 */
public class AdminLogCsv extends AbstractCsvView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildCsvDocument(ICsvBeanWriter csvWriter,
			Map<String, Object> model) throws IOException {
		// TODO Auto-generated method stub
		List<SystemLog> logList = (List<SystemLog>) model.get("csvData");
        String[] header = (String[]) model.get("csvHeader");
 
        csvWriter.writeHeader(header);
 
        for (SystemLog log : logList) {
            csvWriter.write(log, header);
        }
	}

}
