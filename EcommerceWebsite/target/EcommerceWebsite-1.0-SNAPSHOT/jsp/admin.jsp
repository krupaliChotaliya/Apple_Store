<%@page import="java.util.Map"%>
<%@page import="com.ecommerce.helper.helper"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.Dao.CategoryDao"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.entities.User"%>
<%@page import="org.hibernate.Session"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin,Do not access this page!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%
    Map<String, Long> map = helper.getcounts(factoryProvider.getfactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="icon" href="../img/media/titlebarlogo.png"  type="image/x-icon"/>
        <title>admin page</title>
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="../components/message.jsp" %>
        <%@include file="../components/common_cart_modal.jsp" %>
        <!--users-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 h1">Admin Panel</span>
            </div>
            <ul class="navbar-nav ml-auto">
                <%                    
                    User user1 = (User) session.getAttribute("current-user");
                    if (user1 == null) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/login.jsp">Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/signup.jsp">Register<span class="sr-only">(current)</span></a>
                </li>
                <%

                } else {

                %>
                <li class="nav-item active">
                    <a class="nav-link" href="#!"><%= user1.getUserName()%> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">logout<span class="sr-only">(current)</span></a>
                </li>
                <%
                    }
                %>
            </ul>
        </nav>
        <div class="row m-4">
            <div class="d-flex col-xl col-md-6">
                <div class="flex-fill card">
                    <div class=" py-4 card-body">
                        <div class="d-flex align-items-start">
                            <div class="flex-grow-1">
                                <h3 class="mb-2"><%= map.get("userCount")%></h3>
                                <h3 class="mb-2 font-weight-bold">Users</h3>
                                <div class="mb-0">
                                    <span class="text-muted">Current</span>
                                </div>
                            </div>
                            <div class="d-inline-block ms-3">
                                <div class="stat">
                                    <svg xmlns="../img/users.png" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="align-middle text-success">
                                    <line x1="12" y1="1" x2="12" y2="23"></line>
                                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>                    
                    </div>
                    <div class="card-header text-center "><a href="#" style="text-decoration: none"><h4 class="text-success">Users</h4></a></div>
                </div>
                <!--category-->
            </div>
            <div class="d-flex col-xl col-md-6" data-toggle="modal" data-target="#add-category-modal">
                <div class="flex-fill card">
                    <div class=" py-4 card-body">
                        <div class="d-flex align-items-start">
                            <div class="flex-grow-1">
                                <h3 class="mb-2"><%= map.get("categoryCount")%></h3>
                                <h3 class="mb-2 font-weight-bold">Category</h3>
                                <div class="mb-0">
                                    <span class="text-muted">Available</span>
                                </div>
                            </div>
                            <div class="d-inline-block ms-3">
                                <div class="stat">
                                    <svg xmlns="../img/User1.png" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="align-middle text-success">
                                    <line x1="12" y1="1" x2="12" y2="23"></line>
                                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header text-center "><a href="#" style="text-decoration: none"><h4 class="text-success">Category</h4></a></div>
                </div>

            </div>
            <!--product-->
            <div class="d-flex col-xl col-md-6" data-toggle="modal" data-target="#add-product-modal" >
                <div class="flex-fill card">
                    <div class=" py-4 card-body">
                        <div class="d-flex align-items-start">
                            <div class="flex-grow-1">
                                <h3 class="mb-2"><%= map.get("productCount")%></h3>
                                <h3 class="mb-2 font-weight-bold">Product</h3>
                                <div class="mb-0">
                                    <span class="text-muted">Available</span>
                                </div>
                            </div>
                            <div class="d-inline-block ms-3">
                                <div class="stat">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="align-middle text-success">
                                    <line x1="12" y1="1" x2="12" y2="23"></line>
                                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>  
                    </div>
                    <div class="card-header text-center"><a href="#" style="text-decoration: none"><h4 class="text-success">Products</h4></a></div>
                </div>
            </div>
        </div>
        <!--start category model-->

        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" method="post" id="categoryform">
                            <!-- to check whether it is product form or category form-->
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" name="title" id="categoryTitle" class="form-control" id="exampleInputEmail1" aria-describedby="">

                            </div>

                            <div class="mb-3">
                                <label for="">Description</label>
                                <textarea class="form-control" id="categoryDescription" name="description"  id="" style="height: 100px"></textarea>                                  
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <!--end category modal-->
                            
                               <!-- error message toast-->
                            <div class="toast toast2 align-items-center position-fixed top-0 end-0 p-3 text-bg-danger m-5 border-0" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="d-flex">
                                    <div class="toast-body fs-6" id="toast-content2">
                                    </div>
                                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                            </div>
                            <!--end toast-->
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end category model-->

        <!--add product modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title fs-5" id="exampleModalLabel">Add Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../productOperationServlet" method="post" id="productform" enctype="multipart/form-data">
                            <!-- to check whether it is product form or category form-->
                            <input type="hidden" name="operation" value="addproduct">

                            <div class="mb-3">
                                <label for="pname" class="form-label">Name</label>
                                <input type="text" name="pname" id="pname" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                <span id="pname_error" class="text-danger font-weight-bold"></span>
                            </div>

                            <div class="mb-3">
                                <label for="pCategory" class="form-label">Description</label>
                                <textarea class="form-control" id="pdescription" name="pdescription"  style="height: 100px"></textarea>                                  
                                <span id="pdescription_error" class="text-danger font-weight-bold"></span>
                            </div>
                            <%
                                CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
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
                                <span id="pQuantity_error" class="text-danger font-weight-bold"></span>  
                            </div>
                            <div class="mb-3">
                                <label for="pPrice" class="form-label">Price</label>
                                <input type="number" name="pPrice" id="pPrice" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                <span id="pPrice_error" class="text-danger font-weight-bold"></span>
                            </div>
                            <div class="mb-3">
                                <label for="pDiscount" class="form-label">Discount</label>
                                <input type="number" name="pDiscount" id="pDiscount" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                <span id="pDiscount_error" class="text-danger font-weight-bold"></span>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlFile1">Main Picture of Product</label>
                                <input type="file" name="pPic" id="mainpic" class="form-control-file" accept="image/*">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlFile1">Other Product pictures</label><br>
                                <input type="file" id="otherpic" name="pOtherPics" multiple accept="image/*">
                            </div>
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <!-- error message toast-->
                            <div class="toast align-items-center position-fixed top-0 end-0 p-3 text-bg-danger m-5 border-0" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="d-flex">
                                    <div class="toast-body fs-6" id="toast-content">
                                    </div>
                                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                            </div>
                            <!--end toast-->
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <!--end product modal-->



        <script>
//            product form validation
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

//            category form validation
            var categoryTitle = document.getElementById('categoryTitle').value;
            var categoryDescription = document.getElementById('categoryDescription').value;
        
            function validationForCategory() {

                if (categoryTitle == "")
                {                  
                    document.getElementById('toast-content2').innerHTML = "please enter category Title";
                    $(".toast2").toast("show");
                    return true;
                }
                if (categoryDescription == "")
                {
                    document.getElementById('toast-content2').innerHTML = "please enter Category Description";
                    $(".toast2").toast("show");
                    return true;
                }
                return false;
            }
                     
            const categoryform = document.getElementById('categoryform');
            categoryform.addEventListener('submit', handleCategoryFormSubmit);
            function handleCategoryFormSubmit(event) {
               if (validationForCategory()) {
                    event.preventDefault();
                }
            }

        </script>

    </body>
</html>
