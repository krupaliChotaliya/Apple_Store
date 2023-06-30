<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.Dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <%@include file="../components/common_css_js.jsp" %>       
    </head>
    <body>
        <div class="container">            
            <h1>add product</h1>
            <form action="${pageContext.request.contextPath}/products" method="post"  enctype="multipart/form-data">
                <%
                    Product p = (Product) request.getAttribute("product");
                    if (p != null) {
                %>  
                <input  type="hidden" value="<%= p.getpId()%>" name="id"/>
                <div class="mb-3">
                    <label for="pname" class="form-label">Name</label>
                    <input type="text" readOnly=”true” name="pname" id="pname" value="<%= p.getpName()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>

                <div class="mb-3">
                    <label for="pCategory" class="form-label">Description</label>
                    <textarea class="form-control" id="pdescription"  name="pdescription"  style="height: 100px"><%= p.getpDescription()%></textarea>                                  
                </div>
                <%
                    CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
                    List<Category> list = cdao.getcategories();

                %>

                <div class="mb-3">
                    <label for="pCategory" class="form-label">Category</label>
                    <select name="catId" class="form-control">
                        <%                            for (Category c : list) {
                        %>

                        <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Quantity</label>
                    <input type="number" name="pQuantity" value="<%= p.getpQuantity()%>" id="pQuantity" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pPrice" class="form-label">Price</label>
                    <input type="number" name="pPrice" id="pPrice" value="<%= p.getpPrice()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pDiscount" class="form-label">Discount</label>
                    <input type="number" name="pDiscount" id="pDiscount" value="<%= p.getpDiscount()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlFile1">Main Picture of Product</label>
                    <input type="file" name="pPic" id="mainpic" class="form-control-file" accept="image/*">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlFile1">Other Product pictures</label><br>
                    <input type="file" id="otherpic" name="pOtherPics" multiple accept="image/*">
                </div>

                <%
                } else {

                %>


                <div class="mb-3">
                    <label for="pname" class="form-label">Name</label>
                    <input type="text" name="pname" id="pname" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>

                <div class="mb-3">
                    <label for="pCategory" class="form-label">Description</label>
                    <textarea class="form-control" id="pdescription" name="pdescription"  style="height: 100px"></textarea>                                  
                </div>
                <%                    CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
                    List<Category> list = cdao.getcategories();

                %>

                <div class="mb-3">
                    <label for="pCategory" class="form-label">Category</label>
                    <select name="catId" class="form-control">
                        <%                           
                              for (Category c : list) {
                        %>

                        <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Quantity</label>
                    <input type="number" name="pQuantity" id="pQuantity" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pPrice" class="form-label">Price</label>
                    <input type="number" name="pPrice" id="pPrice" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pDiscount" class="form-label">Discount</label>
                    <input type="number" name="pDiscount" id="pDiscount" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlFile1">Main Picture of Product</label>
                    <input type="file" name="pPic" id="mainpic" class="form-control-file" accept="image/*">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlFile1">Other Product pictures</label><br>
                    <input type="file" id="otherpic" name="pOtherPics" multiple accept="image/*">
                </div>

                <%
                    }
                %>

                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>
    </body>
</html>
