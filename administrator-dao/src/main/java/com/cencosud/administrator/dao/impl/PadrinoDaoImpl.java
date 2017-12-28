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

import com.cencosud.administrator.dao.PadrinoDao;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Tienda;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class PadrinoDaoImpl implements PadrinoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Padrino> getPadrinos(Tienda tienda) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Padrino.class);
			//cr.add(Restrictions.eq("id", userId));
		
		if(tienda != null ){
			cr.add(Restrictions.eq("tienda", tienda));
		}
		
		cr.addOrder(Order.asc("description"));
		return (List<Padrino>) cr.list();
	}

	@Override
	public Padrino getPadrinosId(Long id) {
		// TODO Auto-generated method stub
		return (Padrino) sessionFactory.getCurrentSession().get(Padrino.class, id);
	}

	@Override
	public void addPadrino(Padrino padrino) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(padrino);
	}

	@Override
	public void editPadrino(Padrino padrino) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(padrino);
	}

	@Override
	public void deletePadrino(Long padrinoId) {
		// TODO Auto-generated method stub
		Padrino padrino = (Padrino) sessionFactory.getCurrentSession().get(Padrino.class, padrinoId);
		sessionFactory.getCurrentSession().delete(padrino);
	}

	@Override
	public Padrino getPadrino(String description) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Padrino.class);
		cr.add(Restrictions.eq("description", description));
        return (Padrino)cr.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Padrino> getPadrinoDescs(String description) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Padrino.class);
		//cr.add(Restrictions.eq("id", userId));
		cr.add(Restrictions.eq("description", description));
		return (List<Padrino>) cr.list();
	}

}
