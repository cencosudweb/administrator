/**
 * 
 */
package com.cencosud.administrator.web.controller.admin.csv;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.supercsv.io.ICsvBeanWriter;

import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;

/**
 * @author JOSE
 *
 */
public class AdminCumplimientoKpiWebControllerCsv extends AbstractCsvView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildCsvDocument(ICsvBeanWriter csvWriter,
			Map<String, Object> model) throws IOException {
		// TODO Auto-generated method stub
		List<CumplimientokpiWeb> logList = (List<CumplimientokpiWeb>) model.get("csvData");
        String[] header = (String[]) model.get("csvHeader");
 
        csvWriter.writeHeader(header);
 
        for (CumplimientokpiWeb log : logList) {
            csvWriter.write(log, header);
        }
	}

}
