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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.TiendaDao;
import com.cencosud.administrator.dao.domain.Tienda;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class TiendaDaoImpl implements TiendaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Tienda> getTiendas() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Tienda.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.asc("description"));
		return (List<Tienda>) cr.list();
	}

	@Override
	public Tienda getTiendasId(Long id) {
		// TODO Auto-generated method stub
		return (Tienda) sessionFactory.getCurrentSession().get(Tienda.class, id);
	}

	@Override
	public void addTienda(Tienda tienda) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(tienda);
	}

	@Override
	public void editTienda(Tienda tienda) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(tienda);
	}

	@Override
	public void deleteTienda(Long tiendaId) {
		// TODO Auto-generated method stub
		Tienda tienda = (Tienda) sessionFactory.getCurrentSession().get(Tienda.class, tiendaId);
		sessionFactory.getCurrentSession().delete(tienda);
	}

	@Override
	public Tienda getTiendas(String description) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Tienda.class);
		cr.add(Restrictions.eq("description", description));
        return (Tienda)cr.uniqueResult();
	}

}
