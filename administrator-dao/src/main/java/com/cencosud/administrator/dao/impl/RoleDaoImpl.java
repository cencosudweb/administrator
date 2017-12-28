/**
 *@name RoleDaoImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.RoleDao;
import com.cencosud.administrator.dao.domain.Role;
/**
 * @description Clase RoleDaoImpl que implementa la interface
 */
@Repository
public class RoleDaoImpl implements RoleDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getRolesByUser(Long userId) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Role.class);
		if (userId != null) {
			// if(StringUtils.isNotBlank(id_user)){
			cr.add(Restrictions.eq("id", userId));
		}
		return (List<Role>) cr.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getRoles(boolean includeAdmin) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Role.class);
		if (!includeAdmin) {
			// if(StringUtils.isNotBlank(id_user)){
			cr.add(Restrictions.ne("role", "ROLE_ADMIN"));
			cr.add(Restrictions.ne("role", "ROLE_PENDING"));
		}
		return (List<Role>) cr.list();
	}

	@Override
	public void addRole(Role role) {
		sessionFactory.getCurrentSession().saveOrUpdate(role);
	}

	@Override
	public void deleteRole(Role role) {
		sessionFactory.getCurrentSession().delete(role);
	}

	@Override
	public Role getRole(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addRoleForUser(Long idUser, Long idRole) {

		String sql = "INSERT into users_authorities(id_user, id_authorities) values " + "(:idUser, :idRole)";

		try {
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			query.setParameter("idUser", idUser);
			query.setParameter("idRole", idRole);
			query.executeUpdate();
		} catch (ConstraintViolationException ex) {/*Rol ya esta asignado al usuario*/}

	}

	@Override
	public void deleteRoleForUser(Long idUser, Long idRole) {
		String sql = "DELETE from users_authorities " + "WHERE id_user = :idUser && id_authorities = :idRole";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("idUser", idUser);
		query.setParameter("idRole", idRole);
		query.executeUpdate();

	}

}
