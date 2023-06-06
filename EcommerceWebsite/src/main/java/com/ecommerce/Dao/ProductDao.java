package com.ecommerce.Dao;

import com.ecommerce.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    //to add product to database
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
            flag = false;

        } finally {

            session.close();
        }

        return flag;

    }

    //get products from database
    public List<Product> getProducts() {

        Session session = null;
        Transaction tx;
        List<Product> product = null;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Product");
            product = q.list();
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getProducts]Exception occurs while fetching products from database" + e);

        } finally {

            session.close();
        }

        return product;

    }

    //get products by using given cat id
    public List<Product> getProductsById(int cid) {
        Session session = null;
        Transaction tx = null;
        List<Product> list = null;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Product as p where p.category.categoryId =:id");
            q.setParameter("id", cid);

            list = q.list();

            tx.commit();
        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getProductsById]Exception occurs while fetching products from database by using given id" + e);

        } finally {

            session.close();
        }

        return list;
    }

    //get product by product name
    public Product getProductByname(String name) {
        
        Session session = null;
        Transaction tx;
        Product product = null;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Product where pName =:p");
            q.setParameter("p", name);
            product = (Product) q.uniqueResult();
            tx.commit();

            
        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getProductByname]Exception occurs while fetching product using product name from database" + e);

        } finally {

            session.close();
        }

        return product;

    }

}
