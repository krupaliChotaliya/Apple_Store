package com.ecommerce.servlet;

import com.ecommerce.Dao.userDao;
import com.ecommerce.entities.User;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.util.HashMap;
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
    private HashMap<String, String> map = new HashMap<>();
    private HashMap<String, Object> queryParams = new HashMap<>();
    
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

//        *********************add user******************
        if (id == null || id.isEmpty()) {

            //if user is exist (email+active)
            userDao udao = new userDao(factoryProvider.getfactory());
            int rowid = (int) udao.IsUserExist(email);

            if (rowid > 0) {

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Sorry!! user is already exist!!");
                response.sendRedirect("./jsp/viewUser.jsp");
                return;
            }

            //if only email id is exist
            int isexist = (int) udao.IsUserEmailIdExist(email);

            if (isexist > 0) {

                map.put("userName", name);
                map.put("userEmail", email);
                map.put("userPassword", password);
                map.put("userPhone", phone);
                map.put("userAddress", address);
                map.put("userType", type);
                map.put("active", "active");

                queryParams.put("userEmail", email);

                int result = udao.updateUser(map, queryParams);
                if (result > 0) {
                    HttpSession session = (HttpSession) request.getSession();
                    session.setAttribute("message", "Your changes have been successfully saved!!");
                    RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
                    rd.forward(request, response);

                }
            } 
            else {
                //if user is not exist then add user
                int result = udao.addUser(user);
                if (result > 0) {
                    HttpSession session = (HttpSession) request.getSession();
                    session.setAttribute("message", "user is added successfully!!");
                    RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
                    rd.forward(request, response);
                }
            }
        } 
//        *********************update user******************
        else {
            //update user

            map.put("userName", name);
            map.put("userEmail", email);
            map.put("userPassword", password);
            map.put("userPhone", phone);
            map.put("userAddress", address);
            map.put("userType", type);
            map.put("active", "active");
            
            queryParams.clear();
            queryParams.put("userId", Integer.parseInt(id));
            
            int result = udao.updateUser(map, queryParams);
            if (result > 0) {
                HttpSession session = (HttpSession) request.getSession();
                session.setAttribute("message", "Your changes have been successfully saved!!");
                RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
                rd.forward(request, response);
            }
        }

    }
    
//    delete user
    public void deleteuser(int id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int result = udao.deleteUser(id);
        if (result > 0) {
            HttpSession session = (HttpSession) request.getSession();
            session.setAttribute("message", "deleted Successfully!!");
            RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewUser.jsp");
            rd.forward(request, response);
        }
    }

//    update user
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
