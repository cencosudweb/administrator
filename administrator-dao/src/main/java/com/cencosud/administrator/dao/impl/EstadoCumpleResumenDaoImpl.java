package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EstadoCumpleResumenDao;
import com.cencosud.administrator.dao.domain.EstadoCumpleResumen;

@Repository
public class EstadoCumpleResumenDaoImpl implements EstadoCumpleResumenDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoCumpleResumen> getEstadoCumpleResumens() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EstadoCumpleResumen.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<EstadoCumpleResumen>) cr.list();
	}

}
