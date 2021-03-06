package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.ClienteRetiraDao;
import com.cencosud.administrator.dao.domain.ClienteRetira;

@Repository
public class ClienteRetiraDaoImpl implements ClienteRetiraDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ClienteRetira> getClienteRetiras() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(ClienteRetira.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.addOrder(Order.desc("description"));
		return (List<ClienteRetira>) cr.list();
	}

}
