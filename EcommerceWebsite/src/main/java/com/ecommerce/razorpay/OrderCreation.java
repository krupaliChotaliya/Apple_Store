import com.razorpay.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


@WebServlet(name = "OrderCreation", urlPatterns = {"/OrderCreation"})
public class OrderCreation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the form data
            String customerName = request.getParameter("customerName");
            String email = request.getParameter("email");
            int amount = Integer.parseInt(request.getParameter("amount"));
            
            // Create an instance of RazorpayClient with your API key and secret key
            RazorpayClient razorpayClient = new RazorpayClient("rzp_test_cYbIr5dlXYJiZs", "8MK9OXvbNhocOZVwsIpSguiN");
            
            // Prepare the payment request parameters
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
              request.getRequestDispatcher("sucess.jsp").forward(request, response);
            } catch (RazorpayException e) {
                // Handle exceptions
                e.printStackTrace();
            }
        } catch (RazorpayException ex) {
            Logger.getLogger(OrderCreation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
