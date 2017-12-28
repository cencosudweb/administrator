
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

import com.cencosud.administrator.core.CuadraturaCtlServices;
import com.cencosud.administrator.dao.CuadraturaCtlDao;
import com.cencosud.administrator.dao.domain.CuadraturaCtl;
import com.cencosud.administrator.dto.users.CuadraturaCtlDTO;
/**
 * @description 
 */
@Repository
public class CuadraturaCtlServicesImpl extends BaseServicesImpl implements CuadraturaCtlServices{

	@Autowired
	private CuadraturaCtlDao cuadraturaCtlDaoImpl;
	
	private static Logger log = Logger.getLogger(CuadraturaCtlServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CuadraturaCtlDTO> getCuadraturaCtls(int carga, String bogeda, int statCode, String fechaIni, String fechaTer,
			String tipo, int tranNbr, int estado, int start, int limit) {
		// TODO Auto-generated method stub
		List<CuadraturaCtlDTO> result = new ArrayList<CuadraturaCtlDTO>();
		
		List<CuadraturaCtl> cuadraturaCtls;
		try {
			
			cuadraturaCtls = cuadraturaCtlDaoImpl.getCuadraturaCtls(carga, bogeda, statCode, fechaIni, fechaTer, tipo, tranNbr, estado, start, limit);
			if(cuadraturaCtls != null && !cuadraturaCtls.isEmpty()){
				result = (List<CuadraturaCtlDTO>) mapper.map(cuadraturaCtls, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public int getCuadraturaCtlContar(int carga, String bogeda, int staCode, String fechaIni, String fechaTer, String tipo, int tranNbr,
			int estado) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaCtlDaoImpl.getCuadraturaCtlContar(carga, bogeda, staCode, fechaIni, fechaTer, tipo, tranNbr, estado);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	
	
	
	
	
}
