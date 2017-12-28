
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

import com.cencosud.administrator.core.CuadraturaDoServices;
import com.cencosud.administrator.dao.CuadraturaDoDao;
import com.cencosud.administrator.dao.domain.CuadraturaDo;
import com.cencosud.administrator.dto.users.CuadraturaDoDTO;
/**
 * @description 
 */
@Repository
public class CuadraturaDoServicesImpl extends BaseServicesImpl implements CuadraturaDoServices{

	@Autowired
	private CuadraturaDoDao cuadraturaDoDaoImpl;
	
	private static Logger log = Logger.getLogger(CuadraturaDoServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CuadraturaDoDTO> getCuadraturaDos(String fechaIni, String fechaTer, int estado, int start, int limit) {
		// TODO Auto-generated method stub
		List<CuadraturaDoDTO> result = new ArrayList<CuadraturaDoDTO>();
		
		List<CuadraturaDo> cuadraturaDos;
		try {
			
			cuadraturaDos = cuadraturaDoDaoImpl.getCuadraturaDos(fechaIni, fechaTer, estado, start, limit);
			if(cuadraturaDos != null && !cuadraturaDos.isEmpty()){
				result = (List<CuadraturaDoDTO>) mapper.map(cuadraturaDos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public int getCuadraturaDoContar(String fechaIni, String fechaTer, int estado) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaDoDaoImpl.getCuadraturaDoContar(fechaIni, fechaTer, estado);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	
	
	
	
	
	
	
}
