/**
 *@name FinancialInstitutionDaoImpl.java
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

import com.cencosud.administrator.dao.FinancialInstitutionDao;
import com.cencosud.administrator.dao.domain.FinancialInstitution;
/**
 * @description Clase FinancialInstitutionDaoImpl que implementa la interface
 */
@Repository
public class FinancialInstitutionDaoImpl implements FinancialInstitutionDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FinancialInstitution> getFIs(int status) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FinancialInstitution.class);
		if(status != 2)
			cr.add(Restrictions.eq("status", status));
        return (List<FinancialInstitution>)cr.list();
	}

	@Override
	public void deleteFI(Long fiId) {
		FinancialInstitution fi = (FinancialInstitution) sessionFactory.getCurrentSession().get(FinancialInstitution.class, fiId);
		sessionFactory.getCurrentSession().delete(fi);
		
	}
	
	@Override
	public FinancialInstitution getFIByMnemonic(String mnemonic) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FinancialInstitution.class);
		cr.add(Restrictions.eq("mnemonic", mnemonic));
        return (FinancialInstitution)cr.uniqueResult();
	}

	@Override
	public FinancialInstitution getFIByRut(String rut) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(FinancialInstitution.class);
		cr.add(Restrictions.eq("rut", rut));
        return (FinancialInstitution)cr.uniqueResult();
	}

	@Override
	public FinancialInstitution getFI(Long fiId) {
		return (FinancialInstitution) sessionFactory.getCurrentSession().get(FinancialInstitution.class, fiId);
	}
	
	@Override
	public void editFI(FinancialInstitution fi) {
		sessionFactory.getCurrentSession().update(fi);
	}

	@Override
	public void addFI(FinancialInstitution fi) {
		sessionFactory.getCurrentSession().save(fi);
	}
	
	@Override
	public void updateStatus(Long financialId, int status) {
		String sql = "UPDATE financial_institution fi " +
		"set fi.status = :status "+
		"WHERE fi.id = :financialId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("financialId", financialId);
		query.setParameter("status", status);
		query.executeUpdate();
	}
	
}
