/**
 * 
 */
package com.cencosud.administrator.web.utils;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
 

/**
 * @author josef_000
 *
 */
public class LdapAuthMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws NamingException{
		/**
		 * @author josef_000
		 *
		 * “dn” es el nombre de la entrada; no es un atributo ni tampoco parte de la entrada. 
		 * “cn=John Doe” es el nombre distinguido relativo, 
		 * “dc=example,dc=com” es el nombre distinguido de la entrada del padre, donde dc indica domain component (componente de dominio). 
		 * Las otras líneas presentan los atributos en la entrada. 
		 * Los nombres de atributos son generalmente cadenas mnemotécnicas
		 * , como “cn” para common name (nombre común)
		 * , “dc” para domain component (componente de dominio)
		 * , “mail” para dirección de correo electrónico 
		 * ,“sn” para surname (apellido).
		 *
		 */

        System.out.println("Iniciando Autenticacion");
         
        String server="ldap://localhost:389"; // servidor de LDAP
        String usuario="Alex"; // Usuario de Autenticacion
        //String dn="uid=" + usuario + ",ou=Usuarios,dc=dominio,dc=com,dc=co"; // Ruta del Arbol LDAP
        String dn="cn="+usuario+",ou=People,dc=maxcrc,dc=com"; // Ruta del Arbol LDAP
        String tipoAth="simple";//tipo de autentuicacion simple o por SSL
        String clave="alex";
 
        LdapAuth ldapAuth=new LdapAuth(server,dn,tipoAth,usuario,clave);
 
        if(ldapAuth.isAutenticado()){
            System.out.println("Usuario "+ldapAuth.getUsuario()+" Autenticado Correctamente");
            
            /* obtenemos una Propiedad de la autenticacion
             *
             * Algunas Propiedades Disponibles
             * mailLocalAddress,displayName,givenName,objectClass,userPassword,sambaLogonTime,mail
             * uid,uidNumber,cn,loginShell,gidNumber,gecos,sambaSID,homeDirectory
             */
            //Attribute atr=ldapAuth.cargarPropiedadConexion("mail");
            Attribute atr=ldapAuth.cargarPropiedadConexion("telephoneNumber");
            //Attribute atr=ldapAuth.cargarPropiedadConexion("mail");

            System.out.println("1. Atributo "+atr.getID());
            System.out.println("1. Valor "+atr.get().toString());
        }
        else{
            System.out.println("Usuario "+ldapAuth.getUsuario()+" No se Puedo Autenticar");
        }
    }

}
