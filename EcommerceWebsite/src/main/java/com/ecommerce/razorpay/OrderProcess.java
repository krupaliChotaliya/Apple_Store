package com.ecommerce.razorpay;

import com.ecommerce.Dao.DeliveryDao;
import com.ecommerce.Dao.OrderDao;
import com.ecommerce.Dao.Order_ProductDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Delivery;
import com.ecommerce.entities.Order_Product;
import com.ecommerce.entities.Orders;
import com.ecommerce.entities.Product;
import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet(name = "OrderProcess", urlPatterns = {"/OrderProcess"})
public class OrderProcess extends HttpServlet {

    //saving data to tables after successfully completion of payment
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StringBuilder requestBody = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }
        reader.close();

        JSONObject obj = new JSONObject(requestBody.toString());
        String pid = (String) obj.get("payment_id");
        String oid = (String) obj.get("order_id");
        String status = (String) obj.get("status");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current-user");
        String[] array = (String[]) session.getAttribute("array");
        String[] quantity = (String[]) session.getAttribute("quantity");
        String[] productname = (String[]) session.getAttribute("productname");

        //sending  order to Ordersdao
        saveOrder(array, user, oid, pid);
        //sending ordered_products to Order_Productdao
        saveOrderedProducts(quantity, productname, oid);
        //sending delivery to deliverydao
        savedelivery(array, oid);
        //sending data to productDao to update available quantity
        updateAvailableQuanity(quantity, productname);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    //sending  order to Ordersdao
    public void saveOrder(String[] array, User user, String oid, String pid) {

        Orders myorder = new Orders();
        myorder.setOrder_id(oid);
        myorder.setReceipt("txn_123434");
        myorder.setAmount(array[7]);
        myorder.setStatus("paid");
        myorder.setUser(user);
        myorder.setPayment_id(pid);
        myorder.setOrderDate(new Date());

        OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
        orderdao.addOrder(myorder);

    }

    //sending ordered_products to Order_Productdao
    public void saveOrderedProducts(String[] quantity, String[] productname, String oid) {

        ProductDao pdao = new ProductDao(factoryProvider.getfactory());

        Order_ProductDao opdao = new Order_ProductDao(factoryProvider.getfactory());
        Order_Product orderproduct = new Order_Product();
        OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
        Orders order = orderdao.getOrderByOrderId(oid);

        for (int i = 0; i < productname.length; i++) {

            int qunat = Integer.parseInt(quantity[i]);
            Product product = (Product) pdao.getProductByname(productname[i]);

            orderproduct.setOrder_id(order);
            orderproduct.setProduct_id(product);
            orderproduct.setQuantity(qunat);

            opdao.addorderedProduct(orderproduct);
        }
    }

    //sending delivery to deliverydao
    public void savedelivery(String[] array, String oid) {

        OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
        Orders order = orderdao.getOrderByOrderId(oid);

        Delivery d = new Delivery();
        d.setName(array[0]);
        d.setPhoneno(array[1]);
        d.setState(array[2]);
        d.setPincode(array[3]);
        d.setCity(array[4]);
        d.setLandmark(array[5]);
        d.setAddress(array[6]);
        d.setOrder(order);

        DeliveryDao deliverydao = new DeliveryDao(factoryProvider.getfactory());
        deliverydao.addDelivery(d);

    }

    //sending data to productDao to update available quantity
    public void updateAvailableQuanity(String[] quantity, String[] productname) {

        ProductDao pdao = new ProductDao(factoryProvider.getfactory());
        for (int i = 0; i < productname.length; i++) {
            
           int qunat= Integer.parseInt(quantity[i]);
            pdao.updateAvailableQuanity(productname[i],qunat );
        }
    }
}
