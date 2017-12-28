
/**
 *@name BodegaCtlServicesImpl.java
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

import com.cencosud.administrator.core.BodegaCtlServices;
import com.cencosud.administrator.dao.BodegaCtlDao;
import com.cencosud.administrator.dao.domain.BodegaCtl;
import com.cencosud.administrator.dto.users.BodegaCtlDTO;
/**
 * @description 
 */
@Repository
public class BodegaCtlServicesImpl extends BaseServicesImpl implements BodegaCtlServices{

	@Autowired
	private BodegaCtlDao bodegaCtlDaoImpl;
	
	private static Logger log = Logger.getLogger(BodegaCtlServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<BodegaCtlDTO> getBodegaCtls() {
		List<BodegaCtlDTO> result = new ArrayList<BodegaCtlDTO>();
		
		List<BodegaCtl> bodegas;
		try {
			
			bodegas = bodegaCtlDaoImpl.getBodegaCtls();
			if(bodegas != null && !bodegas.isEmpty()){
				result = (List<BodegaCtlDTO>) mapper.map(bodegas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
