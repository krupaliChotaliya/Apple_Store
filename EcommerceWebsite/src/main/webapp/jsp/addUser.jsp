<%@page import="com.ecommerce.entities.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <%@include file="../components/common_css_js.jsp" %>       
    </head>
    <body>
        <div class="container">            

            <form action="${pageContext.request.contextPath}/users" method="post" id="userform">

                <%
                    User user = (User) request.getAttribute("user");
                    if (user != null) {
                %>  
                <h1>Update user</h1>
                <input type="hidden" name="id" value="<%= user.getUserId()%>">
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Email</label>
                    <input type="text" name="email" id="email" value="<%= user.getUserEmail()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Password</label>
                    <input type="text" name="password" id="password" value="<%= user.getUserPassword()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pname" class="form-label">Name</label>
                    <input type="text" name="username" id="username" value="<%= user.getUserName()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pDiscount" class="form-label">Phone no</label>
                    <input type="number" name="phone" id="phone" value="<%= user.getUserPhone()%>" class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pCategory" class="form-label">Address</label>
                    <textarea class="form-control" id="address"  name="address"  style="height: 100px"><%= user.getUserAddress()%></textarea>                                  
                </div>
                <div  class="mb-3">
                    <label for="Type" class="form-label">User Type</label>
                    <select name="type">
                        <option value="normal">normal</option>
                        <option value="admin">admin</option>
                    </select>
                </div>

                <%
                } else {

                %>
                <h1>Add user</h1>
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Email</label>
                    <input type="text" name="email" id="email"  class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pQuantity" class="form-label">Password</label>
                    <input type="text" name="password" id="password"  class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pname" class="form-label">Name</label>
                    <input type="text" name="username" id="username"  class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pDiscount" class="form-label">Phone no</label>
                    <input type="number" name="phone" id="phone"  class="form-control" id="exampleInputEmail1" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="pCategory" class="form-label">Address</label>
                    <textarea class="form-control" id="address"  name="address"  style="height: 100px"></textarea>                                  
                </div>
                <div  class="mb-3">
                    <label for="Type" class="form-label">User Type</label>
                    <select name="type">
                        <option value="normal">normal</option>
                        <option value="admin">admin</option>
                    </select>
                </div>
                <%                }
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
        //  add-user form validation
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

    </script>
</html>
