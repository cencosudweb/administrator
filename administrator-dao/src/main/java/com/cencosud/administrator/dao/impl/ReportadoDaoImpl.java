/**
 *@name ChannelDaoImpl.java
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

import com.cencosud.administrator.dao.ReportadoDao;
import com.cencosud.administrator.dao.domain.Reportado;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class ReportadoDaoImpl implements ReportadoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Reportado> getReportados() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Reportado.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<Reportado>) cr.list();
	}

}
