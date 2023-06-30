package com.ecommerce.servlet;

import com.ecommerce.Dao.userDao;
import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "admin_UserServlet", urlPatterns = {"/users"})
public class admin_UserServlet extends HttpServlet {

    private userDao udao;

    public admin_UserServlet() {

        udao = new userDao(factoryProvider.getfactory());

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getParameter("action");

        if (path == null || path.isEmpty()) {
            path = "default";
        }

        switch (path) {

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                updateuser(id, request, response);
                break;
            case "delete":
                int did = Integer.parseInt(request.getParameter("id"));
                deleteuser(did, request, response);
                break;
            default:
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String type = request.getParameter("type");

        User user = new User();
        user.setUserName(name);
        user.setUserEmail(email);
        user.setUserAddress(address);
        user.setUserPassword(password);
        user.setUserPhone(phone);
        user.setUserType(type);
        user.setActive("active");

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            //adduser
            int result = udao.addUser(user);

            if (result > 0) {
                HttpSession session = (HttpSession) request.getSession();
                session.setAttribute("message", "user is added successfully!!");

                RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
                rd.forward(request, response);

            }

        } else {

            //update user
            int result = udao.updateUser(name, email, password, phone, address, type, "active", Integer.parseInt(id));
            if (result > 0) {
                HttpSession session = (HttpSession) request.getSession();
                session.setAttribute("message", "Your changes have been successfully saved!!");

                RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
                rd.forward(request, response);
            }
        }

    }

    public void deleteuser(int id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int result = udao.deleteUser(id);
        if (result > 0) {
            HttpSession session = (HttpSession) request.getSession();
            session.setAttribute("message", "deleted Successfully!!");
            RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
            rd.forward(request, response);
        }
    }

    public void updateuser(int id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        udao = new userDao(factoryProvider.getfactory());

        request.setAttribute("user", udao.getuserbyid(id));
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/addUser.jsp");
        rd.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
