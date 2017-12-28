
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

import com.cencosud.administrator.core.TipoEstadoOrdenCompraStockServices;
import com.cencosud.administrator.dao.TipoEstadoOrdenCompraStockDao;
import com.cencosud.administrator.dao.domain.TipoEstadoOrdenCompraStock;
import com.cencosud.administrator.dto.users.TipoEstadoOrdenCompraStockDTO;
/**
 * @description 
 */
@Repository
public class TipoEstadoOrdenCompraStockServicesImpl extends BaseServicesImpl implements TipoEstadoOrdenCompraStockServices{

	@Autowired
	private TipoEstadoOrdenCompraStockDao tipoEstadoOrdenCompraStockDaoImpl;
	
	private static Logger log = Logger.getLogger(TipoEstadoOrdenCompraStockServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoEstadoOrdenCompraStockDTO> getTipoEstadoOrdenCompraStocks() {
		List<TipoEstadoOrdenCompraStockDTO> result = new ArrayList<TipoEstadoOrdenCompraStockDTO>();
		
		List<TipoEstadoOrdenCompraStock> tipoestadostocks;
		try {
			
			tipoestadostocks = tipoEstadoOrdenCompraStockDaoImpl.getTipoEstadoOrdenCompraStocks();
			if(tipoestadostocks != null && !tipoestadostocks.isEmpty()){
				result = (List<TipoEstadoOrdenCompraStockDTO>) mapper.map(tipoestadostocks, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
