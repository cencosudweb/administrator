/**
 *@name RoleServices.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dto.users.RoleDTO;
/**
 * @description 
 */
public interface RoleServices {

	public List<RoleDTO> getRolesByUser(Long userId);
	public List<RoleDTO> getRoles(boolean includeAdmin);
	public OperationResult addRole(RoleDTO role);
	public OperationResult deleteRole(RoleDTO role);
	public OperationResult addRoleForUser(Long idUser, Long idRole);
	public OperationResult deleteRoleForUser(Long idUser, Long idRole);
	public RoleDTO getRole(String id);
	
}
