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
package com.cencosud.administrator.dao;

import java.util.List;

import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;

/**
 * @description Interface  
 */
public interface CumplimientoKpiWebDao {

	public List<CumplimientokpiWeb> getCumplimientoKpiWebs(String fechaIni, String fechaTer);
	public int getCumplimientokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String empresa);	
	public int getCumpleokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String cumple, String prefixclause);	
	public int getTotalkpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String cumple, String prefixclause);	

}
