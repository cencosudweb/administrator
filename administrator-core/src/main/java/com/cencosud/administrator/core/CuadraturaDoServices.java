/**
 *@name CuadraturaDoServices.java
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

import com.cencosud.administrator.dto.users.CuadraturaDoDTO;

/**
 * @description Interface  
 */
public interface CuadraturaDoServices {

	public List<CuadraturaDoDTO> getCuadraturaDos(String fechaIni, String fechaTer,  int estado, int start, int limit);
	public int getCuadraturaDoContar(String fechaIni, String fechaTer, int estado);

}
