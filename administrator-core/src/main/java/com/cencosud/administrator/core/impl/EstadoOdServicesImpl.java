
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

import com.cencosud.administrator.core.EstadoOdServices;
import com.cencosud.administrator.dao.EstadoOdDao;
import com.cencosud.administrator.dao.domain.EstadoOd;
import com.cencosud.administrator.dto.users.EstadoOdDTO;
/**
 * @description 
 */
@Repository
public class EstadoOdServicesImpl extends BaseServicesImpl implements EstadoOdServices{

	@Autowired
	private EstadoOdDao estadoOdDaoImpl;
	
	private static Logger log = Logger.getLogger(EstadoOdServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EstadoOdDTO> getEstadoOds() {
		List<EstadoOdDTO> result = new ArrayList<EstadoOdDTO>();
		
		List<EstadoOd> estadoOds;
		try {
			
			estadoOds = estadoOdDaoImpl.getEstadoOds();
			if(estadoOds != null && !estadoOds.isEmpty()){
				result = (List<EstadoOdDTO>) mapper.map(estadoOds, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
