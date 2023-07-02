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
            <form action="${pageContext.request.contextPath}/products" method="post" enctype="multipart/form-data" id="productform">
                <%
                    Product p = (Product) request.getAttribute("product");
                    if (p != null) {
                %>  
                <h1>Update product</h1>
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

                <h1>Add product</h1>
                <div class="mb-3">
                    <label for="pname" class="form-label">Name</label>
                    <input type="text" name="pname" id="pname" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>

                <div class="mb-3">
                    <label for="pCategory" class="form-label">Description</label>
                    <textarea class="form-control" id="pdescription" name="pdescription"  style="height: 100px"></textarea>                                  
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
        <!--error message toast-->
        <div class="toast align-items-center position-fixed top-0 end-0 p-3 text-bg-danger m-5 border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body fs-6" id="toast-content">
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
        <!--end toast-->
    </body>
    <script>
        // add-product form validation
        function validation() {

            var pname = document.getElementById('pname').value;
            var pdescription = document.getElementById('pdescription').value;
            var pQuantity = document.getElementById('pQuantity').value;
            var pPrice = document.getElementById('pPrice').value;
            var pDiscount = document.getElementById('pDiscount').value;

            if (pname == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter product name";
                $(".toast").toast("show");
                return true;
            }

            if (pdescription == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter product description";
                $(".toast").toast("show");
                return true;
            }
            if (pQuantity == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter product Quantity";
                $(".toast").toast("show");
                return true;
            }
            if (pPrice == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter product price";
                $(".toast").toast("show");
                return true;
            }
            if (pDiscount == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter discount";
                $(".toast").toast("show");
                return true;
            }

            return false;

        }

        let allpics = true;
        let mainpic = true;
        const productform = document.getElementById('productform');
        productform.addEventListener('submit', handleFormSubmit);

        function handleFormSubmit(event) {
            if (allpics || mainpic) {
                event.preventDefault();
            }
            if (validation()) {
                event.preventDefault();
            }

        }

        const coverpic = document.getElementById('mainpic');
        coverpic.addEventListener('change', mainPicUpload);
        function mainPicUpload(event) {
            mainpic = false;
            const file = event.target.files[0];
            if (file) {
                const fileType = file.type;
                const allowedTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                if (!allowedTypes.includes(fileType)) {
                    document.getElementById('toast-content').innerHTML = "Invalid file type. Please upload a JPEG, PNG, or JPG file.";
                    $(".toast").toast("show");
                    mainpic = true;
                }
            }
        }

        const otherpic = document.getElementById('otherpic');
        otherpic.addEventListener('change', otherPicsUpload);
        function otherPicsUpload(event) {
            allpics = false;
            if ($("#otherpic")[0].files.length != 3) {
                document.getElementById('toast-content').innerHTML = "Please upload 3  product pics";
                $(".toast").toast("show");
                allpics = true;
            } else {
                const files = otherpic.files;

                for (let i = 0; i < files.length; i++) {
                    const file = files[i];
                    const fileType = file.type;
                    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

                    if (!allowedTypes.includes(fileType)) {
                        allpics = true;
                        document.getElementById('toast-content').innerHTML = "Invalid file type for file ${i + 1}. Please upload a JPEG, PNG, or GIF file.";
                        $(".toast").toast("show");
                    }
                }
            }
        }

    </script>
</html>
