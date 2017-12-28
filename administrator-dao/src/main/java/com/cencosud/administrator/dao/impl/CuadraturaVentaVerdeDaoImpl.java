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
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CuadraturaVentaVerdeDao;
import com.cencosud.administrator.dao.domain.CuadraturaVentaVerde;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CuadraturaVentaVerdeDaoImpl implements CuadraturaVentaVerdeDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CuadraturaVentaVerde> getCuadraturaVentaVerde(String fechaIni,String fechaTer, String estadoRelacion, int start,
			int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CuadraturaVentaVerde.class);
		// cr.add(Restrictions.eq("id", userId));
		
		if(fechaIni != null ){
			cr.add(Restrictions.ge("fechaCreacionOrden", fechaIni));//>=
		} else {
			cr.add(Restrictions.ge("fechaCreacionOrden", fechaIni));//>=
		}
		
		if(fechaTer != null ){
			cr.add(Restrictions.le("fechaCreacionOrden", fechaTer));//<=
		} else {
			cr.add(Restrictions.le("fechaCreacionOrden", fechaTer));//<=
		}
		
		
		

		if (estadoRelacion != null) {
			cr.add(Restrictions.eq("tipoRelacion", Integer.parseInt(estadoRelacion)));
		}

		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fechaCreacionOrden"));
		return (List<CuadraturaVentaVerde>) cr.list();
	}

	@Override
	public int getCuadraturaVentaVerdeContar(String fechaIni,String fechaTer, String estadoRelacion) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cuadratura_venta_verde ESV  where 1 = 1 ";
		
		
		

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECHA_CREACION_ORDEN >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECHA_CREACION_ORDEN <= :fechaTer";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		
		

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getCuadraturaVentaVerdePaginador(String fechaIni,String fechaTer, String estadoRelacion) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cuadratura_venta_verde ESV  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECHA_CREACION_ORDEN >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECHA_CREACION_ORDEN <= :fechaTer";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

}
