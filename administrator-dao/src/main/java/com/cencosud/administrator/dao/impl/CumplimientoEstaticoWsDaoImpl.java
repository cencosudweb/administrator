/**
 * 
 */
package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CumplimientoEstaticoWsDao;
import com.cencosud.administrator.dao.domain.CumplimientoEstaticoWs;

/**
 * @author EA7129
 *
 */

@Repository
public class CumplimientoEstaticoWsDaoImpl implements CumplimientoEstaticoWsDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CumplimientoEstaticoWs> getCumplimientoEstaticoWss() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CumplimientoEstaticoWs.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<CumplimientoEstaticoWs>) cr.list();
	}
}
