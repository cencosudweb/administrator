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

import com.cencosud.administrator.dao.EcommerceSoporteVentaDao;
import com.cencosud.administrator.dao.domain.EcommerceSoporteVenta;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class EcommerceSoporteVentaDaoImpl implements EcommerceSoporteVentaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EcommerceSoporteVenta> getEcommerceSoporteVentas(String fecha, String estado) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EcommerceSoporteVenta.class);
		// cr.add(Restrictions.eq("id", userId));
		if (fecha != null) {
			cr.add(Restrictions.eq("fecTranTsql", fecha));
		}

		if (estado != null) {
			cr.add(Restrictions.eq("tipoEstado", Integer.parseInt(estado)));
		}

		return (List<EcommerceSoporteVenta>) cr.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EcommerceSoporteVenta> getEcommerceSoporteVentas(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EcommerceSoporteVenta.class);
		// cr.add(Restrictions.eq("id", userId));
		if (fecha != null) {
			cr.add(Restrictions.eq("fecTranTsql", fecha));
		}

		if (estado != null) {
			cr.add(Restrictions.eq("tipoEstado", Integer.parseInt(estado)));
		}

		if (estadoRelacion != null) {
			cr.add(Restrictions.eq("tipoRelacion", Integer.parseInt(estadoRelacion)));
		}

		if (coddesp != null) {
			cr.add(Restrictions.eq("codDesp", Integer.parseInt(coddesp)));
		}

		if (loloca != null) {
			cr.add(Restrictions.eq("loloca", Integer.parseInt(loloca)));
		}
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fecTranTsql"));
		return (List<EcommerceSoporteVenta>) cr.list();
	}

	@Override
	public int getEcommerceSoporteVentaCounts(String fecha, String estado) {
		// TODO Auto-generated method stub

		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getEcommerceSoporteVentaCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EcommerceSoporteVenta> getEcommerceSoporteVentaEomDifs(String fecha, String estado,
			String estadoRelacion, String codDesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EcommerceSoporteVenta.class);
		// cr.add(Restrictions.eq("id", userId));
		if (fecha != null) {
			cr.add(Restrictions.eq("fecTranTsql", fecha));
		}

		if (estado != null) {
			cr.add(Restrictions.eq("tipoEstado", Integer.parseInt(estado)));
		}

		if (estadoRelacion != null) {
			cr.add(Restrictions.eq("tipoRelacion", Integer.parseInt(estadoRelacion)));
		}

		if (codDesp != null) {
			// cr.add(Restrictions.ne("codDesp", Integer.parseInt(codDesp)));
			cr.add(Restrictions.eq("codDesp", Integer.parseInt(codDesp)));
		}

		if (loloca != null) {
			cr.add(Restrictions.ne("loloca", Integer.parseInt(loloca)));
		}

		if (tipoEstadoOc != null) {
			cr.add(Restrictions.eq("tipoEstadoOc", Integer.parseInt(tipoEstadoOc)));
		}

		if (sku != null) {
			cr.add(Restrictions.gt("sku", Integer.parseInt(sku)));
		}
		
		
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fecTranTsql"));

		return (List<EcommerceSoporteVenta>) cr.list();
	}

	@Override
	public int getEcommerceSoporteVentaEomDifCounts(String fecha, String estado, String estadoRelacion, String codDesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (codDesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca != :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (codDesp != null) {
			query.setParameter("codDesp", codDesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getEcommerceSoporteVentaEomFindCounts(String fecha, String estado, String estadoRelacion, String codDesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (codDesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}
		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}
		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (codDesp != null) {
			query.setParameter("codDesp", codDesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getEcommerceSoporteVentaCountsPosJhonson(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca >= :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaCountsPosParis(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		sql += " AND ESV.LOLOCA <> 32";

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca <= :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaCountsPosParisCl(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaCountsEomDad(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaCountsEomClickCollect(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaCountsEomBopis(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaWmsCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1   AND ESV.TIPO_ESTADO_OC  IN (12, 200 , 400 ) ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getEcommerceSoporteVentaJdaCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1  AND ESV.TIPO_ESTADO_OC  IN (12, 200 , 400 )  ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EcommerceSoporteVenta> getEcommerceSoporteVentaWmsDifs(String fecha, String estado,
			String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EcommerceSoporteVenta.class);
		// cr.add(Restrictions.eq("id", userId));

		cr.add(Restrictions.in("tipoEstadoOc", new Integer[] { 12, 200, 400 }));

		if (fecha != null) {
			cr.add(Restrictions.eq("fecTranTsql", fecha));
		}

		if (estado != null) {
			cr.add(Restrictions.eq("tipoEstado", Integer.parseInt(estado)));
		}

		if (estadoRelacion != null) {
			cr.add(Restrictions.eq("tipoRelacion", Integer.parseInt(estadoRelacion)));
		}

		if (coddesp != null) {
			// cr.add(Restrictions.ne("codDesp", Integer.parseInt(codDesp)));
			cr.add(Restrictions.eq("codDesp", Integer.parseInt(coddesp)));
		}

		if (loloca != null) {
			cr.add(Restrictions.ne("loloca", Integer.parseInt(loloca)));
		}

		if (tipoEstadoOc != null) {
			cr.add(Restrictions.eq("tipoEstadoOc", Integer.parseInt(tipoEstadoOc)));
		}

		if (sku != null) {
			cr.add(Restrictions.gt("sku", Integer.parseInt(sku)));
		}
		
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fecTranTsql"));

		return (List<EcommerceSoporteVenta>) cr.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EcommerceSoporteVenta> getEcommerceSoporteVentaJdaDifs(String fecha, String estado,
			String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(EcommerceSoporteVenta.class);
		// cr.add(Restrictions.eq("id", userId));
		
		cr.add(Restrictions.not(Restrictions.in("tipoEstadoOc", new Integer[] { 12, 200, 400 })));
		
		if (fecha != null) {
			cr.add(Restrictions.eq("fecTranTsql", fecha));
		}

		if (estado != null) {
			cr.add(Restrictions.eq("tipoEstado", Integer.parseInt(estado)));
		}

		if (estadoRelacion != null) {
			cr.add(Restrictions.eq("tipoRelacion", Integer.parseInt(estadoRelacion)));
		}

		if (coddesp != null) {
			// cr.add(Restrictions.ne("codDesp", Integer.parseInt(codDesp)));
			cr.add(Restrictions.eq("codDesp", Integer.parseInt(coddesp)));
		}

		if (loloca != null) {
			cr.add(Restrictions.ne("loloca", Integer.parseInt(loloca)));
		}

		if (tipoEstadoOc != null) {
			cr.add(Restrictions.eq("tipoEstadoOc", Integer.parseInt(tipoEstadoOc)));
		}

		if (sku != null) {
			cr.add(Restrictions.gt("sku", Integer.parseInt(sku)));
		}
		
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fecTranTsql"));

		return (List<EcommerceSoporteVenta>) cr.list();
	}

	@Override
	public int getEcommerceSoporteVentaWmsDifCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 AND ESV.TIPO_ESTADO_OC   IN (12, 200 , 400 )  ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	@Override
	public int getEcommerceSoporteVentaJdaDifCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// Mysql
		// String sql = " SELECT COUNT(*) as nbcall FROM asterisk.cdr_asterisk c
		// left outer join users u on c.accountcode=u.useraccount WHERE
		// c.calldate >0";
		// Sql Server
		// String sql = " SELECT COUNT(*) as nbcall FROM
		// asterisk.dbo.cdr_asterisk c left outer join users u on
		// c.accountcode=u.useraccount WHERE c.calldate >0";
		// Postgres
		// String sql = " SELECT COUNT(*) FROM cdr_asterisk c left outer join
		// users u on c.accountcode=u.useraccount ";
		// Oracle
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 AND ESV.TIPO_ESTADO_OC   NOT IN (12, 200 , 400 )  ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaPaginador(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1   ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}

		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaEomDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1   ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (coddesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca = :loloca";
		}
		
		
		if (tipoEstadoOc != null) {
			
			sql += " AND ESV.tipo_estado_oc = :tipoEstadoOc";
		}

		if (sku != null) {
			sql += " AND ESV.sku > :sku";
		}
		

		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (coddesp != null) {
			query.setParameter("codDesp", coddesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}
		
		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaWmsDifPaginador(String fecha, String estado, String estadoRelacion,
			String codDesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 AND ESV.TIPO_ESTADO_OC in (12, 200, 400) ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (codDesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca != :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (codDesp != null) {
			query.setParameter("codDesp", codDesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public int getEcommerceSoporteVentaJdaDifPaginador(String fecha, String estado, String estadoRelacion,
			String codDesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM ecommerce_soporte_venta ESV  where 1 = 1 AND not ESV.TIPO_ESTADO_OC in (12, 200, 400) ";

		if (fecha != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.FECTRANTSL = :fecha";
		}

		if (estado != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO = :estado";
		}

		if (estadoRelacion != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_RELACION = :estadoRelacion";
		}

		if (codDesp != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.CODIGO_DESPACHO = :codDesp";
		}

		if (loloca != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.loloca != :loloca";
		}

		if (tipoEstadoOc != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.TIPO_ESTADO_OC = :tipoEstadoOc";
		}

		if (sku != null) {
			// sql += " AND c.calldate <= :stoptime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.SKU > :sku";
		}
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fecha != null) {
			query.setParameter("fecha", fecha);
		}

		if (estado != null) {
			query.setParameter("estado", estado);
		}

		if (estadoRelacion != null) {
			query.setParameter("estadoRelacion", estadoRelacion);
		}

		if (codDesp != null) {
			query.setParameter("codDesp", codDesp);
		}

		if (loloca != null) {
			query.setParameter("loloca", loloca);
		}

		if (tipoEstadoOc != null) {
			query.setParameter("tipoEstadoOc", tipoEstadoOc);
		}

		if (sku != null) {
			query.setParameter("sku", sku);
		}

		return ((Number) query.uniqueResult()).intValue();
	}

}
