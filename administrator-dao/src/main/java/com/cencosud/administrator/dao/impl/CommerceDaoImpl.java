/**
 *@name CommerceDaoImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CommerceDao;
import com.cencosud.administrator.dao.domain.Commerce;
/**
 * @description Clase CommerceDaoImpl que implementa la interface
 */
@Repository
public class CommerceDaoImpl implements CommerceDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Commerce> getCommerces(int status) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Commerce.class);
		if(status != 2)
			cr.add(Restrictions.eq("status", status));
        return (List<Commerce>)cr.list();
	}

	@Override
	public Commerce getCommerce(Long commerceId) {
		return (Commerce) sessionFactory.getCurrentSession().get(Commerce.class, commerceId);
	}
	
	@Override
	public Commerce getCommerceByMnemonic(String mnemonic) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Commerce.class);
		cr.add(Restrictions.eq("mnemonic", mnemonic));
        return (Commerce)cr.uniqueResult();
	}

	@Override
	public Commerce getCommerceByRut(String rut) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Commerce.class);
		cr.add(Restrictions.eq("rut", rut));
        return (Commerce)cr.uniqueResult();
	}

	@Override
	public void editCommerce(Commerce commerce) {
		sessionFactory.getCurrentSession().update(commerce);
	}

	@Override
	public void addCommerce(Commerce commerce) {
		sessionFactory.getCurrentSession().save(commerce);
	}

	@Override
	public void deleteCommerce(Long commerceId) {
		Commerce commerce = (Commerce) sessionFactory.getCurrentSession().get(Commerce.class, commerceId);
		sessionFactory.getCurrentSession().delete(commerce);
	}
	
	@Override
	public void updateStatus(Long commerceId, int status) {
		String sql = "UPDATE commerce c " +
		"set c.status = :status "+
		"WHERE c.id = :commerceId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("commerceId", commerceId);
		query.setParameter("status", status);
		query.executeUpdate();
	}

}
