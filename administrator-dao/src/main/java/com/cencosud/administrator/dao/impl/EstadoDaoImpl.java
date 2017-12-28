/**
 *@name ChannelDaoImpl.java
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
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EstadoDao;
import com.cencosud.administrator.dao.domain.Estado;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class EstadoDaoImpl implements EstadoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Estado> getEstados() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Estado.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<Estado>) cr.list();
	}

	@Override
	public Estado getEstadosId(Long id) {
		// TODO Auto-generated method stub
		return (Estado) sessionFactory.getCurrentSession().get(Estado.class, id);
	}

}
