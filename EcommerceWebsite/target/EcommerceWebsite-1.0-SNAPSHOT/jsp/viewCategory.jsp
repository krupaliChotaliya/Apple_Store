<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.Dao.CategoryDao"%>
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
        <title>Category</title>
        <%@include file="../components/common_css_js.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      

        <link rel="stylesheet" href="../css/adminDashboard.css"/>
    </head>
    <body>
        <jsp:include page="../components/common_adminpanel_module.jsp" />

        <div class="report-container">
            <div class="report-header">
                <h2 class="recent-article">Category</h2>
            </div>
            <div class="report-body">
                <table class="table table-striped">
                    <thead>
                        <tr style="color: #5500cb;" >
                            <th scope="col">#</th>
                            <th scope="col">CategoryId</th>
                            <th scope="col">CategoryTitle</th>
                            <th scope="col">Category Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            CategoryDao cdao = new CategoryDao(factoryProvider.getfactory());
                            List<Category> category = cdao.getcategories();

                            int i = 1;
                            for (Category c : category) {
                        %>
                        <tr>
                            <th><%= i%> </th>
                            <th><%= c.getCategoryId()%> </th>
                            <th><%= c.getCategoryTitle()%> </th>
                            <th><%= c.getCategoryDescription()%> </th>
                        </tr>

                        <% i++;
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
        <script>
            //            navbar toggle
            let icon = document.querySelector(".logo-icon");
            let nav = document.querySelector(".nav-container");


            icon.addEventListener("click", () => {
                nav.classList.toggle("navclose");
            })

        </script>
    </body>
</html>
