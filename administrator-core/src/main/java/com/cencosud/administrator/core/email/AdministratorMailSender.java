/**
 *@name AdministratorMailSender.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.email;

import java.util.Map;
import java.util.concurrent.Future;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Clase controladora para envio de email
 */

@Service
public class AdministratorMailSender {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngine velocityEngine;

	@Autowired
	private MailConf createUserMailConf;

	@Autowired
	private MailConf resetPasswordMailConf;
	
	private static Logger log = Logger.getLogger(AdministratorMailSender.class);

	@Async
	public void sendPassword(final Map<String, Object> model) {
		OperationResult result = new OperationResult();
		try {
			log.info("inicio:sendPassword");
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
					message.setTo((String) model.get("to"));
					message.setFrom(createUserMailConf.getFrom());
					message.setSubject(createUserMailConf.getSubject());
					
					model.put("phone", createUserMailConf.getPhone());

					String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
							createUserMailConf.getTemplate(), model);
					message.setText(text, true);
				}
			};
			mailSender.send(preparator);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Estado de la institucion financiera actualizado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar estado de la institucion financiera");
		}
		log.info("fin:sendPassword");
		//return result;
		

	}

	@Async
	public Future<OperationResult> sendPasswordAsync(final Map<String, Object> model) {
		System.out.println("The currentThreadName is :"+Thread.currentThread().getName());
		
		System.out.println("inicio:sendPasswordAsync");
		//OperationResult result = sendPassword(model);
		System.out.println("fin:sendPasswordAsync");
		
		
		return new AsyncResult<OperationResult>(new OperationResult());
	}

	
	@Async
	public void sendResetPassword(final Map<String, Object> model) {

		log.info("inicio:sendResetPassword");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo((String) model.get("to"));
				message.setFrom(resetPasswordMailConf.getFrom());
				message.setSubject(resetPasswordMailConf.getSubject());
				
				model.put("phone", resetPasswordMailConf.getPhone());

				String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
						resetPasswordMailConf.getTemplate(), model);
				message.setText(text, true);
			}
		};
		mailSender.send(preparator);
		log.info("fin:sendResetPassword");

	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public VelocityEngine getVelocityEngine() {
		return velocityEngine;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public MailConf getCreateUserMailConf() {
		return createUserMailConf;
	}

	public void setCreateUserMailConf(MailConf createUserMailConf) {
		this.createUserMailConf = createUserMailConf;
	}

}
