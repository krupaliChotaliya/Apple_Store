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
    
    private String productname; 

    public void setproductname(String productname) {
        this.productname = productname;
    }
     
    @Override
    public int doStartTag() throws JspException {

        JspWriter out = pageContext.getOut();
        try {
           
             out.print(" <div class=\"row m-4\">");
            CategoryDao catdao = new CategoryDao(factoryProvider.getfactory());
            Category c = catdao.getCategoryByCategoryName(productname);

            ProductDao productdao = new ProductDao(factoryProvider.getfactory());
            List<Product> plist = productdao.getProductsById(c.getCategoryId());

            for (Product p : plist) {
               
                out.print(" <div class=\"col-md-4\">\n" +
"                <div class=\"card \" style=\"width: 22rem;\">\n" +
"                    <img class=\"card-img-top\" src=\"../img/products/"+p.getpPic()+"\" alt=\"Card image cap\">\n" +
"                    <div class=\"card-body py-4\">\n" +
"                        <h5 class=\"card-title\">"+p.getpName()+"</h5>\n" +
"                        <p class=\"card-text\"> "+p.getpDescription()+"</p>\n" +
"                        <h4 class=\"card-title\" style=\"color: #51087E\">&#8377;"+p.getProductPriceAfterDiscount()+".00</h4>\n" +
"                        <span style=\"color:gray \"><del>&#8377;"+p.getpPrice()+"</del> &nbsp; "+p.getpDiscount()+"% off  </span>\n" +
"                    </div>\n" +
"                    <div class=\"card-footer\">\n" +
"                     <button href=\"#\" class=\"btn btn-primary m-2\" id=\""+p.getpId()+"\" onclick=\"addToCart("+p.getpId()+","+ p.getpQuantity()+",'"+p.getpName()+"',"+p.getProductPriceAfterDiscount()+")\">Add to Bag</button>         \n" +
"                        <a href=\"#\" class=\"btn btn-success m-2\">Buy Now</a>\n" +
"                    </div>    \n" +
"                </div>\n" +
"\n" +
"            </div>");
            }

          
        } catch (IOException ex) {
            Logger.getLogger(pagebody.class.getName()).log(Level.SEVERE, null, ex);
        }

        return SKIP_BODY;
    }

}
