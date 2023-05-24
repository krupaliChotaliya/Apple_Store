
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
