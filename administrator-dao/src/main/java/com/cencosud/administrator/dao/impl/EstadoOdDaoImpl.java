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

import com.cencosud.administrator.dao.EstadoOdDao;
import com.cencosud.administrator.dao.domain.EstadoOd;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class EstadoOdDaoImpl implements EstadoOdDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoOd> getEstadoOds() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EstadoOd.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<EstadoOd>) cr.list();
	}

}
