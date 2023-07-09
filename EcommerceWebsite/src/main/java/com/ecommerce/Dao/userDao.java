package com.ecommerce.Dao;

import com.ecommerce.entities.User;
import java.util.HashMap;
import java.util.Iterator;
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

            String query = "from User where userEmail = :e and userPassword = :p and active =:a";
            session = this.factory.openSession();
            session.beginTransaction();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            q.setParameter("a", "active");
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
            result = updateQuery.executeUpdate();

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

    //update user by using either userID or emailId
    public int updateUser(HashMap<String, String> updatedValues, HashMap<String, ?> queryParams) {
        Session session = null;
        Transaction tx;
        User user = null;
        int result = 0;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();

            Iterator<String> keyIterator = updatedValues.keySet().iterator();
            Iterator<String> keyIterator2 = queryParams.keySet().iterator();
            StringBuilder queryBuilder = new StringBuilder();

            String queryParamKey = "";

            queryBuilder.append("update User set ");
            while (keyIterator.hasNext()) {
                queryBuilder.append(keyIterator.next() + " = ?");
                if (keyIterator.hasNext()) {
                    queryBuilder.append(",");
                } else {
                    if (keyIterator2.hasNext()) {
                        queryParamKey = keyIterator2.next();
                        queryBuilder.append("where " + queryParamKey + " = ?");
                    }
                }
            }
            String query = queryBuilder.toString();
            Query updateQuery = session.createQuery(query);

            Iterator<String> valueIterator = updatedValues.values().iterator();

            int index = 0;
            while (valueIterator.hasNext()) {
                updateQuery.setParameter(index, valueIterator.next());
                index++;
            }
            updateQuery.setParameter(index, queryParams.get(queryParamKey));

//            System.out.println("Update Query: " + updateQuery.getQueryString());
            result = updateQuery.executeUpdate();
//            System.out.println("result: " + result);
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            System.out.println("[updateUser]Exception while updating the user " + e);
            return result;

        } finally {
            session.close();
        }
        return result;
    }

    //get user by id
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

    //check whether email_id and user both are exist (email+active)
    public long IsUserExist(String email) {

        long id = 0;
        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("select count(*) from User where userEmail=:id and active=:a");
            q.setParameter("id", email);   
            q.setParameter("a", "active");   
            id = (long) q.uniqueResult();

            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            System.out.println("[IsUserExist]Exception occurs while checking whether user(email+active) is already exits or not " + e);
        } finally {
            session.close();
        }
        return id;
    }

    //check whether only email_id is exist (email+Inactive)
    public long IsUserEmailIdExist(String email) {
        long id = 0;
        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("select count(*) from User where userEmail=:id and active=:a");
            q.setParameter("id", email);
            q.setParameter("a", "inactive");
            id = (long) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[IsUserEmailIdExist]Exception occurs while checking whether only user email_id is exits or not " + e);
            return id;
        } finally {
            session.close();
        }
        return id;
    }
}
