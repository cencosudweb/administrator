/**
 * 
 */
package com.cencosud.administrator.web.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.naming.Context;
import javax.naming.directory.Attribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.cencosud.administrator.core.util.UtilMIS;

/**
 * @description Clase para validacion Login Ldap
 */
public class ValidacionLoginLdap {

	private static Logger logger = Logger.getLogger(ValidacionLoginLdap.class);
	
	static final String server="ldap://localhost:389"; // servidor de LDAP
	static final String tipoAth="simple";//tipo de autentuicacion simple o por SSL
	static final String LDAP_URL = "ldap://localhost:389/dc=maxcrc,dc=com";

	
	/**
	 * Metodo que inicia sesión usando LDAP 
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return boolean  logico con la respuesta de la ejecucion de LDAP
	 */
	public static boolean ValidarloginLdap(String username, String password) {
		logger.info("Inicio: Validar login LDAP");
		
		boolean resp = false;
		
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, LDAP_URL);
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "CN=" + username.toUpperCase() + ", ou=People,dc=maxcrc,dc=com");
		env.put(Context.SECURITY_CREDENTIALS, password);

		try {
			DirContext ctx = new InitialDirContext(env);
			logger.info("Objeto DirContext:" + ctx);
			resp = true;
		} catch (Exception ex) {
		//} catch (NamingException ex) {
			logger.error("Error Login Ldap" + ex.getMessage());
			//ex.printStackTrace();
		}
		logger.info("Fin: Validar login LDAP");
		return resp;
	}
	/**
	 * Metodo que Obtiene el valor del Atributo  LDAP
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return String   Valor del Atributo Ldap
	 */
	public static String ObtenerValorAtributoLdap(String username, String password) {
		logger.info("Inicio: Obtener Valor Atributo LDAP");
		String resp = null;
	    //String dn="uid=" + usuario + ",ou=Usuarios,dc=dominio,dc=com,dc=co"; // Ruta del Arbol LDAP
	    String dn="cn=" + username + ",ou=People,dc=maxcrc,dc=com"; // Ruta del Arbol LDAP
		
		
		
        LdapAuth ldapAuth=new LdapAuth(server,dn,tipoAth,username,password);
        
        if(ldapAuth.isAutenticado()){
        	logger.info("Usuario "+ldapAuth.getUsuario()+" Autenticado Correctamente");
            
            /* obtenemos una Propiedad de la autenticacion
             *
             * Algunas Propiedades Disponibles
             * mailLocalAddress,displayName,givenName,objectClass,userPassword,sambaLogonTime,mail
             * uid,uidNumber,cn,loginShell,gidNumber,gecos,sambaSID,homeDirectory
             */
            //Attribute atr=ldapAuth.cargarPropiedadConexion("mail");
            Attribute atr=ldapAuth.cargarPropiedadConexion("telephoneNumber");
            //Attribute atr=ldapAuth.cargarPropiedadConexion("mail");
            logger.info("1. Atributo "+atr.getID());
            try {
            	logger.info("1. Valor "+atr.get().toString());
    			resp = (String) atr.get().toString();
			//} catch (NamingException e) {
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error("Error Login Info Ldap:" + e.getMessage());
				e.printStackTrace();
			}
        }
        else{
        	logger.info("Usuario "+ldapAuth.getUsuario()+" No se Puedo Autenticar");
        }
		logger.info("FIn: Obtener Valor Atributo LDAP");
        return resp;

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ValidacionLoginLdap valid = new ValidacionLoginLdap();
		String password = "alex";
		String username = "Alex";
		System.out.println("--------------1---------");
		System.out.println(	"Login : " +	valid.ValidarloginLdap(username, password));
		System.out.println("--------------1---------");

		System.out.println("--------------2---------");
		System.out.println(	"Info : " +	valid.ObtenerValorAtributoLdap(username, password));
		System.out.println("--------------2---------");
		
		System.out.println("===" + UtilMIS.getJSONStringInput(valid.ObtenerValorAtributoLdap(username, password)));
		
		System.out.println("--------------3---------");
		
		try {

			ObjectMapper mapper = new ObjectMapper();
			String json = "";

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", valid.ObtenerValorAtributoLdap(username, password));
			map.put("age", 29);

			// convert map to JSON string
			json = mapper.writeValueAsString(map);

			System.out.println(json);

			//json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);

			// pretty print
			System.out.println(json);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
