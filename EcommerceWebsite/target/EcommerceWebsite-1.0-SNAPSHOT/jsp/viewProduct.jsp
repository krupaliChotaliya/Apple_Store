<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="com.ecommerce.helper.helper"%>
<%@page import="com.ecommerce.Dao.userDao"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <%@include file="../components/common_css_js.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css"/>
    </head>
    <body>
         <jsp:include page="../components/common_adminpanel_module.jsp" />

        <div class="report-container">
            <div class="report-header">
                <h2 class="recent-article">Product</h2>
                <a href="${pageContext.request.contextPath}/jsp/addProduct"><button class="view" data-toggle="modal" data-target="#add-user-modal">add</button></a>
            </div>
            <div class="report-body">
                <div class="report-body">
                    <table class="table table-striped">
                        <thead>
                            <tr scope="row" style="color: #5500cb;">
                                <th>#</th>
                                <th>Id</th>
                                <th>Name</th>
                                <th style="padding-right: 250px;">Description</th>
                                <th>Category</th>
                                <th>Price(&#8377;)</th>
                                <th>Discount(%)</th>
                                <th>PriceAfterDiscount(&#8377;)</th>
                                <th>Quantity</th>
                                <th>Available Quanity</th>
                                <th>main product picture </th>
                                <th>other product pictures</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 1;
                                ProductDao pdao = new ProductDao(factoryProvider.getfactory());
                                List<Product> product = pdao.getProducts();

                                for (Product p : product) {

                                    ProductDao pdao1 = new ProductDao(factoryProvider.getfactory());
                                    String CategoryName = pdao1.getCategoryNameByProductName(p.getpName());

                            %>
                            <tr scope="row">
                                <th><%= i%> </th>
                                <th><%= p.getpId()%> </th>
                                <th><%= p.getpName()%> </th>
                                <th><%= p.getpDescription()%> </th>
                                <th><%= CategoryName%> </th>
                                <th><%= p.getpPrice()%> </th>
                                <th><%= p.getpDiscount()%> </th>
                                <th><%= p.getProductPriceAfterDiscount()%> </th>
                                <th><%= p.getpQuantity()%> </th>
                                <th><%= p.getAvailable_quantity()%> </th>
                                <th><%= p.getpPic() %> </th>
                                <th><%= p.getpOhterPics() %> </th>
                                <th><a href="${pageContext.request.contextPath}/products?action=update&id=<%= p.getpId()%>"> <button class="btn btn-primary">update</button></a> </th>
                                <th><a href="${pageContext.request.contextPath}/products?action=delete&id=<%= p.getpId()%>"> <button class="btn btn-danger">delete</button></a> </th>
                            </tr>

                            <% i++;
                                }
                            %>

                        </tbody>
                    </table>

                    <script>
                        //            navbar toggle
                        let icon = document.querySelector(".logo-icon");
                        let nav = document.querySelector(".nav-container");

                        icon.addEventListener("click", () => {
                            nav.classList.toggle("navclose");
                        })
                    </script>
                    </body>
                    </html>
