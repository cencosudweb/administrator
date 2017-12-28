/**
 * 
 */
package com.cencosud.administrator.web.utils;

/**
 * @author ea7129
 *
 */
public class Employee {
	
	private String name;
    private String surname;
    private String email;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    @Override
    public String toString() {
        return "Employee [name=" + name + ", surname=" + surname + ", email=" + email + "]";
    }
    public Employee(String name, String surname, String email) {
        super();
        this.name = name;
        this.surname = surname;
        this.email = email;
    }

}
