/**
 *@name TimeLimitDaoImpl.java
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
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.TimeLimitDao;
import com.cencosud.administrator.dao.domain.TimeLimit;
/**
 * @description Clase TimeLimitDaoImpl que implementa la interface
 */
@Repository
public class TimeLimitDaoImpl implements TimeLimitDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeLimit> getTimesLimit() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(TimeLimit.class);
//			cr.add(Restrictions.eq("id", userId));
		return (List<TimeLimit>) cr.list();
	}

}
