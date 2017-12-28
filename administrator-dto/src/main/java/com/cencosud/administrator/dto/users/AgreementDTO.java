/**
 *@name AgreementDTO.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase AgreementDTO para la transferencia de datos
 */
public class AgreementDTO implements Serializable {
	
	private static final long serialVersionUID = -262289197062914696L;

	private Long id;
	private String agreementId;
	private Long ifId;
	private Long commerceId;
	private Date initDate;
	private Date endDate;
	private String initDateText;
	private String endDateText;
	private TimeLimitDTO timeLimit;
	private int status;
	private List<UrlCallbackDTO> urls;
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


	public Long getId() {
		return id;
	}


	public String getAgreementId() {
		return agreementId;
	}


	public Date getInitDate() {
		return initDate;
	}


	public Date getEndDate() {
		return endDate;
	}

	public String getInitDateFormat() {
		DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
		return df1.format(initDate);
	}

	public String getEndDateFormat() {
		DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
		return df1.format(endDate);
	}

	public TimeLimitDTO getTimeLimit() {
		return timeLimit;
	}


	public List<UrlCallbackDTO> getUrls() {
		return urls;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setAgreementId(String agreementId) {
		this.agreementId = agreementId;
	}


	public void setInitDate(Date initDate) {
		this.initDate = initDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public void setTimeLimit(TimeLimitDTO timeLimit) {
		this.timeLimit = timeLimit;
	}


	public void setUrls(List<UrlCallbackDTO> urls) {
		this.urls = urls;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getStatus() {
		return status;
	}

	public void setInitDateText(String initDateText) {
		this.initDateText = initDateText;
	}


	public String getInitDateText() {
		return initDateText;
	}


	public void setEndDateText(String endDateText) {
		this.endDateText = endDateText;
	}


	public String getEndDateText() {
		return endDateText;
	}


	public void setCommerceId(Long commerceId) {
		this.commerceId = commerceId;
	}


	public Long getCommerceId() {
		return commerceId;
	}


	public void setIfId(Long ifId) {
		this.ifId = ifId;
	}


	public Long getIfId() {
		return ifId;
	}


}
