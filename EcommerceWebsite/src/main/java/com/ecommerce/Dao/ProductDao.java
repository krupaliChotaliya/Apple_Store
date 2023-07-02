package com.ecommerce.Dao;

import com.ecommerce.entities.Product;
import com.ecommerce.entities.User;
import java.util.HashMap;
import java.util.Iterator;
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
            Query q = session.createQuery("from Product where active = ?");
            q.setParameter(0, 1);
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

    //to get  available_quantity by product name
    public int availableQuantityByProductName(String name) {
        Session session = null;
        int quantity = 0;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("select available_quantity from Product where pName=:p");
            q.setParameter("p", name);
            quantity = (int) q.uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            System.out.println("[quantityByProductName]Exception occurs while fetching qunatity by Product name" + e);
        } finally {
            session.close();
        }
        return quantity;
    }

    //update available qunatity using productname
    public void updateAvailableQuanity(String productname, int quantity) {

        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();

            String query = "update Product set available_quantity = ? where pName = ?";
            Query updateQuery = session.createQuery(query);
            updateQuery.setParameter(0, quantity);
            updateQuery.setParameter(1, productname);
            updateQuery.executeUpdate();

            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[updateAvailableQuanity]Exception occurs while updating AvailableQuanity using product_name in database" + e);

        } finally {

            session.close();
        }
    }

    //get category name by product name
    public String getCategoryNameByProductName(String pname) {

        String name = null;
        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();

            String query = "SELECT categoryTitle FROM Category where categoryId IN( SELECT category from Product WHERE pName=?)";
            Query q = session.createQuery(query);
            q.setParameter(0, pname);
            name = (String) q.uniqueResult();
            tx.commit();

        } catch (Exception e) {

            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getCategoryNameByProductName]Exception occurs while getting categoryname using product_name in database" + e);

        } finally {

            session.close();
        }

        return name;
    }

    //check whether product is exist or not (pname+active)
    public long IsProductExist(String pname) {

        long id = 0;
        Session session = null;
        Transaction tx;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("select count(*) from Product where pName=:p and active=:a");
            q.setParameter("p", pname);
            q.setParameter("a", 1);
            id = (long) q.uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            System.out.println("[IsProductExist]Exception occurs while checking whether product is already exits or not " + e);
        } finally {
            session.close();
        }

        return id;

    }

    //check whether only productname is exist or not (pname+Inactive)
    public long IsOnlyProductNameExist(String pname) {
        long result = 0;
        Session session = null;
        Transaction tx;       
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();
            Query q = session.createQuery("select count(*) from Product where pName =:p");
            q.setParameter("p", pname);
            result = (long) q.uniqueResult();
          
            tx.commit();
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[IsOnlyProductNameExist]Exception occurs while checking whether only product name is exits or not " + e);
            return result;
        } finally {
            session.close();
        }
        return result;
    }

    //update product
    public int updateProduct(HashMap<String, ?> updatedValues, HashMap<String, ?> queryParams) {
        int result = 0;
        Session session = null;
        Transaction tx;
        Product product;
        try {
            session = this.factory.openSession();
            tx = session.beginTransaction();

            Iterator<String> keyIterator = updatedValues.keySet().iterator();
            Iterator<String> keyIterator2 = queryParams.keySet().iterator();
            StringBuilder queryBuilder = new StringBuilder();
            String queryParamKey = "";
            queryBuilder.append("update Product set ");
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
            System.out.println(updateQuery+"----");

            Iterator<Object> valueIterator = (Iterator<Object>) updatedValues.values().iterator();

            int index = 0;
            while (valueIterator.hasNext()) {
                updateQuery.setParameter(index, valueIterator.next());
                index++;
            }
            updateQuery.setParameter(index, queryParams.get(queryParamKey));

            System.out.println("Update Query: " + updateQuery.getQueryString());
            result = updateQuery.executeUpdate();
            System.out.println("result: " + result);
            tx.commit();

         } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            System.out.println("[updateProduct]Exception while updating the product " + e);
            return result;

        } finally {
            session.close();
        }
        return result;
    }

    //delete product
    public int deleteProduct(int id) {
        Session session = null;
        Transaction tx;
        User user = null;
        int result = 0;
        try {

            session = this.factory.openSession();
            tx = session.beginTransaction();

            String query = "update Product set active = ? where pId = ?";
            Query updateQuery = session.createQuery(query);
            updateQuery.setParameter(0, 0);
            updateQuery.setParameter(1, id);
            result = updateQuery.executeUpdate();

            tx.commit();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[deleteProduct]Exception while deleting the product " + e);

        } finally {
            session.close();
        }
        return result;

    }

    //get product by product id
    public Product getProductByPid(int id) {

        Product product = null;
        Session session = null;

        try {

            String query = "from Product where pId =:i";
            session = this.factory.openSession();
            session.beginTransaction();
            Query q = session.createQuery(query);
            q.setParameter("i", id);

            product = (Product) q.uniqueResult();

        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            System.out.println("[getProductByPid]Exception while getting the product using pid " + e);

        } finally {
            session.close();
        }
        return product;

    }

    //calculate total amount including discount
    public int caltotalamount(int discount, int price, int quantity) {
        int result = 0;

        int disc = (int) ((price * discount) / 100.00);
        int p = price - disc;
        result = p * quantity;

        return result;
    }

}
