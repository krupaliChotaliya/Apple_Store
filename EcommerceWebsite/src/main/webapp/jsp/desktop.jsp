<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.Dao.CategoryDao"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desktop</title>
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <%@include file="../components/navbar.jsp" %>
        <div class="row m-4">

            <%                
                CategoryDao catdao=new CategoryDao(factoryProvider.getfactory());
                Category c=catdao.getCategoryByCategoryName("Desktop");
                
                
                ProductDao productdao = new ProductDao(factoryProvider.getfactory());
                List<Product> plist = productdao.getProductsById(c.getCategoryId());

                for (Product p : plist) {

            %>

            <div class="col-md-4">
                <div class="card " style="width: 17rem;border: none">
                    <img class="card-img-top" src="../img/products/<%=p.getpPic()%>" alt="Card image cap">
                    <div class="card-body py-4">
                        <h5 class="card-title"><%= p.getpName()%></h5>
                        <p class="card-text"> <%= p.getpDescription()%></p>
                        <h4 class="card-title" style="color: #51087E">&#8377; <%= p.getProductPriceAfterDiscount()%>.00</h4>
                        <span style="color:gray ">&#8377;<%= p.getpPrice()%> &nbsp; <%=  p.getpDiscount()%>% off  </span>
                    </div>

                    <div class="card-footer">
                        <a href="#" class="btn btn-success">Add to Bag</a>
                    </div>    
                </div>

            </div>
            <% }%>
        </div>

    </body>
</html>