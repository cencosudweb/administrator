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
package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.EcommerceSoporteVentaServices;
import com.cencosud.administrator.dao.EcommerceSoporteVentaDao;
import com.cencosud.administrator.dao.domain.EcommerceSoporteVenta;
import com.cencosud.administrator.dto.users.EcommerceSoporteVentaDTO;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class EcommerceSoporteVentaServicesImpl extends BaseServicesImpl implements EcommerceSoporteVentaServices {

	@Autowired
	private EcommerceSoporteVentaDao ecommerceSoporteVentaDaoImpl;

	private static Logger log = Logger.getLogger(EcommerceSoporteVentaServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentas(String fecha, String estado) {
		List<EcommerceSoporteVentaDTO> result = new ArrayList<EcommerceSoporteVentaDTO>();

		List<EcommerceSoporteVenta> ecommerceSoporteVentas;
		try {

			ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentas(fecha, estado);
			if (ecommerceSoporteVentas != null && !ecommerceSoporteVentas.isEmpty()) {
				result = (List<EcommerceSoporteVentaDTO>) mapper.map(ecommerceSoporteVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentas(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, int start, int limit) {
		// TODO Auto-generated method stub
		List<EcommerceSoporteVentaDTO> result = new ArrayList<EcommerceSoporteVentaDTO>();

		List<EcommerceSoporteVenta> ecommerceSoporteVentas;
		try {

			ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentas(fecha, estado,
					estadoRelacion, coddesp, loloca, start, limit);
			if (ecommerceSoporteVentas != null && !ecommerceSoporteVentas.isEmpty()) {
				result = (List<EcommerceSoporteVentaDTO>) mapper.map(ecommerceSoporteVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCounts(String fecha, String estado) {
		// TODO Auto-generated method stub

		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCounts(fecha, estado);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String SKU) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCounts(fecha, estado, estadoRelacion, coddesp,
					loloca, SKU);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaEomDifs(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		List<EcommerceSoporteVentaDTO> result = new ArrayList<EcommerceSoporteVentaDTO>();

		List<EcommerceSoporteVenta> ecommerceSoporteVentas;
		try {

			ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomDifs(fecha, estado,
					estadoRelacion, coddesp, loloca, tipoEstadoOc, sku, start, limit);
			if (ecommerceSoporteVentas != null && !ecommerceSoporteVentas.isEmpty()) {
				result = (List<EcommerceSoporteVentaDTO>) mapper.map(ecommerceSoporteVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaEomDifCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomDifCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaEomFindCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomFindCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsPosJhonson(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosJhonson(fecha, estado,
					estadoRelacion, coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsPosParis(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosParis(fecha, estado, estadoRelacion,
					coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsPosParisCl(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosParisCl(fecha, estado,
					estadoRelacion, coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsEomDad(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomDad(fecha, estado, estadoRelacion,
					coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsEomClikcCollect(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomClickCollect(fecha, estado,
					estadoRelacion, coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaCountsEomBopis(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomBopis(fecha, estado, estadoRelacion,
					coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaWmsCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaJdaCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaWmsDifs(String fecha, String estado,
			String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		List<EcommerceSoporteVentaDTO> result = new ArrayList<EcommerceSoporteVentaDTO>();

		List<EcommerceSoporteVenta> ecommerceSoporteVentas;
		try {

			ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsDifs(fecha, estado,
					estadoRelacion, coddesp, loloca, tipoEstadoOc, sku, start, limit);
			if (ecommerceSoporteVentas != null && !ecommerceSoporteVentas.isEmpty()) {
				result = (List<EcommerceSoporteVentaDTO>) mapper.map(ecommerceSoporteVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaJdaDifs(String fecha, String estado,
			String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit) {
		// TODO Auto-generated method stub
		List<EcommerceSoporteVentaDTO> result = new ArrayList<EcommerceSoporteVentaDTO>();

		List<EcommerceSoporteVenta> ecommerceSoporteVentas;
		try {

			ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaDifs(fecha, estado,
					estadoRelacion, coddesp, loloca, tipoEstadoOc, sku, start, limit);
			if (ecommerceSoporteVentas != null && !ecommerceSoporteVentas.isEmpty()) {
				result = (List<EcommerceSoporteVentaDTO>) mapper.map(ecommerceSoporteVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaWmsDifCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsDifCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaJdaDifCounts(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaDifCounts(fecha, estado, estadoRelacion,
					coddesp, loloca, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaPaginador(String fecha, String estado, String estadoRelacion, String coddesp,
			String loloca) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaPaginador(fecha, estado, estadoRelacion,
					coddesp, loloca);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaEomDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomDifPaginador(fecha, estado, estadoRelacion, coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaWmsDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsDifPaginador(fecha, estado, estadoRelacion, coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

	@Override
	@Transactional
	public int getEcommerceSoporteVentaJdaDifPaginador(String fecha, String estado, String estadoRelacion,
			String coddesp, String loloca, String tipoEstadoOc, String sku) {
		// TODO Auto-generated method stub
		Integer result;

		try {

			result = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaDifPaginador(fecha, estado, estadoRelacion, coddesp, loloca, tipoEstadoOc, sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (int) 0;
		}

		return result;
	}

}
