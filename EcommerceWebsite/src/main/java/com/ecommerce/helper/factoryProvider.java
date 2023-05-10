/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.helper;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


//to check hibernate connection
public class factoryProvider {

    private static SessionFactory factory;

    public static SessionFactory getfactory() {

        try {
            if (factory == null) {
                factory = (SessionFactory) new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }

        } catch (Exception e) {
           
                e.printStackTrace();
        }
        return factory;

    }

}
