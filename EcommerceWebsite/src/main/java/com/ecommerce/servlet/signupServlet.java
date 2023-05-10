/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.servlet;

import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "signupServlet", urlPatterns = {"/signupServlet"})
@MultipartConfig
public class signupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Session hibernateSession = null;
            Transaction tx = null;
            try {

                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userName = request.getParameter("userName");
                String userPhone = request.getParameter("userPhone");
//                String userPic=request.getParameter("userPic");
                String userAddress = request.getParameter("userAddress");

                if (userEmail.isEmpty()) {
                    out.println("Please enter Email First!!");
                    return;
                }

                User user = new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress, "normal");

                //to add user to database
                hibernateSession = factoryProvider.getfactory().openSession();
                tx = hibernateSession.beginTransaction();
                int userId = (int) hibernateSession.save(user);
                tx.commit();

                String id = Integer.toString(userId);
                if (id == null) {
                    out.println("error");
                } else {

                    out.println("done");
                }

            } catch (Exception e) {
                if (hibernateSession.getTransaction() != null) {
                    hibernateSession.getTransaction().rollback();
                    System.out.println("[signupServlet]Exception while adding a user" + e);
                }

                e.printStackTrace();
            } finally {
                hibernateSession.close();
            }
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
