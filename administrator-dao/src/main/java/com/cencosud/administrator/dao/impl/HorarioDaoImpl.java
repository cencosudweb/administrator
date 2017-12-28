package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.HorarioDao;
import com.cencosud.administrator.dao.domain.Horario;

@Repository
public class HorarioDaoImpl implements HorarioDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Horario> getHorarios() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Horario.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<Horario>) cr.list();
	}

}
