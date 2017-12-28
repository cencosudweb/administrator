/**
 *@name ChannelServices.java
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

import com.cencosud.administrator.dto.users.CumplimientokpiWebDTO;
/**
 * @description Interface ChannelServices
 */
public interface CumplimientokpiWebServices {

	public List<CumplimientokpiWebDTO> getCumplimientokpiWebs(String fechaIni, String fechaTer);
	public int getCumplimientokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String empresa);	
	public int getCumpleokpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String cumple, String prefixclause);	
	public int getTotalkpiWebCounts(String fechaIni, String fechaTer, String canal, String despacho, String guia, String cumple, String prefixclause);	

	
}
