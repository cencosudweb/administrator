package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EstadoCumplimientoDao;
import com.cencosud.administrator.dao.domain.EstadoCumplimiento;

@Repository
public class EstadoCumplimientoDaoImpl implements EstadoCumplimientoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EstadoCumplimiento> getEstadoCumplimientos() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EstadoCumplimiento.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<EstadoCumplimiento>) cr.list();
	}

}
