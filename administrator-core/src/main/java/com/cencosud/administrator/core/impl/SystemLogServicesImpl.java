/**
 *@name SystemLogServicesImpl.java
 * 
 *@version 1.0 
 * 
 *@date 04-05-2017
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

import com.cencosud.administrator.core.SystemLogServices;
import com.cencosud.administrator.dao.SystemLogDao;
import com.cencosud.administrator.dao.domain.SystemLog;
import com.cencosud.administrator.dto.users.SystemLogDTO;

/**
 * @description 
 */

@Repository
public class SystemLogServicesImpl extends BaseServicesImpl implements SystemLogServices {
	
	@Autowired
	private SystemLogDao systemLogDaoImpl;
	
	private static Logger log = Logger.getLogger(SystemLogServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<SystemLogDTO> getSystemLog(int iduser, String description, int start, int limit) {
		// TODO Auto-generated method stub
		List<SystemLogDTO> result = new ArrayList<SystemLogDTO>();

		List<SystemLog> systemLogs;
		try {

			//systemLogs = systemLogDaoImpl.getSystemLog(iduser, start,  limit);
			systemLogs = systemLogDaoImpl.getSystemLog(iduser, description, start,  limit);
			result = (List<SystemLogDTO>) mapper.map(systemLogs, List.class);

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public SystemLogDTO getSystemLogId(Long systemLogId) {
		// TODO Auto-generated method stub
		SystemLogDTO systemLogDestination = null;
		try {
			SystemLog systemLogSource = systemLogDaoImpl.getSystemLogId(systemLogId);
			systemLogDestination = mapper.map(systemLogSource, SystemLogDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return systemLogDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public void addSystemLog(int iduser, int loglevel, String action,
			String description, String data, String tablename, String pagename,
			String ipaddress, String creationdate) {
		// TODO Auto-generated method stub
		try {
			//systemLogDaoImpl.addSystemLog(iduser, loglevel, action, description, data, tablename, pagename, ipaddress);
			systemLogDaoImpl.addSystemLog(iduser, loglevel, action, description, data, tablename, pagename, ipaddress, creationdate );
			//commerceDaoImpl.addCommerce(commerceDestination);
			
			//result.setResult(OperationResult.SUCCESS);
			//result.setMessage("Comercio registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			//result.setExcepcion(e);
			//result.setResult(OperationResult.ERROR);
			//result.setMessage("Error al registrar producto");
		}
		
	}

	@Override
	@Transactional
	public Long getCounts(int idUser, String description) {
		// TODO Auto-generated method stub
		Long result;
		
		try {
			
			//result = systemLogDaoImpl.getCounts(iduser);
			result = systemLogDaoImpl.getCounts(idUser, description);
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (long) 0;
		}
		
		return result;
	}

	

}
