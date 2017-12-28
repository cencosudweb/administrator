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

import com.cencosud.administrator.dto.users.CuadraturaVentaVerdeDTO;
/**
 * @description Interface  
 */
public interface CuadraturaVentaVerdeServices {

	public List<CuadraturaVentaVerdeDTO> getCuadraturaVentaVerde(String fechaIni,String fechaTer,  String estadoRelacion,int start, int limit);
	public int getCuadraturaVentaVerdeContar(String fechaIni,String fechaTer,  String estadoRelacion);
	public int getCuadraturaVentaVerdePaginador(String fechaIni,String fechaTer,  String estadoRelacion);
	
}
