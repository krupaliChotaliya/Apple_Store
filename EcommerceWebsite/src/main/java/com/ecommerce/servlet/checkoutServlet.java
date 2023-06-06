package com.ecommerce.servlet;

import com.ecommerce.Dao.ProductDao;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "checkoutServlet", urlPatterns = {"/checkoutServlet"})
public class checkoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String[] productname = request.getParameterValues("productname");
            String[] quantity = request.getParameterValues("quantity");

            ProductDao pdao = new ProductDao(factoryProvider.getfactory());

            for (int i = 0; i < productname.length; i++) {
                int Pquant = pdao.quantityByProductName(productname[i]);

                if (Pquant < Integer.parseInt(quantity[i])) {

                    HttpSession session = request.getSession();
                    session.setAttribute("message", "Sorry!! We have Only " + Pquant + " products are available for " + productname[i]);
                 
                    String path = request.getContextPath();
                    response.sendRedirect(path + "/jsp/checkout.jsp");
                    return;
                }

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
