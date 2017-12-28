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

import com.cencosud.administrator.dao.TipoEstadoVentaEnVerdeDao;
import com.cencosud.administrator.dao.domain.TipoEstadoVentaEnVerde;
/**
 * @description Clase TipoEstadoVentaEnVerdeDaoImpl que implementa la interface
 */
@Repository
public class TipoEstadoVentaEnVerdeDaoImpl implements TipoEstadoVentaEnVerdeDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoEstadoVentaEnVerde> getTipoEstadoVentaEnVerdes() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(TipoEstadoVentaEnVerde.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<TipoEstadoVentaEnVerde>) cr.list();
	}

}
