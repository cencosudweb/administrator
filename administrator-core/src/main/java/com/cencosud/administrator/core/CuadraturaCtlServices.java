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

import com.cencosud.administrator.dto.users.CuadraturaCtlDTO;

/**
 * @description Interface  
 */
public interface CuadraturaCtlServices {

	public List<CuadraturaCtlDTO> getCuadraturaCtls(int carga, String bogeda, int statCode, String fechaIni, String fechaTer, String tipo, int tranNbr, int estado, int start, int limit);
	public int getCuadraturaCtlContar(int carga, String bogeda, int statCode, String fechaIni, String fechaTer, String tipo, int tranNbr, int estado);

}
