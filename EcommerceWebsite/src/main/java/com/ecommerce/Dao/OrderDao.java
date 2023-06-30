package com.ecommerce.Dao;

import com.ecommerce.entities.Orders;
import java.util.Arrays;
import java.util.List;
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

    //get order by order_id
    public Orders getOrderByOrderId(String orderid) {

        Orders order = null;
        Session session = null;
        Transaction tx;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Orders where order_id =:id");
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

    public  List<Object[]> getOrderDeliveryUserData() {

        Session session = null;
        Transaction tx;
         List<Object[]> list = null;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            String q = "SELECT u.userEmail,o.order_id,o.payment_id,o.amount,o.Status,o.receipt,o.orderDate,p.pName,p.pPrice,p.pDiscount,op.quantity,d.address,d.city,d.landmark,d.phoneno,d.pincode,d.state\n"
                    + "FROM Orders as o,User as u,Delivery as d,Order_Product as op,Product as p WHERE o.user = u.userId and d.order = o.id and op.order_id = o.id and op.product_id = p.pId";
            Query query = session.createQuery(q);
            list = query.list();
        
            for (Object[] arr : list) {
                System.out.println(Arrays.toString(arr));
            }
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getOrderDeliveryUserData]Exception occurs while fetching order,user,delivery,order_product data from database" + e);

        } finally {

            session.close();
        }
          return list;
    }
  

}
