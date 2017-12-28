
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

import com.cencosud.administrator.core.SkuServicioServices;
import com.cencosud.administrator.dao.SkuServicioWsDao;
import com.cencosud.administrator.dao.domain.SkuServicioWs;
import com.cencosud.administrator.dto.users.SkuServicioWsDTO;

/**
 * @description 
 */
@Repository
public class SkuServicioServicesImpl extends BaseServicesImpl implements SkuServicioServices{

	@Autowired
	private SkuServicioWsDao skuServicioDaoImpl;
	
	private static Logger log = Logger.getLogger(SkuServicioServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<SkuServicioWsDTO> getSkuServicioWs() {
		List<SkuServicioWsDTO> result = new ArrayList<SkuServicioWsDTO>();
		
		List<SkuServicioWs> skus;
		try {
			
			skus = skuServicioDaoImpl.getSkuServicioWs();
			if(skus != null && !skus.isEmpty()){
				result = (List<SkuServicioWsDTO>) mapper.map(skus, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
