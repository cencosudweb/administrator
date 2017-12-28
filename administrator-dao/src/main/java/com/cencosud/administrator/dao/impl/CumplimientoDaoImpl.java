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
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CumplimientoDao;
import com.cencosud.administrator.dao.domain.Cumplimiento;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CumplimientoDaoImpl implements CumplimientoDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Cumplimiento> getCumplimientos(String fechaIni, String fechaTer) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Cumplimiento.class);

		if(fechaIni != null ){
			cr.add(Restrictions.ge("fechaCompromisoEom", fechaIni));//>=
		} else {
			cr.add(Restrictions.ge("fechaCompromisoEom", fechaIni));//>=
		}
		
		if(fechaTer != null ){
			cr.add(Restrictions.le("fechaCompromisoEom", fechaTer));//<=
		} else {
			cr.add(Restrictions.le("fechaCompromisoEom", fechaTer));//<=
		}
		return (List<Cumplimiento>) cr.list();
	}

	

}
