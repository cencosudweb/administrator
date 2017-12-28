package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.dao.ClienteRetiraDao;
import com.cencosud.administrator.dao.domain.ClienteRetira;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class ClienteRetiraServicesImpl extends BaseServicesImpl implements ClienteRetiraServices{

	@Autowired
	private ClienteRetiraDao clienteRetiraDaoImpl;
	
	private static Logger log = Logger.getLogger(ClienteRetiraServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ClienteRetiraDTO> getClienteRetiras() {
		List<ClienteRetiraDTO> result = new ArrayList<ClienteRetiraDTO>();
		
		List<ClienteRetira> clienteRetiras;
		try {
			
			clienteRetiras = clienteRetiraDaoImpl.getClienteRetiras();
			if(clienteRetiras != null && !clienteRetiras.isEmpty()){
				result = (List<ClienteRetiraDTO>) mapper.map(clienteRetiras, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
