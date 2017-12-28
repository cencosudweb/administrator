package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EstadoCumpleDao;
import com.cencosud.administrator.dao.domain.EstadoCumple;

@Repository
public class EstadoCumpleDaoImpl implements EstadoCumpleDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoCumple> getEstadoCumples() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EstadoCumple.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<EstadoCumple>) cr.list();
	}

}
