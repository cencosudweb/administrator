/**
 *@name RoleDao.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao;

import java.util.List;

import com.cencosud.administrator.dao.domain.Role;
/**
 * @description Interface  
 */
public interface RoleDao {

	public List<Role> getRolesByUser(Long userId);
	public List<Role> getRoles(boolean includeAdmin);
	public void addRole(Role role);
	public void addRoleForUser(Long idUser, Long idRole);
	public void deleteRoleForUser(Long idUser, Long idRole);
	public void deleteRole(Role role);
	public Role getRole(String id);
	
}
