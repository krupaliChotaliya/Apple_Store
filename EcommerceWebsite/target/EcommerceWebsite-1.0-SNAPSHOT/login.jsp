<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Page</title>
        <%@include file="components/common_css_js.jsp" %>
     
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/message.jsp" %>
        <div class="container mt-5">
            <form action="loginServlet" method="post" id="login-form">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>          
            </form>
        </div>
        <script>

            $(document).ready(function () {
         
                $('#login-form').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);
                    $.ajax({
                        url: "loginServlet",
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
