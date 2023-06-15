<%@page errorPage="error.jsp" %>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sign up</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/signup.css"/>
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <header>
            <%@include file="../components/navbar.jsp" %>
        </header>

        <div class="box">
            <span class="borderLine"></span>
            <form action="signupServlet" id="signup-form" method="post" >
                <h2>Sign Up</h2>
                <div class="inputBox">
                    <input type="text" name="userEmail"  id="email" required="required">
                    <span>Email address</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input name="userPassword" type="password"  id="password" required="required">
                    <span>Password</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input name="userName" type="text"  id="username" required="required">
                    <span>User name</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input name="userPhone" type="number"  id="phone" required="required">
                    <span>Phone Number</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input name="userAddress" type="text"  id="address" required="required">
                    <span>Address</span>
                    <i></i>
                </div>
                <input type="submit" value="Submit">
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
