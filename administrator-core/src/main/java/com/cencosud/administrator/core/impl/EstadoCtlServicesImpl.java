
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

import com.cencosud.administrator.core.EstadoCtlServices;
import com.cencosud.administrator.dao.EstadoCtlDao;
import com.cencosud.administrator.dao.domain.EstadoCtl;
import com.cencosud.administrator.dto.users.EstadoCtlDTO;
/**
 * @description 
 */
@Repository
public class EstadoCtlServicesImpl extends BaseServicesImpl implements EstadoCtlServices{

	@Autowired
	private EstadoCtlDao estadoCtlDaoImpl;
	
	private static Logger log = Logger.getLogger(EstadoCtlServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EstadoCtlDTO> getEstadoCtls() {
		List<EstadoCtlDTO> result = new ArrayList<EstadoCtlDTO>();
		
		List<EstadoCtl> estados;
		try {
			
			estados = estadoCtlDaoImpl.getEstadoCtls();
			if(estados != null && !estados.isEmpty()){
				result = (List<EstadoCtlDTO>) mapper.map(estados, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
