package com.ecommerce.razorpay;

import com.ecommerce.Dao.OrderDao;
import com.ecommerce.Dao.Order_ProductDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Order_Product;
import com.ecommerce.entities.Orders;
import com.ecommerce.entities.Product;
import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet(name = "OrderCreation", urlPatterns = {"/OrderCreation"})
public class OrderCreation extends HttpServlet {

    private String secret;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String[] quantity = request.getParameterValues("quantity");
            String[] productname = request.getParameterValues("productname");
            String[] amount = request.getParameterValues("total");

            int total= Integer.parseInt(amount[0]);
            RazorpayClient client = new RazorpayClient("rzp_test_cYbIr5dlXYJiZs", "8MK9OXvbNhocOZVwsIpSguiN");
            JSONObject obj = new JSONObject();
            obj.put("amount", total * 100);
            obj.put("currency", "INR");
            obj.put("receipt", "txn_123434");

            //creating new order on Razorpay
            Order order = client.orders.create(obj);
            String orderId = order.get("id").toString();

           
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-user");

            String orderAmount = Integer.toString(total);
          
            //save order to Orders table
            saveOrder(orderId,orderAmount,user);
            //save ordered products to Order_Product table
            saveOrderedProducts(quantity,productname,orderId);
            
            
            //set session to check whether order is created or not
            session.setAttribute("orderId", orderId);

            String path = request.getContextPath();
            response.sendRedirect(path + "/jsp/test2.jsp");


        } catch (RazorpayException ex) {
            Logger.getLogger(OrderCreation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

    
     //save order to Orders table
    public void saveOrder(String orderId,String orderAmount,User user){
    
            Orders myorder = new Orders();
            myorder.setOrder_id(orderId);
            myorder.setReceipt("txn_123434");
            myorder.setAmount(orderAmount);
            myorder.setStatus("pending");
            myorder.setUser(user);
            myorder.setPayment_id(null);
            myorder.setOrderDate(new Date());
            
            OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
            orderdao.addOrder(myorder);

    }
    
    //save ordered products to Order_Product table
    public void saveOrderedProducts(String[] quantity,String[] productname,String orderId ){
     
            ProductDao pdao = new ProductDao(factoryProvider.getfactory());
            OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
            Orders order = orderdao.getOrderByOrderId(orderId);
            
            Order_ProductDao opdao = new Order_ProductDao(factoryProvider.getfactory());
            Order_Product orderproduct = new Order_Product();
              
            for (int i = 0; i < productname.length; i++) {
              
                int qunat = Integer.parseInt(quantity[i]);
                Product product = (Product) pdao.getProductByname(productname[i]);

                orderproduct.setOrder_id(order);
                orderproduct.setProduct_id(product);
                orderproduct.setQuantity(qunat);
                                        
                opdao.addorderedProduct(orderproduct);
            }     
    }
}
