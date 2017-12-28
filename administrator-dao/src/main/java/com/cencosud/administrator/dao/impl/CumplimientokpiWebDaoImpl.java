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
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CumplimientoKpiWebDao;
import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CumplimientokpiWebDaoImpl implements CumplimientoKpiWebDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CumplimientokpiWeb> getCumplimientoKpiWebs(String fechaIni, String fechaTer) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CumplimientokpiWeb.class);

		if(fechaIni != null ){
			cr.add(Restrictions.ge("fecha", fechaIni));//>=
		} else {
			cr.add(Restrictions.ge("fecha", fechaIni));//>=
		}
		
		if(fechaTer != null ){
			cr.add(Restrictions.le("fecha", fechaTer));//<=
		} else {
			cr.add(Restrictions.le("fecha", fechaTer));//<=
		}
		return (List<CumplimientokpiWeb>) cr.list();
	}

	@Override
	public int getCumplimientokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String empresa) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cumplimiento_kpiweb KPI  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM <= :fechaTer";
		}

		
		if (canal != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPO_ORDEN = :canal";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		if (canal != null) {
			query.setParameter("canal", canal);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getCumpleokpiWebCounts(String fechaIni, String fechaTer, String orden, String venta, String guia, String cumple, String prefixclause) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cumplimiento_kpiweb KPI  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM <= :fechaTer";
		}
		//if (canal != null) {
		if (orden != null ) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPO_ORDEN = " + orden;
		}
		
		if (venta != null ) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPO_VENTA = " + venta;
		}
		
		if (guia != null ) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPOGUI = " + guia;
		}
		
		
		
		
		
		
		if ("1".equals(cumple)) { //
			sql += " AND KPI.ID_CUMPLE = 1 ";
		} else if ("2".equals(cumple)) {
			sql += " AND KPI.ID_CUMPLE = 2 ";
		} else if ("3".equals(cumple)) {
			sql += " AND KPI.ID_CUMPLE = 3 ";
		} else {
			
		}
		
		if (prefixclause != null ){
			sql += prefixclause;
		} 
		
		
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		//if (orden != null) {
		//	query.setParameter("orden", orden);
		//}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getTotalkpiWebCounts(String fechaIni, String fechaTer, String orden, String venta, String guia,
			String cumple, String prefixclause) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cumplimiento_kpiweb KPI  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND KPI.FECHA_COMPROMISO_EOM <= :fechaTer";
		}

		if (orden != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPO_ORDEN = " + orden;
		}
		
		
		if (venta != null ) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPO_VENTA = " + venta;
		}
		
		if (guia != null ) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql KPI-PostgreSql-Oracle
			sql += " AND KPI.ID_TIPOGUI = " + guia;
		}
		
		if (prefixclause != null ){
			sql += prefixclause;
		} 
		
		sql += " AND (KPI.ID_CUMPLE = 1 OR KPI.ID_CUMPLE = 2 OR KPI.ID_CUMPLE = 3)";
		
		
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		//if (orden != null) {
		//	query.setParameter("orden", orden);
		//}

		return ((Number) query.uniqueResult()).intValue();
	}

}
