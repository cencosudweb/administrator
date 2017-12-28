
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

import com.cencosud.administrator.core.HorarioActualizacionStockServices;
import com.cencosud.administrator.dao.HorarioActualizacionStockDao;
import com.cencosud.administrator.dao.domain.HorarioActualizacionStock;
import com.cencosud.administrator.dto.users.HorarioActualizacionStockDTO;
/**
 * @description 
 */
@Repository
public class HorarioActualizacionStockServicesImpl extends BaseServicesImpl implements HorarioActualizacionStockServices{

	@Autowired
	private HorarioActualizacionStockDao horarioActualizacionStockDaoImpl;
	
	private static Logger log = Logger.getLogger(HorarioActualizacionStockServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<HorarioActualizacionStockDTO> getHorarioActualizacionStocks(int start, int limit) {
		List<HorarioActualizacionStockDTO> result = new ArrayList<HorarioActualizacionStockDTO>();
		
		List<HorarioActualizacionStock> horarios;
		try {
			
			horarios = horarioActualizacionStockDaoImpl.getHorarioActualizacionStocks(start, limit);
			if(horarios != null && !horarios.isEmpty()){
				result = (List<HorarioActualizacionStockDTO>) mapper.map(horarios, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	

	
}
