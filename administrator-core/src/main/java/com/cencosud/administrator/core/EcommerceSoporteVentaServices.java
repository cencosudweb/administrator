/**
 *@name ChannelDao.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.dto.users.EcommerceSoporteVentaDTO;
/**
 * @description Interface  
 */
public interface EcommerceSoporteVentaServices {

	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentas(String fecha, String estado);

	//nuevo
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentas(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, int start, int limit);
	public int getEcommerceSoporteVentaPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca);
	
	public int getEcommerceSoporteVentaCounts(String fecha, String estado);	
	public int getEcommerceSoporteVentaCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	

	//Nuevo
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaEomDifs(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit);
	public int getEcommerceSoporteVentaEomDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);
	
	
	
	public int getEcommerceSoporteVentaEomDifCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);	
	public int getEcommerceSoporteVentaEomFindCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);	

	public int getEcommerceSoporteVentaCountsPosJhonson(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	
	public int getEcommerceSoporteVentaCountsPosParis(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	
	public int getEcommerceSoporteVentaCountsPosParisCl(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	


	public int getEcommerceSoporteVentaCountsEomDad(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);	
	public int getEcommerceSoporteVentaCountsEomClikcCollect(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);	
	public int getEcommerceSoporteVentaCountsEomBopis(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);	

	//Nuevo
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaWmsDifs(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit);
	public int getEcommerceSoporteVentaWmsDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);
	
	//Nuevo
	public List<EcommerceSoporteVentaDTO> getEcommerceSoporteVentaJdaDifs(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku, int start, int limit);
	public int getEcommerceSoporteVentaJdaDifPaginador(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String tipoEstadoOc, String sku);

	
	
	public int getEcommerceSoporteVentaWmsCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	
	public int getEcommerceSoporteVentaWmsDifCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	

	public int getEcommerceSoporteVentaJdaCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	
	public int getEcommerceSoporteVentaJdaDifCounts(String fecha, String estado, String estadoRelacion, String coddesp, String loloca, String sku);	
	
}
