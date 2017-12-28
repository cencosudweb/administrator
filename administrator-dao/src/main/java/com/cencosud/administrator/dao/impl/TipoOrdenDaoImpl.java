package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.TipoOrdenDao;
import com.cencosud.administrator.dao.domain.TipoOrden;

@Repository
public class TipoOrdenDaoImpl implements TipoOrdenDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoOrden> getTipoOrdens() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(TipoOrden.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<TipoOrden>) cr.list();
	}

}
