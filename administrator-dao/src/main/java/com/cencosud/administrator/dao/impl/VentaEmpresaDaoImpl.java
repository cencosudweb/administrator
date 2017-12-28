package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.VentaEmpresaDao;
import com.cencosud.administrator.dao.domain.VentaEmpresa;

@Repository
public class VentaEmpresaDaoImpl implements VentaEmpresaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<VentaEmpresa> getVentaEmpresas() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(VentaEmpresa.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<VentaEmpresa>) cr.list();
	}

}
