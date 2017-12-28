
/**
 *@name RoleServicesImpl.java
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

import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dao.RoleDao;
import com.cencosud.administrator.dao.domain.Role;
import com.cencosud.administrator.dto.users.RoleDTO;
/**
 * @description 
 */
@Repository
public class RoleServicesImpl extends BaseServicesImpl implements RoleServices{

	@Autowired
	private RoleDao roleDaoImpl;
	
	private static Logger log = Logger.getLogger(RoleServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<RoleDTO> getRolesByUser(Long userId) {
		List<RoleDTO> result = new ArrayList<RoleDTO>();
		
		List<Role> roles;
		try {
			
			roles = roleDaoImpl.getRolesByUser(userId);
			if(roles != null && !roles.isEmpty()){
				result = (List<RoleDTO>) mapper.map(roles, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional(readOnly=false)
	public OperationResult addRole(RoleDTO role) {
		OperationResult result = new OperationResult();
		
		Role roleDestination;
		try {
			roleDestination = mapper.map(role, Role.class);
			roleDaoImpl.addRole(roleDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Perfil registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar perfil");
		}
		
		return result;
	}

	@Override
	@Transactional(readOnly=false)
	public OperationResult deleteRole(RoleDTO role) {
		OperationResult result = new OperationResult();
		
		Role roleDestination;
		try {
			roleDestination = mapper.map(role, Role.class);
			roleDaoImpl.deleteRole(roleDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Perfil eliminado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar perfil");
		}
		
		return result;
		
	}

	@Override
	@Transactional
	public RoleDTO getRole(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<RoleDTO> getRoles(boolean excludeAdmin) {
		List<RoleDTO> result = new ArrayList<RoleDTO>();
		
		List<Role> roles;
		try {
			
			roles = roleDaoImpl.getRoles(excludeAdmin);
			if(roles != null && !roles.isEmpty()){
				result = (List<RoleDTO>) mapper.map(roles, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	public OperationResult addRoleForUser(Long idUser, Long idRole) {
		OperationResult result = new OperationResult();
		
		try {
			roleDaoImpl.addRoleForUser(idUser, idRole);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Rol agregado exitosamente");

		}  catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al agregar rol");
		}
		
		return result;
	}

	@Override
	public OperationResult deleteRoleForUser(Long idUser, Long idRole) {
		OperationResult result = new OperationResult();
		
		try {
			roleDaoImpl.deleteRoleForUser(idUser, idRole);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Rol eliminado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar rol");
		}
		
		return result;
	}

}
