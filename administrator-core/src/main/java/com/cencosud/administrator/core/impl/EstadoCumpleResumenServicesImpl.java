package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.dao.EstadoCumpleResumenDao;
import com.cencosud.administrator.dao.domain.EstadoCumpleResumen;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class EstadoCumpleResumenServicesImpl extends BaseServicesImpl implements EstadoCumpleResumenServices{

	@Autowired
	private EstadoCumpleResumenDao estadoCumpleResumenDaoImpl;
	
	private static Logger log = Logger.getLogger(EstadoCumpleResumenServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EstadoCumpleResumenDTO> getEstadoCumpleResumens() {
		// TODO Auto-generated method stub
		List<EstadoCumpleResumenDTO> result = new ArrayList<EstadoCumpleResumenDTO>();
		
		List<EstadoCumpleResumen> estados;
		try {
			
			estados = estadoCumpleResumenDaoImpl.getEstadoCumpleResumens();
			if(estados != null && !estados.isEmpty()){
				result = (List<EstadoCumpleResumenDTO>) mapper.map(estados, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}


	
	
	
}
