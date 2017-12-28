package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.EstadoResponsableServices;
import com.cencosud.administrator.dao.EstadoResponsableDao;
import com.cencosud.administrator.dao.domain.EstadoResponsable;
import com.cencosud.administrator.dto.users.EstadoResponsableDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class EstadoResponsableServicesImpl extends BaseServicesImpl implements EstadoResponsableServices{

	@Autowired
	private EstadoResponsableDao estadoResponsableDaoImpl;
	
	private static Logger log = Logger.getLogger(EstadoResponsableServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EstadoResponsableDTO> getEstadoResponsables() {
		// TODO Auto-generated method stub
		List<EstadoResponsableDTO> result = new ArrayList<EstadoResponsableDTO>();
		
		List<EstadoResponsable> estados;
		try {
			
			estados = estadoResponsableDaoImpl.getEstadoResponsables();
			if(estados != null && !estados.isEmpty()){
				result = (List<EstadoResponsableDTO>) mapper.map(estados, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}
	
	

	
	
	
}
