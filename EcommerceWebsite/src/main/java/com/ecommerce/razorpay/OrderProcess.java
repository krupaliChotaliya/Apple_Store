package com.ecommerce.razorpay;

import com.ecommerce.Dao.OrderDao;
import com.ecommerce.helper.factoryProvider;
import java.io.BufferedReader;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet(name = "OrderProcess", urlPatterns = {"/OrderProcess"})
public class OrderProcess extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //update Orders table
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

        OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
        int result = orderdao.updateOrder(pid, oid, status);

        if (result > 0) {
            out.println("success");
        } else {
            out.println("failed");
        }
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

}
