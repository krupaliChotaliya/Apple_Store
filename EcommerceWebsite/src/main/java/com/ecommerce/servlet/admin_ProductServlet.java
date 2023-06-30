package com.ecommerce.servlet;

import com.ecommerce.Dao.CategoryDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//to store img,audio,video types data above annotation is used.
@MultipartConfig(location = "E:\\krupali\\Sem5Project\\Apple_Store\\EcommerceWebsite\\src\\main\\webapp\\img\\products")
@WebServlet(name = "admin_ProductServlet", urlPatterns = {"/products"})
public class admin_ProductServlet extends HttpServlet {

    private ProductDao pdao;

    public admin_ProductServlet() {

        pdao = new ProductDao(factoryProvider.getfactory());
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
                updateProduct(id, request, response);
                break;
            case "delete":
                int did = Integer.parseInt(request.getParameter("id"));
                deleteProduct(did, request, response);
                break;
            default:
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pname = request.getParameter("pname");
        System.out.println(pname);
        String pdescription = request.getParameter("pdescription");

        int catId = Integer.parseInt(request.getParameter("catId"));

        int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
        int pPrice = Integer.parseInt(request.getParameter("pPrice"));
        int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
        String pid = request.getParameter("id");

        if (pid == null || pid.isEmpty()) {

            //add product to database
            ProductDao pdao = new ProductDao(factoryProvider.getfactory());
            long id = pdao.IsProductExist(pname);

            if (id > 0) {

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Sorry!! Product is already exist!!");
                response.sendRedirect("./jsp/viewProduct.jsp");

            } else {

                //add
                //get category from category-table by using catId
                CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());
                Category category = catdao.getCategoryById(catId);

                Product p = new Product();
                p.setpName(pname);
                p.setpDescription(pdescription);
                p.setCategory(category);
                p.setpQuantity(pQuantity);
                p.setAvailable_quantity(pQuantity);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpPic(pname + "_0.jpg");
                String picsname = pname + "_1.jpg," + pname + "_2.jpg," + pname + "_3.jpg";
                p.setpOhterPics(picsname);

                //add product
                boolean productResult = pdao.addProduct(p);
                //uploading pictures into folder
                Collection<Part> parts = request.getParts();
                int i = 0;
                for (Part part : parts) {
                    if ("pPic".equals(part.getName()) || "pOtherPics".equals(part.getName())) {
                        part.write(pname + "_" + i + ".jpg");
                        i++;
                    }
                }

                if (productResult) {
                    HttpSession session = (HttpSession) request.getSession();
                    session.setAttribute("message", "Product is added successfully!!");

                    RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
                    rd.forward(request, response);

                }
            }
        } else {

            //update
            //get category from category-table by using catId
            CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());
            Category category = catdao.getCategoryById(catId);

            System.out.println(pname+"----");
            
            String mainPic = pname + "_0.jpg";

            String otherpics = pname + "_1.jpg," + pname + "_2.jpg," + pname + "_3.jpg";

            int result = pdao.updateProduct(pdescription, mainPic, pPrice,
                    pDiscount, pQuantity, pQuantity,
                    otherpics, category, Integer.parseInt(pid));

            //uploading pictures into folder
            Collection<Part> parts = request.getParts();
            int i = 0;
            for (Part part : parts) {
                if ("pPic".equals(part.getName()) || "pOtherPics".equals(part.getName())) {
                     part.write(pname + "_" + i + ".jpg");
                    i++;
                }
            }

            if (result > 0) {
                HttpSession session = (HttpSession) request.getSession();
                session.setAttribute("message", "Your changes have been successfully saved!!");

                RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
                rd.forward(request, response);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void updateProduct(int id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("product", pdao.getProductByPid(id));
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/addProduct.jsp");
        rd.forward(request, response);

    }

    private void deleteProduct(int did, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("delete.....");
        int result = pdao.deleteProduct(did);
        if (result > 0) {
            HttpSession session = (HttpSession) request.getSession();
            session.setAttribute("message", "deleted Successfully!!");
            RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
            rd.forward(request, response);
        }
    }

}
