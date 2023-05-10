package com.ecommerce.Dao;

import com.ecommerce.entities.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class userDao {

    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        Session session = null;
        User user = null;
        try {

            String query = "from User where userEmail = :e and userPassword = :p";
            session = this.factory.openSession();
            session.beginTransaction();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getUserByEmailAndPassword]Exception while getting the user "+ e);
          
        } finally {
            session.close();
        }
        return user;
    }

}
