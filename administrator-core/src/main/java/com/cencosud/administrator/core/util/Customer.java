/**
 * @name Customer.java
 * 
 * @version 1.0
 * 
 * @date 13/11/2016
 * 
 * @author josef_000
 * 
 * @copyright administrator-dto
 * 
 */
package com.cencosud.administrator.core.util;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 * @description Customer.java
 *
 */


@XmlRootElement
public class Customer {
	
	String name;
    int age;
    int id;
    String desc;
    ArrayList<String> list;

    public ArrayList<String> getList()
    {
        return list;
    }

    @XmlElement
    public void setList(ArrayList<String> list)
    {
        this.list = list;
    }

    public String getDesc()
    {
        return desc;
    }

    @XmlElement
    public void setDesc(String desc)
    {
        this.desc = desc;
    }

    public String getName() {
        return name;
    }

    @XmlElement
    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    @XmlElement
    public void setAge(int age) {
        this.age = age;
    }

    public int getId() {
        return id;
    }

    @XmlAttribute
    public void setId(int id) {
        this.id = id;
    }

}
