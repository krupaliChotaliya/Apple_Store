<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.Dao.CategoryDao"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.entities.User"%>
<%@page import="org.hibernate.Session"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/message.jsp" %>
        <!--users-->
        <div class="row">
            <div class="d-flex col-xl col-md-6">
                <div class="flex-fill card">
                    <div class=" py-4 card-body">
                        <div class="d-flex align-items-start">
                            <div class="flex-grow-1">
                                <h3 class="mb-2">$ 24.300</h3>
                                <h3 class="mb-2 font-weight-bold">Users</h3>
                                <div class="mb-0">
                                    <span class="text-muted">Current</span>
                                </div>
                            </div>
                            <div class="d-inline-block ms-3">
                                <div class="stat">
                                    <svg xmlns="img/users.png" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="align-middle text-success">
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
                                <h3 class="mb-2">$ 24.300</h3>
                                <h3 class="mb-2 font-weight-bold">Category</h3>
                                <div class="mb-0">
                                    <span class="text-muted">Available</span>
                                </div>
                            </div>
                            <div class="d-inline-block ms-3">
                                <div class="stat">
                                    <svg xmlns="img/User1.png" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="align-middle text-success">
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
                                <h3 class="mb-2">$ 24.300</h3>
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

                        <form action="productOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="">

                            </div>

                            <div class="form-floating mb-3">
                                <label for="floatingTextarea2">Description</label>
                                <textarea class="form-control" name="description"  id="floatingTextarea2" style="height: 100px"></textarea>                                  
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

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
                        <form action="productOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">

                            <div class="mb-3">
                                <label for="pname" class="form-label">Name</label>
                                <input type="text" name="pname" class="form-control" id="exampleInputEmail1" aria-describedby="">

                            </div>

                            <div class="form-floating mb-3">
                                <label for="floatingTextarea2">Description</label>
                                <textarea class="form-control" name="pdescription"  id="floatingTextarea2" style="height: 100px"></textarea>                                  
                            </div>
                            <%                                CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
                                List<Category> list = cdao.getcategories();

                            %>

                            <div class="mb-3">
                                <label for="pCategory" class="form-label">Category</label>
                                <select name="catId" class="form-control">
                                    <%                                        for (Category c : list) {
                                    %>

                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="pQuantity" class="form-label">Quantity</label>
                                <input type="number" name="pQuantity" class="form-control" id="exampleInputEmail1" aria-describedby="">
                            </div>
                            <div class="mb-3">
                                <label for="pPrice" class="form-label">Price</label>
                                <input type="number" name="pPrice" class="form-control" id="exampleInputEmail1" aria-describedby="">
                            </div>
                            <div class="mb-3">
                                <label for="pDiscount" class="form-label">Discount</label>
                                <input type="number" name="pDiscount" class="form-control" id="exampleInputEmail1" aria-describedby="">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlFile1">Product Picture</label>
                                <input type="file" name="pPic" class="form-control-file">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <!--end product modal-->

    </body>
</html>
