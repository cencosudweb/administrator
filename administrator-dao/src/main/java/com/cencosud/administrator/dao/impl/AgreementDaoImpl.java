/**
 *@name AgreementDaoImpl.java
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

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.AgreementDao;
import com.cencosud.administrator.dao.domain.Agreement;
/**
 * @description Clase AgreementDaoImpl que implementa la interface
 */

@Repository
public class AgreementDaoImpl implements AgreementDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	@Override
	public void addFIComerceAgreementRelationship(Long idIF, Long idCommerce, Long idAgreement) {
		// TODO Auto-generated method stub
		String sql = "INSERT into commerce_agreement_fi(financial_institution_id, commerce_id, agreement_id) " +
				"values " + "(:idIF, :idCommerce, :idAgreement)";

		try {
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			query.setParameter("idIF", idIF);
			query.setParameter("idCommerce", idCommerce);
			query.setParameter("idAgreement", idAgreement);
			query.executeUpdate();
		} catch (ConstraintViolationException ex) {/*Relacion ya existe*/}

	}

	@Override
	public Agreement getAgreement(Long agreementId) {
		// TODO Auto-generated method stub
		return (Agreement) sessionFactory.getCurrentSession().get(Agreement.class, agreementId);
	}
	
	@Override
	public void addAgreement(Agreement agreement) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(agreement);
	}
	
	@Override
	public void editAgreement(Agreement agreement) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(agreement);
	}

	@Override
	public void updateStatus(Long agreementId, int status) {
		// TODO Auto-generated method stub
		String sql = "UPDATE agreement c " +
		"set c.status = :status "+
		"WHERE c.id = :agreementId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("agreementId", agreementId);
		query.setParameter("status", status);
		query.executeUpdate();
		
	}

	@Override
	public boolean validateAgreementExist(Long fiId, Long commerceId) {
		// TODO Auto-generated method stub
		String sql = "SELECT agreement_id FROM commerce_agreement_fi "
					+ "WHERE financial_institution_id = :fiId "
					+ "and commerce_id = :commerceId";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("fiId", fiId);
		query.setParameter("commerceId", commerceId);
		
		Object result = query.uniqueResult();
		
		return result != null;
		
		
	}

}
