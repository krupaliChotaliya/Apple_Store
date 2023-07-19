package com.ecommerce.servlet;

import com.ecommerce.Dao.CategoryDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
//../img/products/
//to store img,audio,video types data above annotation is used.
@MultipartConfig(location = "../../../webapp/img/products")
@WebServlet(name = "admin_ProductServlet", urlPatterns = {"/products"})
public class admin_ProductServlet extends HttpServlet {

    private ProductDao pdao;
    private HashMap<String, Object> map = new HashMap<>();
    private HashMap<String, Object> queryParams = new HashMap<>();
    private Collection<Part> parts;
    private CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());

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
//         System.out.println(request.getParameter("pname"));
        String pdescription = request.getParameter("pdescription");
//         System.out.println(request.getParameter("catId"));
        int catId = Integer.parseInt(request.getParameter("catId"));
       
        int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
        int pPrice = Integer.parseInt(request.getParameter("pPrice"));
        int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
        String pid = request.getParameter("id");

        /*if pid is null it means there is no product having this id so add product.
        if pid is not null it means update product :
        1.product is active. it means product is already exist.
        2.product is no active.it means product has been deleted.if admin again tryy to add same product which has been deleted so it will update product from inactive to active.
        3.update product
        4.delete product        .      
        */
        if (pid == null || pid.isEmpty()) {

            //if product is exist (pname+active)
            long id = pdao.IsProductExist(pname);
            if (id > 0) {

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Sorry!! Product is already exist!!");
                response.sendRedirect("./jsp/viewProduct.jsp");
                return;
            }

            //if only product name is exist (pname+Inactive)              
            int isexist = (int) pdao.IsOnlyProductNameExist(pname);
            if (isexist > 0) {
                Category category = catdao.getCategoryById(catId);
                String otherpics = pname + "_1.jpg," + pname + "_2.jpg," + pname + "_3.jpg";

                map.put("pName", pname);
                map.put("pDescription", pdescription);
                map.put("pPic", pname + "_0.jpg");
                map.put("pPrice", pPrice);
                map.put("pDiscount", pDiscount);
                map.put("pQuantity", pQuantity);
                map.put("available_quantity", pQuantity);
                map.put("pOhterPics", otherpics);
                map.put("active", 1);
                map.put("category", category);

                queryParams.put("pName", pname);
                int result = pdao.updateProduct(map, queryParams);

                //uploading pictures into folder
                try {

                    Collection<Part> parts = request.getParts();
                    parts = request.getParts();
                    int i = 0;
                    for (Part part : parts) {
                        if ("pPic".equals(part.getName()) || "pOtherPics".equals(part.getName())) {

                            part.write(pname + "_" + i + ".jpg");
                            i++;
                        }
                    }

                } catch (Exception e) {

                    System.out.println("Cannot write uploaded file to disk!" + e);
                    if (result > 0) {
                        HttpSession session = (HttpSession) request.getSession();
                        session.setAttribute("message", "Cannot write uploaded file to disk!");

                        RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
                if (result > 0) {
                    HttpSession session = (HttpSession) request.getSession();
                    session.setAttribute("message", "Your changes have been successfully saved!!");

                    RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
                    rd.forward(request, response);
                }
            } else {

                Category category = catdao.getCategoryById(catId);
                //add product
                Product p = new Product();
                p.setpName(pname);
                p.setpDescription(pdescription);
                p.setCategory(category);
                p.setpQuantity(pQuantity);
                p.setAvailable_quantity(pQuantity);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpPic(pname + "_0.jpg");
                String otherpics = pname + "_1.jpg," + pname + "_2.jpg," + pname + "_3.jpg";
                p.setpOhterPics(otherpics);
                p.setActive(1);

                boolean productResult = pdao.addProduct(p);
                //uploading pictures into folder
                parts = request.getParts();
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

            //update+active
            Category category = catdao.getCategoryById(catId);
            String mainPic = pname + "_0.jpg";
            String otherpics = pname + "_1.jpg," + pname + "_2.jpg," + pname + "_3.jpg";
            map.put("pDescription", pdescription);
            map.put("pPic", pname + "_0.jpg");
            map.put("pPrice", pPrice);
            map.put("pDiscount", pDiscount);
            map.put("pQuantity", pQuantity);
            map.put("available_quantity", pQuantity);
            map.put("pOhterPics", otherpics);
            map.put("category", category);

            queryParams.clear();
            queryParams.put("pId", Integer.parseInt(pid));

            int result = pdao.updateProduct(map, queryParams);

            try {
                //uploading pictures into folder
                Collection<Part> parts = request.getParts();
                parts = request.getParts();
                int i = 0;
                for (Part part : parts) {
                    if ("pPic".equals(part.getName()) || "pOtherPics".equals(part.getName())) {

                        part.write(pname + "_" + i + ".jpg");
                        i++;
                    }
                }

            } catch (Exception e) {

                System.out.println("Cannot write uploaded file to disk!" + e);
                if (result > 0) {
                    HttpSession session = (HttpSession) request.getSession();
                    session.setAttribute("message", "Cannot write uploaded file to disk!");

                    RequestDispatcher rd = request.getRequestDispatcher("./jsp/viewProduct.jsp");
                    rd.forward(request, response);
                    return;
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
