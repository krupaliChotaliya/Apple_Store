package com.ecommerce.servlet;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet(name = "orderTest", urlPatterns = {"/orderTest"})
public class orderTest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve the form data
            String customerName = request.getParameter("customerName");
            String email = request.getParameter("email");
            int amount = Integer.parseInt(request.getParameter("amount"));
            
            // Create an instance of RazorpayClient with your API key and secret key
            RazorpayClient razorpayClient = new RazorpayClient("rzp_test_cYbIr5dlXYJiZs", "8MK9OXvbNhocOZVwsIpSguiN");
            
            
            JSONObject params = new JSONObject();
            params.put("amount", amount * 100); // Amount in paise or the smallest currency unit
            params.put("currency", "INR");
            params.put("receipt", "order_receipt");
            params.put("payment_capture", "1");
            
            try {
                // Create a new order using the Razorpay API
                Order order = razorpayClient.orders.create(params);
                
                // Retrieve the order ID
                String orderId = order.get("id").toString();
                
                
                // Set the order ID as an attribute to be accessed in the JSP
                request.setAttribute("orderId", orderId);
                
                System.out.println(orderId+"+++++++++++++++++++++++++++++++++++==");
                // Forward the request to the payment confirmation JSP
              request.getRequestDispatcher("jsp/sucess.jsp").forward(request, response);
            } catch (RazorpayException e) {
                // Handle exceptions
                e.printStackTrace();
            }
        } catch (RazorpayException ex) {
            System.out.println(ex);
        }
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
