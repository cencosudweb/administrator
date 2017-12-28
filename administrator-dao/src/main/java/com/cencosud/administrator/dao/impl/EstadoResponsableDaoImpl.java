package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EstadoResponsableDao;
import com.cencosud.administrator.dao.domain.EstadoResponsable;

@Repository
public class EstadoResponsableDaoImpl implements EstadoResponsableDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoResponsable> getEstadoResponsables() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EstadoResponsable.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<EstadoResponsable>) cr.list();
	}

}
