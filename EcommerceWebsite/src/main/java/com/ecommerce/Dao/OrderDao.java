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

    //update payment status in Orders table
    public int updateOrder(String payment_id, String order_id, String status) {

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

    //get order by order_id
    public Orders getOrderByOrderId(String orderid) {

        Orders order = null;
        Session session = null;
        Transaction tx;
   
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Orders where order_id=:id");
            q.setParameter("id", orderid);
            order = (Orders) q.uniqueResult();
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getProductByname]Exception occurs while fetching order using order id from database" + e);

        } finally {

            session.close();
        }

        return order;

    }

    
}
