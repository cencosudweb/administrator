/**
 *@name EconomicActivityDaoImpl.java
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

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.EconomicActivityDao;
import com.cencosud.administrator.dao.domain.EconomicActivity;
import com.cencosud.administrator.dao.domain.Role;
/**
 * @description Clase EconomicActivityDaoImpl que implementa la interface
 */
@Repository
public class EconomicActivityDaoImpl implements EconomicActivityDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<EconomicActivity> getActivities() {
		return (List<EconomicActivity>) sessionFactory.getCurrentSession().createQuery("from EconomicActivity").list();
	}

	@Override
	public Role getEconomicActivity(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEconomicActivity(EconomicActivity activity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEconomicActivity(EconomicActivity role) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editEconomicActivity(EconomicActivity activity) {
		// TODO Auto-generated method stub
		
	}
	
}
