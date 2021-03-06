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

import com.cencosud.administrator.dao.domain.CuadraturaCtl;

/**
 * @description Interface  
 */
public interface CuadraturaCtlDao {

	public List<CuadraturaCtl> getCuadraturaCtls(int carga, String bogeda, int staCode, String fechaIni, String fechaTer, String tipo, int tranNbr, int estado, int start, int limit);
	public int getCuadraturaCtlContar(int carga, String bogeda, int statCode, String fechaIni, String fechaTer, String tipo, int tranNbr, int estado);
}
