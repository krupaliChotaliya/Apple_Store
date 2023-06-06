package com.ecommerce.Dao;

import com.ecommerce.entities.Order_Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Order_ProductDao {

    private SessionFactory factory;

    public Order_ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    //to add ordered product into database
    public void addorderedProduct(Order_Product op) {

        Session session = null;
        Transaction tx;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            session.save(op);
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
                System.out.println("[addorderedProducts]Exception occurs while adding ordered Product into Order_Product table" + e);
            }

        } finally {

            session.close();

        }

    }

}
