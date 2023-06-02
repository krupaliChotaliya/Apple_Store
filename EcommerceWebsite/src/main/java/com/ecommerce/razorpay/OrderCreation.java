package com.ecommerce.razorpay;

import com.ecommerce.Dao.OrderDao;
import com.ecommerce.entities.Orders;
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

            int amount = Integer.parseInt(request.getParameter("amount"));
            RazorpayClient client = new RazorpayClient("rzp_test_cYbIr5dlXYJiZs", "8MK9OXvbNhocOZVwsIpSguiN");
            JSONObject obj = new JSONObject();
            obj.put("amount", amount * 100);
            obj.put("currency", "INR");
            obj.put("receipt", "txn_123434");

            //creating new order on Razorpay
            Order order = client.orders.create(obj);

            String orderId = order.get("id").toString();
//            System.out.println(order);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current-user");

            String orderAmount = Integer.toString(amount);

            //save order to database
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

            //set session to check whether order is created or not
            session.setAttribute("orderId", orderId);

            String path = request.getContextPath();
            response.sendRedirect(path + "/jsp/test2.jsp");
//            RequestDispatcher rd=request.getRequestDispatcher("jsp/test2.jsp");  
//            rd.forward(request, response);

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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
