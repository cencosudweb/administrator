package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.TipoVentaDao;
import com.cencosud.administrator.dao.domain.TipoVenta;

@Repository
public class TipoVentaDaoImpl implements TipoVentaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoVenta> getTipoVentas() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(TipoVenta.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<TipoVenta>) cr.list();
	}

}
