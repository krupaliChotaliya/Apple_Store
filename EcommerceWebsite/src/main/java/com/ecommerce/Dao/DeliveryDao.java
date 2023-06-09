package com.ecommerce.Dao;

import com.ecommerce.entities.Delivery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DeliveryDao {

    private SessionFactory factory;

    public DeliveryDao(SessionFactory factory) {
        this.factory = factory;
    }

//    save delivery data to delivery table
    public void saveDelivery(Delivery d) {

        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            session.save(d);
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[saveDelivery]Exception while save delivery data into delivery table" + e);
        } finally {
            session.close();
        }

    }

}
