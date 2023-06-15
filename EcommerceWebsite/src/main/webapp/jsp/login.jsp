<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login Page</title>

        <link rel="stylesheet" href="../css/login.css"/>
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <header>
            <%@include file="../components/navbar.jsp" %>
             <%@include file="../components/message.jsp" %>
        </header>
          
        <div class="box">
            <span class="borderLine"></span>
            <form action="loginServlet" method="post" id="login-form">
                <h2>Log in</h2>
                <div class="inputBox">
                    <input type="text" name="email" required="required">
                    <span>Email</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" required="required">
                    <span>Password</span>
                    <i></i>
                </div>
                <div class="Links">
                    <a href="./signup.jsp">Create account</a>
                </div>
                <input type="submit" value="Login">
            </form>
        </div>

        <script>

            $(document).ready(function () {

                $('#login-form').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);
                    $.ajax({
                        url: "../loginServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "invaild")
                            {
                                swal("Wrong Credentials!!");
                            } else if (data.trim() === "normal") {
                                swal("login Sucessfully!!").then((value) => {
                                    window.location = "home.jsp";
                                });
                            } else
                            {
                                swal("login Sucessfully!!").then((value) => {
                                    window.location = "admin.jsp";
                                });

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("something went wrong..");
                        },
                        processData: false,
                        contentType: false

                    });
                });

            })
        </script>
    </body>
</html>
