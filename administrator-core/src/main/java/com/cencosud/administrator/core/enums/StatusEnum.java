/**
 *@name StatusEnum.java
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
public enum StatusEnum
{
	UNBLOCKED_USER(0), 
	BLOCKED_USER(1), 
	PENDING_CONFIRMATION(2),
	UNBLOCKED_FINANCIAL(0),
	BLOCKED_FINANCIAL(1),
	ALL_FINANCIAL(2),
	UNBLOCKED_COMMERCE(0),
	BLOCKED_COMMERCE(1),
	ALL_COMMERCE(2),
	UNBLOCKED_AGREEMENT(0),
	BLOCKED_AGREEMENT(1);
	
	private final int code;

	StatusEnum(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}
}