package customTags;

import com.ecommerce.Dao.CategoryDao;
import com.ecommerce.Dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.factoryProvider;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

//contains page body
public class pagebody extends TagSupport {

    private String categoryname;

    public void setcategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    @Override
    public int doStartTag() throws JspException {

        JspWriter out = pageContext.getOut();
        try {

            out.print(" <div class=\"row m-4\">");
            CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());
            Category c = catdao.getCategoryByCategoryName(categoryname);

            ProductDao productdao = new ProductDao(factoryProvider.getfactory());
            List<Product> plist = productdao.getProductsById(c.getCategoryId());

            for (Product p : plist) {
                out.print(
                        " <div class=\"col-lg-4 col-md-6 mb-lg-0 mb-5\">\n"
                        + "<form action=\"../productDetailsSerlvet\" method=\"post\"> "
                        + "  <div class=\"card mb-5\">\n"
                        + "      <img decoding=\"async\" src=\"../img/products/" + p.getpPic() + "\" class=\"img-fluid\">\n"
                        + "      <div class=\"pt-3\">\n"
                        + "          <h4 class=\"text-center\">" + p.getpName() + "</h4>\n"
                        + "         <input type=\"hidden\" name=\"productname\" value=\"" + p.getpName() + " \" />\n"
                        + "         <p style=\"color:gray\" class=\"text-center\" ><del>&#8377;" + p.getpPrice() + ".00</del> &nbsp; " + p.getpDiscount() + "% off</p>\n"
                        + "         <span class=\"text-center\">&#8377; " + p.getProductPriceAfterDiscount() + ".00\n"
                        + "            <button type=\"submit\" class=\" btn btn-outline-dark\">Learn more</button>\n"
                        + "       </span>\n"
                        + "       </form>\n"
                        + "       <button class=\"btn btn-info mt-4 main-btn align-items-center\" id=\"" + p.getpId() + "\" onclick=\"addToCart(" + p.getpId() + "," + p.getpQuantity() + ",'" + p.getpName() + "'," + p.getProductPriceAfterDiscount() + ")\">Add to Cart</button>\n"
                        + "    </div>\n"
                        + "    </div>\n"
                        + "   </div>"
                );
            }

        } catch (IOException ex) {
            Logger.getLogger(pagebody.class.getName()).log(Level.SEVERE, null, ex);
        }

        return SKIP_BODY;
    }

}
