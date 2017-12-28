
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

import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
import com.cencosud.administrator.dao.TipoEstadoVentaEnVerdeDao;
import com.cencosud.administrator.dao.domain.TipoEstadoVentaEnVerde;
import com.cencosud.administrator.dto.users.TipoEstadoVentaEnVerdeDTO;
/**
 * @description 
 */
@Repository
public class TipoEstadoVentaEnVerdeServicesImpl extends BaseServicesImpl implements TipoEstadoVentaEnVerdeServices{

	@Autowired
	private TipoEstadoVentaEnVerdeDao tipoEstadoVentaEnVerdeDaoImpl;
	
	private static Logger log = Logger.getLogger(TipoEstadoVentaEnVerdeServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoEstadoVentaEnVerdeDTO> getTipoEstadoVentaEnVerdes() {
		List<TipoEstadoVentaEnVerdeDTO> result = new ArrayList<TipoEstadoVentaEnVerdeDTO>();
		
		List<TipoEstadoVentaEnVerde> tipoestadovtavs;
		try {
			
			tipoestadovtavs = tipoEstadoVentaEnVerdeDaoImpl.getTipoEstadoVentaEnVerdes();
			if(tipoestadovtavs != null && !tipoestadovtavs.isEmpty()){
				result = (List<TipoEstadoVentaEnVerdeDTO>) mapper.map(tipoestadovtavs, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
