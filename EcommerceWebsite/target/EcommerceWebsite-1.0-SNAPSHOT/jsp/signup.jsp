<%@page errorPage="error.jsp" %>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup Page</title>

        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>       
        <div class="container mt-5">
            <form action="signupServlet" id="signup-form" method="post" >
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input  name="userEmail" type="email" class="form-control" id="email" autocomplete="off" aria-describedby="emailHelp" placeholder="Enter email">
                    <span id="email_error" class="text-danger font-weight-bold"></span>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input  name="userPassword" type="password" class="form-control" id="password" autocomplete="off">
                    <span id="password_error" class="text-danger font-weight-bold"></span>
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Display Name</label>
                    <input  name="userName" type="text" class="form-control" id="username" autocomplete="off">
                    <span id="username_error" class="text-danger font-weight-bold"></span>
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Phone Number</label>
                    <input type="number" name="userPhone" class="form-control" id="phone" autocomplete="off">
                    <span id="phone_error" class="text-danger font-weight-bold"></span>
                </div>

                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Address</label>
                    <textarea class="form-control" name="userAddress" id="address" rows="3" autocomplete="off"></textarea>
                    <span id="address_error" class="text-danger font-weight-bold"></span>
                </div>

                <div class="form-group">
                    <label for="exampleFormControlFile1">Profile Picture</label>
                    <input type="file" name="userPic" class="form-control-file">
                    <span id="pic_error" class="text-danger font-weight-bold"></span>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>   
<!-- start toast :: error msg-->
<div class="toast align-items-center position-fixed top-0 end-0 text-bg-danger mt-5 mr-2 p-2 border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
        <div class="toast-body fs-6" id="toast-content">
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
</div>
<!--end toast-->
<script>
    $(document).ready(function () {

//        signup form validation
        $('#signup-form').on('submit', function (event) {
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
                document.getElementById('toast-content').innerHTML = "please enter phone no";
                $(".toast").toast("show");
                return false;
            }
            if (address == "")
            {
                document.getElementById('toast-content').innerHTML = "please enter address";
                $(".toast").toast("show");
                return false;
            }

            event.preventDefault();

            let form = new FormData(this);

            $.ajax({
                url: "../signupServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    if (data.trim() === "done")
                    {
                        swal("Registered Sucessfully!!").then((value) => {
                            window.location = "login.jsp";
                        });

                    } else
                    {
                        swal("invaild Details!!");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {

                    swal("something went wrong..");
                },

                processData: false,
                contentType: false
            });
        });
    });

</script>
</body>
</html>
