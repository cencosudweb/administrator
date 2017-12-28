
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

import com.cencosud.administrator.core.FlagServices;
import com.cencosud.administrator.dao.FlagDao;
import com.cencosud.administrator.dao.domain.Flag;
import com.cencosud.administrator.dto.users.FlagDTO;
/**
 * @description 
 */
@Repository
public class FlagServicesImpl extends BaseServicesImpl implements FlagServices{

	@Autowired
	private FlagDao flagDaoImpl;
	
	private static Logger log = Logger.getLogger(FlagServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<FlagDTO> getFlags() {
		List<FlagDTO> result = new ArrayList<FlagDTO>();
		
		List<Flag> flags;
		try {
			
			flags = flagDaoImpl.getFlags();
			if(flags != null && !flags.isEmpty()){
				result = (List<FlagDTO>) mapper.map(flags, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
