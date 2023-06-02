package com.ecommerce.Dao;

import com.ecommerce.entities.Orders;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class OrderDao {

    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }

    //add order on server
    public void addOrder(Orders order) {

        Session session = null;
        Transaction tx;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            session.save(order);
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
                System.out.println("[addOrder]Exception occurs while adding order into orders table" + e);
            }

        } finally {

            session.close();

        }

    }

    //add payment details on server
    public int updateOrder(String payment_id, String order_id, String status) {

        System.out.println(payment_id+"+++++++++++++++++++++++++++");
        
        int result = 0;
        Session session = null;
        Transaction tx;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("update Orders set payment_id=:p,Status=:s where order_id=:id");
            q.setParameter("p", payment_id);
            q.setParameter("s", status);
            q.setParameter("id", order_id);
            result = q.executeUpdate();

            System.out.println(result+"++++++++");
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
                System.out.println("[updateOrder]Exception occurs while updating order into orders table" + e);
            }

        } finally {

            session.close();

        }

        return result;

    }

}
