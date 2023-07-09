package com.ecommerce.servlet;

import com.ecommerce.Dao.userDao;
import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "signupServlet", urlPatterns = {"/signupServlet"})
@MultipartConfig
public class signupServlet extends HttpServlet {

    private HashMap<String, String> map = new HashMap<>();
    private HashMap<String, Object> queryParams = new HashMap<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Session hibernateSession = null;
            Transaction tx = null;
            HttpSession httpsession = null;
            try {

                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userName = request.getParameter("userName");
                String userPhone = request.getParameter("userPhone");
                String userAddress = request.getParameter("userAddress");

                User user = new User(userName, userEmail, userPassword, userPhone, userAddress, "normal", "active");
                userDao udao = new userDao(factoryProvider.getfactory());

                //if user is exist (email+active)
                int rowid = (int) udao.IsUserExist(userEmail);
                //user is exist(email+inactive)
                int isexist = (int) udao.IsUserEmailIdExist(userEmail);
                if (rowid > 0) {
                    out.println("Sorry!! Email id is already exist!!");

                } else if (isexist > 0) {
                    out.println("this user is inactive please,create new account with different email Id.");

                } else {
                    int userId = udao.addUser(user);
                    String id = Integer.toString(userId);
                    if (id == null) {
                        out.println("registration failed!!");
                    } else {
                        out.println("sucsess");
                    }

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
