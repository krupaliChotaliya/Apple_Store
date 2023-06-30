package com.ecommerce.Dao;

import com.ecommerce.entities.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class userDao {

    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }

    //add user
    public int addUser(User user) {

        Session session = null;
        Transaction tx;
        int id = 0;

        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            id = (int) session.save(user);
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[addUser]Exception occurs while adding user to user table " + e);
        } finally {
            session.close();
        }
        return id;
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
            System.out.println("[getUserByEmailAndPassword]Exception while getting the user " + e);

        } finally {
            session.close();
        }
        return user;
    }

    public List<User> getUsers() {

        List<User> user = null;
        Transaction tx;
        Session session = null;

        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("from User where active=:a");
            q.setParameter("a", "active");
            user = q.list();
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getUsers]Exception occurs while getting all the user from user table" + e);

        } finally {

            session.close();
        }

        return user;
    }

    //delete user
    public int deleteUser(int id) {
        Session session = null;
        Transaction tx;
        User user = null;
        int result = 0;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();

            String query = "update User set active = ? where userId = ?";
            Query updateQuery = session.createQuery(query);
            updateQuery.setParameter(0, "inactive");
            updateQuery.setParameter(1, id);
            result=updateQuery.executeUpdate();

            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[deleteUser]Exception while deleting the user " + e);

        } finally {
            session.close();
        }
        return result;
    }

    //update user
    public int updateUser(String name, String email, String password, String phoneno, String address, String userType, String active, int id) {
        Session session = null;
        Transaction tx;
        User user = null;
        int result = 0;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();

            String query = "update User set userName = ?,userEmail = ?,userPassword = ?,userPhone = ?,userAddress = ?,userType=?,active=? where userId = ?";
            Query updateQuery = session.createQuery(query);
            updateQuery.setParameter(0, name);
            updateQuery.setParameter(1, email);
            updateQuery.setParameter(2, password);
            updateQuery.setParameter(3, phoneno);
            updateQuery.setParameter(4, address);
            updateQuery.setParameter(5, userType);
            updateQuery.setParameter(6, active);
            updateQuery.setParameter(7, id);
            result=updateQuery.executeUpdate();

            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[updateUser]Exception while updating the user " + e);

        } finally {
            session.close();
        }
        return result;
    }

    public User getuserbyid(int id) {
        User user = null;
        Session session = null;
   
        try {

            String query = "from User where userId =:i";
            session = this.factory.openSession();
            session.beginTransaction();
            Query q = session.createQuery(query);
            q.setParameter("i", id);
         
            user = (User) q.uniqueResult();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getUserByEmailAndPassword]Exception while getting the user " + e);

        } finally {
            session.close();
        }
        return user;
       
    }
}
