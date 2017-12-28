
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

import com.cencosud.administrator.core.CuadraturaVtavPdServices;
import com.cencosud.administrator.dao.CuadraturaVtavPdDao;
import com.cencosud.administrator.dao.domain.CuadraturaVtavPd;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;

/**
 * @description 
 */
@Repository
public class CuadraturaVtavPdServicesImpl extends BaseServicesImpl implements CuadraturaVtavPdServices{

	@Autowired
	private CuadraturaVtavPdDao cuadraturaVtavPdDaoImpl;
	
	private static Logger log = Logger.getLogger(CuadraturaVtavPdServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CuadraturaVtavPdDTO> getCuadraturaVtavConPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario) {
		List<CuadraturaVtavPdDTO> result = new ArrayList<CuadraturaVtavPdDTO>();
		
		List<CuadraturaVtavPd> cuadraturaVtavPds;
		try {
			
			cuadraturaVtavPds = cuadraturaVtavPdDaoImpl.getCuadraturaVtavConPds(fechaIni, fechaTer, tipo_venta, tipoNumeroDistribuicion, horario);
			if(cuadraturaVtavPds != null && !cuadraturaVtavPds.isEmpty()){
				result = (List<CuadraturaVtavPdDTO>) mapper.map(cuadraturaVtavPds, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CuadraturaVtavPdDTO> getCuadraturaVtavSinPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario) {
		List<CuadraturaVtavPdDTO> result = new ArrayList<CuadraturaVtavPdDTO>();
		
		List<CuadraturaVtavPd> cuadraturaVtavPds;
		try {
			
			cuadraturaVtavPds = cuadraturaVtavPdDaoImpl.getCuadraturaVtavSinPds(fechaIni, fechaTer, tipo_venta, tipoNumeroDistribuicion, horario);
			if(cuadraturaVtavPds != null && !cuadraturaVtavPds.isEmpty()){
				result = (List<CuadraturaVtavPdDTO>) mapper.map(cuadraturaVtavPds, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}


	@Override
	@Transactional
	public int getCountConOd(String fechaIni, String fechaTer, int tipo_venta, int tipo_numero_distribuicion,
			int horario) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaVtavPdDaoImpl.getCountConOd(fechaIni, fechaTer, tipo_venta, tipo_numero_distribuicion, horario);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}
	
	@Override
	@Transactional
	public int getCountSinOd(String fechaIni, String fechaTer, int tipo_venta, int tipo_numero_distribuicion,
			int horario) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = cuadraturaVtavPdDaoImpl.getCountSinOd(fechaIni, fechaTer, tipo_venta, tipo_numero_distribuicion, horario);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	
	
}
