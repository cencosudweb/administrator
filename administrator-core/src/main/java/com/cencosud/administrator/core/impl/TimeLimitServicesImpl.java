
/**
 *@name TimeLimitServicesImpl.java
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

import com.cencosud.administrator.core.TimeLimitServices;
import com.cencosud.administrator.dao.TimeLimitDao;
import com.cencosud.administrator.dao.domain.TimeLimit;
import com.cencosud.administrator.dto.users.TimeLimitDTO;
/**
 * @description 
 */
@Repository
public class TimeLimitServicesImpl extends BaseServicesImpl implements TimeLimitServices{

	@Autowired
	private TimeLimitDao timeLimitDaoImpl;
	
	private static Logger log = Logger.getLogger(RoleServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TimeLimitDTO> getTimesLimit() {
		List<TimeLimitDTO> result = new ArrayList<TimeLimitDTO>();
		
		List<TimeLimit> timesLimit;
		try {
			
			timesLimit = timeLimitDaoImpl.getTimesLimit();
			if(timesLimit != null && !timesLimit.isEmpty()){
				result = (List<TimeLimitDTO>) mapper.map(timesLimit, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}
}
