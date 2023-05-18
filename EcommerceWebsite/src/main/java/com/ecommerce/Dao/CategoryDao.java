package com.ecommerce.Dao;

import com.ecommerce.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {

    private SessionFactory factory;
    int id;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public CategoryDao() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //to add category to database
    public int addCategory(Category category) {

        Session session = null;
        Transaction tx;

        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            id = (int) session.save(category);
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[addCategory]Exception occurs while adding category to databse " + e);
        } finally {
            session.close();
        }

        return id;
    }

    //get categories from database
    public List<Category> getcategories() {

        List<Category> list = null;
        Session session = null;
        Transaction tx;

        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Category");
            list = q.list();
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getcategory]Exception occurs while fetching categories from databse " + e);

        } finally {
            session.close();
        }

        return list;

    }

    //get category by catId
    public Category getCategoryById(int categoryId) {
        Category category = null;
        Session session = null;

        try {

            session = this.factory.openSession();
            category = (Category) session.get(Category.class, categoryId);

        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            session.close();

        }

        return category;

    }

    //get category by category-name
    public Category getCategoryByCategoryName(String name) {
        Session session = null;
        Category c = null;
        Transaction tx;
        int id = 0;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from Category where categoryTitle=:name");
            q.setParameter("name", name);
            c = (Category) q.uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getCategoryByCategoryName]Exception occurs while fetching category by using category name from databse  " + e);

        } finally {
            session.close();
        }
        return c;
    }
}
