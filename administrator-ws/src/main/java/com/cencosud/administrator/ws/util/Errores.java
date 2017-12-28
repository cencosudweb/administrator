/**
 * 
 */
package com.cencosud.administrator.ws.util;

/**
 * @author EA7129
 *
 */
public class Errores {
	public static final String ERROR_JOB = "001";

	// mensajes
	public static final String MENSAJE_ERROR_SERVICES = "Hubo un Error el Services:";
	public static final String MENSAJE_ERROR_DAO = "Hubo un Error en la BD:";
	public static final String MENSAJE_ERROR_INTERCEPTOR = "Hubo un Error en el Interceptor:";
	public static final String MENSAJE_ERROR_JOB = "Hubo un Error en el Job:";

	public static final String MENSAJE_CAMPO_VACIO = "Alguno de los campos obligatorios se encuentra vacío";
	public static final String MENSAJE_CONSTRAINT = "Otra instancia la guardo primero o esta duplicado el registro";

	// Excepciones
	public static final String EXCEPTION_MESSAGE = "Exception-Message:";
	public static final String EXCEPTION_LOCALIZED = "Exception-LocalizedMessage:";
	public static final String EXCEPTION_CONSTRAINT = "ConstraintViolationException";
}
