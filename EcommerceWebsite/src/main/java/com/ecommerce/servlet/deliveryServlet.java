package com.ecommerce.servlet;

import com.ecommerce.Dao.DeliveryDao;
import com.ecommerce.Dao.OrderDao;
import com.ecommerce.entities.Delivery;
import com.ecommerce.entities.Orders;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "deliveryServlet", urlPatterns = {"/deliveryServlet"})
public class deliveryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String phoneno = request.getParameter("phoneno");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String city = request.getParameter("city");
            String landmark = request.getParameter("landmark");
            String address = request.getParameter("address");

            Delivery d = new Delivery();
            d.setName(name);
            d.setPhoneno(phoneno);
            d.setState(state);
            d.setPincode(pincode);
            d.setCity(city);
            d.setLandmark(landmark);
            d.setAddress(address);

            HttpSession session = request.getSession();
            String orderId = (String) session.getAttribute("orderId");

            OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
            Orders order = orderdao.getOrderByOrderId("order_Lxl1ftrxT5e5J5");

            d.setOrder(order);

            //sending delivery data to deliveryDao
            DeliveryDao deliverydao = new DeliveryDao(factoryProvider.getfactory());
            deliverydao.saveDelivery(d);

            session.setAttribute("deliveryStatus", "done");
            
            session.setAttribute("message", "Your Shipping details are saved Successfully!!");
            
         
            String path = request.getContextPath();
            response.sendRedirect(path + "/jsp/checkout.jsp");

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
