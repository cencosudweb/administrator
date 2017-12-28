/**
 *@name ChannelDaoImpl.java
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

import com.cencosud.administrator.core.CuadraturaVentaVerdeServices;
import com.cencosud.administrator.dao.CuadraturaVentaVerdeDao;
import com.cencosud.administrator.dao.domain.CuadraturaVentaVerde;
import com.cencosud.administrator.dto.users.CuadraturaVentaVerdeDTO;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CuadraturaVentaVerdeServicesImpl extends BaseServicesImpl implements CuadraturaVentaVerdeServices {

	@Autowired
	private CuadraturaVentaVerdeDao cuadraturaVentaVerdeDaoImpl;

	private static Logger log = Logger.getLogger(CuadraturaVentaVerdeServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CuadraturaVentaVerdeDTO> getCuadraturaVentaVerde(String fechaIni, String fechaTer,
			String estadoRelacion, int start, int limit) {
		// TODO Auto-generated method stub
		List<CuadraturaVentaVerdeDTO> result = new ArrayList<CuadraturaVentaVerdeDTO>();

		List<CuadraturaVentaVerde> cuadraturaVentaVerdes;
		try {

			cuadraturaVentaVerdes = cuadraturaVentaVerdeDaoImpl.getCuadraturaVentaVerde(fechaIni, fechaTer, estadoRelacion, start, limit);
			if (cuadraturaVentaVerdes != null && !cuadraturaVentaVerdes.isEmpty()) {
				result = (List<CuadraturaVentaVerdeDTO>) mapper.map(cuadraturaVentaVerdes, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public int getCuadraturaVentaVerdeContar(String fechaIni, String fechaTer, String estadoRelacion) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaVentaVerdeDaoImpl.getCuadraturaVentaVerdeContar(fechaIni, fechaTer, estadoRelacion);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getCuadraturaVentaVerdePaginador(String fechaIni, String fechaTer, String estadoRelacion) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaVentaVerdeDaoImpl.getCuadraturaVentaVerdePaginador(fechaIni, fechaTer, estadoRelacion);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}


}
