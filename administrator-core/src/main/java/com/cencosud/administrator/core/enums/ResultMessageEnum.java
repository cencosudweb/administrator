/**
 *@name ResultMessageEnum.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.enums;

/**
 * @description 
 */
public enum ResultMessageEnum {
	
	SUCCESS(1), 
	ERROR(2), 
	WARNING(3);

	private final int code;

	ResultMessageEnum(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

}
