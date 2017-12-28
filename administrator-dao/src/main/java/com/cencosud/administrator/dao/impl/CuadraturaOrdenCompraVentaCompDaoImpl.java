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

import com.cencosud.administrator.dao.CuadraturaOrdenCompraVentaCompDao;
import com.cencosud.administrator.dao.domain.CuadraturaOrdenCompraVentaComp;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CuadraturaOrdenCompraVentaCompDaoImpl implements CuadraturaOrdenCompraVentaCompDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CuadraturaOrdenCompraVentaComp> getCuadraturaOrdenCompraVentaComps(String starttime) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CuadraturaOrdenCompraVentaComp.class);
		cr.add(Restrictions.eq("fechaIngreso", starttime));
		return (List<CuadraturaOrdenCompraVentaComp>) cr.list();
	}

	

	
}
