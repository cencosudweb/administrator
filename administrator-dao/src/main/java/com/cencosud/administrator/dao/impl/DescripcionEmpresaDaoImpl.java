package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.DescripcionEmpresaDao;
import com.cencosud.administrator.dao.domain.DescripcionEmpresa;

@Repository
public class DescripcionEmpresaDaoImpl implements DescripcionEmpresaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<DescripcionEmpresa> getDescripcionEmpresas() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(DescripcionEmpresa.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<DescripcionEmpresa>) cr.list();
	}

}
