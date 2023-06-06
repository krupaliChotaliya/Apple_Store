package com.ecommerce.servlet;

import com.ecommerce.Dao.OrderDao;
import com.ecommerce.Dao.Order_ProductDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Order_Product;
import com.ecommerce.entities.Orders;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "checkoutServlet", urlPatterns = {"/checkoutServlet"})
public class checkoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String[] quantity = request.getParameterValues("quantity");
            String[] productname = request.getParameterValues("productname");


            ProductDao pdao = new ProductDao(factoryProvider.getfactory());
            OrderDao orderdao = new OrderDao(factoryProvider.getfactory());
            Order_ProductDao opdao = new Order_ProductDao(factoryProvider.getfactory());
            
            
            Orders order = orderdao.getOrderByOrderId("order_LwDwO5Xtmk7H5b");

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
