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

import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;

/**
 * @description Interface  
 */
public interface CuadraturaVtavPdServices {

	public List<CuadraturaVtavPdDTO> getCuadraturaVtavConPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario);
	public List<CuadraturaVtavPdDTO> getCuadraturaVtavSinPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario);

	public int getCountConOd(String fechaIni, String fechaTer, int tipo_venta, int tipo_numero_distribuicion, int horario);	
	public int getCountSinOd(String fechaIni, String fechaTer, int tipo_venta, int tipo_numero_distribuicion, int horario);	

}
