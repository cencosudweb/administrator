
/**
 *@name ChannelServicesImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 *
 */
package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CumplimientoServices;
import com.cencosud.administrator.dao.CumplimientoDao;
import com.cencosud.administrator.dao.domain.Cumplimiento;
import com.cencosud.administrator.dto.users.CumplimientoDTO;

/**
 * @description 
 */
@Repository
public class CumplimientoServicesImpl extends BaseServicesImpl implements CumplimientoServices{

	@Autowired
	private CumplimientoDao cumplimientoDaoImpl;
	
	private static Logger log = Logger.getLogger(CumplimientoServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CumplimientoDTO> getCumplimientos(String fechaIni, String fechaTer) {
		List<CumplimientoDTO> result = new ArrayList<CumplimientoDTO>();
		
		List<Cumplimiento> cumplimientos;
		try {
			
			cumplimientos = cumplimientoDaoImpl.getCumplimientos(fechaIni, fechaTer);
			if(cumplimientos != null && !cumplimientos.isEmpty()){
				result = (List<CumplimientoDTO>) mapper.map(cumplimientos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
	
}
