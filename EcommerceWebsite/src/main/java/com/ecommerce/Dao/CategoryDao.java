/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.Dao;

import com.ecommerce.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {

    private SessionFactory factory;
    int id;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
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

}
