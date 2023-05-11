package com.ecommerce.Dao;

import com.ecommerce.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean addProduct(Product product) {
        boolean flag = false;
        Session session = null;

        try {

            session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            flag = true;

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[addProduct]Exception occurs while adding product to databse " + e);
            flag=false;

        } finally {

            session.close();
        }

        return flag;

    }

}
