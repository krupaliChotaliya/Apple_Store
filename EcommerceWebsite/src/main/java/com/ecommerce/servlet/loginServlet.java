
package com.ecommerce.servlet;

import com.ecommerce.Dao.userDao;
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
import javax.servlet.http.HttpSession;

@MultipartConfig
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                //sending data to userDao.
                userDao userdao = new userDao(factoryProvider.getfactory());
                User user = userdao.getUserByEmailAndPassword(email, password);
                
               
                if (user == null) {
                    out.println("notexist");

                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("current-user", user);
                    if (user.getUserType().equals("normal")) {
                        out.println("normal");
                        
                    }
                    if (user.getUserType().equals("admin")) {
                          out.println("admin");
                          
                    }
               
                }

            } catch (Exception e) {
                e.printStackTrace();
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
    }// </editor-fold>

}
