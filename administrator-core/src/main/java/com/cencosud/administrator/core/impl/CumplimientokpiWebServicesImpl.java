
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
 */
package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CumplimientokpiWebServices;
import com.cencosud.administrator.dao.CumplimientoKpiWebDao;
import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;
import com.cencosud.administrator.dto.users.CumplimientokpiWebDTO;
/**
 * @description 
 */
@Repository
public class CumplimientokpiWebServicesImpl extends BaseServicesImpl implements CumplimientokpiWebServices{

	@Autowired
	private CumplimientoKpiWebDao cumplimientokpiWebDaoImpl;
	
	private static Logger log = Logger.getLogger(CumplimientokpiWebServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CumplimientokpiWebDTO> getCumplimientokpiWebs(String fechaIni, String fechaTer) {
		List<CumplimientokpiWebDTO> result = new ArrayList<CumplimientokpiWebDTO>();
		
		List<CumplimientokpiWeb> cumplimientokpiWebs;
		try {
			
			cumplimientokpiWebs = cumplimientokpiWebDaoImpl.getCumplimientoKpiWebs(fechaIni, fechaTer);
			if(cumplimientokpiWebs != null && !cumplimientokpiWebs.isEmpty()){
				result = (List<CumplimientokpiWebDTO>) mapper.map(cumplimientokpiWebs, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public int getCumplimientokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String empresa) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cumplimientokpiWebDaoImpl.getCumplimientokpiWebCounts(fechaIni,fechaTer, canal, despacho, guia, empresa);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getCumpleokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia,
			String cumple, String prefixclause) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cumplimientokpiWebDaoImpl.getCumpleokpiWebCounts(fechaIni, fechaTer, canal, despacho, guia, cumple, prefixclause);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getTotalkpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia,
			String cumple, String prefixclause) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cumplimientokpiWebDaoImpl.getTotalkpiWebCounts(fechaIni, fechaTer, canal, despacho, guia, cumple, prefixclause);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	
}
