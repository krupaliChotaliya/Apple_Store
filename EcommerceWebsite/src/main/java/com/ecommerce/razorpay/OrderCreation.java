package com.ecommerce.razorpay;

import com.ecommerce.Dao.ProductDao;
import com.ecommerce.helper.factoryProvider;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.io.IOException;
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

            String name = request.getParameter("name");
            String phoneno = request.getParameter("phoneno");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String city = request.getParameter("city");
            String landmark = request.getParameter("landmark");
            String address = request.getParameter("address");

            String[] quantity = request.getParameterValues("quantity");
            String[] productname = request.getParameterValues("productname");
            String[] amount = request.getParameterValues("total");
            int total = Integer.parseInt(amount[0]);

            ProductDao pdao = new ProductDao(factoryProvider.getfactory());
              HttpSession session = request.getSession();

            for (int i = 0; i < productname.length; i++) {

                int Pquant = pdao.availableQuantityByProductName(productname[i]);
              

                //check whether product is available or out of stock
                if (Pquant < Integer.parseInt(quantity[i])) {
                    session.setAttribute("message", "Sorry!! We have Only " + Pquant + " products are available for " + productname[i]);
                    String path = request.getContextPath();
                    response.sendRedirect(path + "/jsp/checkout.jsp");
                    return;
                }
//            check whether Amount exceeds maximum amount allowed.
                if (total >= 300000) {
                    session.setAttribute("message", "Payment failed !! You've exceeded the maximum transaction amount set by your bank");
                    String path = request.getContextPath();
                    response.sendRedirect(path + "/jsp/checkout.jsp");
                    return;
                }
            }

            //creating new order on Razorpay
            RazorpayClient client = new RazorpayClient("rzp_test_cYbIr5dlXYJiZs", "8MK9OXvbNhocOZVwsIpSguiN");

            JSONObject obj = new JSONObject();
            obj.put("amount", total * 100);
            obj.put("currency", "INR");
            obj.put("receipt", "txn_123434");

            Order order = client.orders.create(obj);
            String orderId = order.get("id").toString();

            session.setAttribute("orderId", orderId);
            String[] array = {name, phoneno, state, pincode, city, landmark, address, amount[0]};
            session.setAttribute("array", array);
            session.setAttribute("quantity", quantity);
            session.setAttribute("productname", productname);

            //redirect to checkout page
            String path = request.getContextPath();
            response.sendRedirect(path + "/jsp/checkout.jsp");

        } catch (RazorpayException ex) {
            Logger.getLogger(OrderCreation.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
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
}
