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
        <title>User</title>
        <%@include file="../components/common_css_js.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="../css/adminDashboard.css"/>
    </head>
    <body>
        <jsp:include page="../jsp/test2.jsp" />

        <div class="report-container">
            <div class="report-header">
                <h2 class="recent-article">Users</h2>
                <button class="view" data-toggle="modal" data-target="#add-user-modal">add</button>
            </div>
            <div class="report-body">
                <table class="table table-striped">
                    <thead>
                        <tr style="color: #5500cb;" >
                            <th scope="col">#</th>
                            <th scope="col">UserId</th>
                            <th scope="col">UserName</th>
                            <th scope="col">UserEmail</th>
                            <th scope="col">UserPassword</th>
                            <th scope="col">UserAddress</th>
                            <th scope="col">UserPhone</th>
                            <th scope="col">UserType</th>
                            <th scope="col">active</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 1;
                            userDao udao = new userDao(factoryProvider.getfactory());
                            List<User> user2 = udao.getUsers();

                            for (User u : user2) {
                        %>
                        <tr>
                            <th scope="row"><%=  i%> </th>
                            <th><%= u.getUserId()%> </th>
                            <th><%= u.getUserName()%> </th>
                            <th><%= u.getUserEmail()%> </th>
                            <th><%= u.getUserPassword()%> </th>
                            <th><%= u.getUserAddress()%> </th>
                            <th><%= u.getUserPhone()%> </th>
                            <th><%= u.getUserType()%> </th>
                            <th><%= u.getActive()%> </th>

                            <th><button class="btn btn-primary">update</button> </th>
                            <th><button class="btn btn-danger" onclick="deleteRow(<%= u.getUserId()%>)">delete</button></th>
                        </tr>

                        <% i++;
                            }
                        %>

                    </tbody>
                </table>

                <div class="modal fade" id="add-user-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title fs-5" id="exampleModalLabel">Add User</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../productOperationServlet" method="post" id="userform" enctype="multipart/form-data">
                                    <!--to check whether it is product form or category form-->
                                    <input type="hidden" name="operation" value="adduser">
                                    <div class="mb-3">
                                        <label for="pQuantity" class="form-label">Email</label>
                                        <input type="text" name="email" id="email" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="pQuantity" class="form-label">Password</label>
                                        <input type="text" name="password" id="password" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="pname" class="form-label">Name</label>
                                        <input type="text" name="username" id="username" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="pDiscount" class="form-label">Phone no</label>
                                        <input type="number" name="phone" id="phone" class="form-control" id="exampleInputEmail1" aria-describedby="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="pCategory" class="form-label">Address</label>
                                        <textarea class="form-control" id="address" name="address"  style="height: 100px"></textarea>                                  
                                    </div>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <!--error message toast-->
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

            </div>
        </div>


        <script>
//            navbar toggle
            let icon = document.querySelector(".logo-icon");
            let nav = document.querySelector(".nav-container");

            icon.addEventListener("click", () => {
                nav.classList.toggle("navclose");
            })

//                        add-user form validation
            function validation() {
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var phoneno = /^\d{10}$/;

                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var username = document.getElementById('username').value;
                var phone = document.getElementById('phone').value;
                var address = document.getElementById('address').value;

                if (!email.match(mailformat))
                {
                    document.getElementById('toast-content').innerHTML = "please enter valid Email Id";
                    $(".toast").toast("show");
                    return false;
                }

                if (password == "")
                {
                    document.getElementById('toast-content').innerHTML = "please enter password";
                    $(".toast").toast("show");
                    return false;
                }
                if (username == "" || !isNaN(username))
                {
                    document.getElementById('toast-content').innerHTML = "please enter username";
                    $(".toast").toast("show");
                    return false;
                }
                if (!phone.match(phoneno))
                {
                    document.getElementById('toast-content').innerHTML = "please enter valid phone no";
                    $(".toast").toast("show");
                    return false;
                }
                if (address == "")
                {
                    document.getElementById('toast-content').innerHTML = "please enter address";
                    $(".toast").toast("show");
                    return false;
                } else {
                    return true;
                }
            }


            const userform = document.getElementById('userform');
            userform.addEventListener('submit', handleFormSubmit);

            function handleFormSubmit(event) {

                console.log(validation());
                if (!validation()) {

                    event.preventDefault();
                }

            }

            //to delete row
            function deleteRow(id) {

                console.log(id);

                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you really want to delete?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {

                        $.ajax({

                            url: "../productOperationServlet",
                            data: JSON.stringify({
                                row_id: id
                            }),
                            type: "post",
                            contentType: 'application/json',
//                            dataType: 'String',
                            success: function (response) {

                                console.log("enter...");

                                console.log("deleted sucessfully!!");
                                location.reload();

                            },
                            error: function (error) {
                                console.log("something went wrong!!" + JSON.stringify(error));
                            }
                        });

                    }
                });
            }
            ;
        </script>
    </body>
</html>
