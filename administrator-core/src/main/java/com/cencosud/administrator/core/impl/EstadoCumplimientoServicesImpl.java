package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.dao.EstadoCumplimientoDao;
import com.cencosud.administrator.dao.domain.EstadoCumplimiento;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class EstadoCumplimientoServicesImpl extends BaseServicesImpl implements EstadoCumplimientoServices{

	@Autowired
	private EstadoCumplimientoDao estadoCumplimientoDaoImpl;
	
	private static Logger log = Logger.getLogger(EstadoCumplimientoServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EstadoCumplimientoDTO> getEstadoCumplimientos() {
		// TODO Auto-generated method stub
		List<EstadoCumplimientoDTO> result = new ArrayList<EstadoCumplimientoDTO>();
		
		List<EstadoCumplimiento> estados;
		try {
			
			estados = estadoCumplimientoDaoImpl.getEstadoCumplimientos();
			if(estados != null && !estados.isEmpty()){
				result = (List<EstadoCumplimientoDTO>) mapper.map(estados, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}
	
	

	
	
	
}
