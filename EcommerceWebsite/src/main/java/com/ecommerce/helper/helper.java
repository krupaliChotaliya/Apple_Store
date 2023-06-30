package com.ecommerce.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class helper {

     //return number of products, category,users; used in admin panel to show counts
    public static Map<String, Long> getcounts(SessionFactory factory) {
         Map<String, Long> map = null ;
        Session session = null;
        try {
            session = factory.openSession();
            Transaction tx = session.beginTransaction();
            Query q1 = session.createQuery("select count(*) from Category");
            Query q2 = session.createQuery("select count(*) from Product");
            Query q3 = session.createQuery("select count(*) from User");
            Query q4 = session.createQuery("select count(*) from Orders");
            Long categoryCount = (Long) q1.list().get(0);
            Long productCount = (Long) q2.list().get(0);
            Long userCount = (Long) q3.list().get(0);
            Long orderCount = (Long) q4.list().get(0);
            tx.commit();

             map = new HashMap<String, Long>();

            map.put("productCount", productCount);
            map.put("categoryCount", categoryCount);
            map.put("userCount", userCount);
            map.put("orderCount", orderCount);

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
                System.out.println("[getcount]Exception occurs while getting total number of product,category,users from database" + e);
            }

        } finally {
            session.close();
        }
        return map;
    }
}
