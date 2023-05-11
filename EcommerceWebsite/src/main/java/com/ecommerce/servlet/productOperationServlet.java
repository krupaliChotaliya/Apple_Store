package com.ecommerce.servlet;

import com.ecommerce.Dao.CategoryDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
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
import javax.servlet.http.Part;

//to store img,audio,video types data above annotation is used.
@MultipartConfig
@WebServlet(name = "productOperationServlet", urlPatterns = {"/productOperationServlet"})
public class productOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String val = request.getParameter("operation");
            //to add category into databse
            if (val.trim().equals("addcategory")) {

                String title = request.getParameter("title");
                String description = request.getParameter("description");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                //sending data to categoryDao
                CategoryDao categoryDao = new CategoryDao(factoryProvider.getfactory());
                int id = (int) categoryDao.addCategory(category);

                HttpSession session = request.getSession();
                session.setAttribute("message", "Category added Sucessfully!!");
                response.sendRedirect("admin.jsp");
                return;

            } else if (val.trim().equals("addproduct")) {

                //add product to database
                String pname = request.getParameter("pname");
                String pdescription = request.getParameter("pdescription");
                int catId = Integer.parseInt(request.getParameter("catId"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                Part part = request.getPart("pPic");

                //get category from category-table by using catId
                CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());
                Category category = catdao.getCategoryById(catId);

                Product p = new Product();

                p.setpName(pname);
                p.setpDescription(pdescription);
                p.setCategory(category);
                p.setpQuantity(pQuantity);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpPic(part.getSubmittedFileName());

                //sending data to productDao
                ProductDao pdao = new ProductDao(factoryProvider.getfactory());
                boolean flag = pdao.addProduct(p);

                if (flag) {

                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", "Product added Sucessfully!!");
                    response.sendRedirect("admin.jsp");

                }

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
