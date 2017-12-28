/**
 *@name DateCustomConverter.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.converter;

import java.util.Date;

import org.dozer.DozerConverter;

/**
 * @description Clase que convierte Fecha a Long 
 */
public class DateCustomConverter extends DozerConverter<Date, Long> {
	
	public DateCustomConverter() {
		super(Date.class, Long.class);
	}

	@Override
	public Long convertTo(Date source, Long destination) {
		if(source != null){
	    	return source.getTime() / 1000L;
	    }
	    return (long) -1;
	}

	@Override
	public Date convertFrom(Long source, Date destination) {
		if(source != null)		
			return new Date(source * 1000L);
		return null;
	}

}
