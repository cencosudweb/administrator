package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.TipoGuiaDao;
import com.cencosud.administrator.dao.domain.TipoGuia;

@Repository
public class TipoGuiaDaoImpl implements TipoGuiaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoGuia> getTipoGuias() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(TipoGuia.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<TipoGuia>) cr.list();
	}

}
