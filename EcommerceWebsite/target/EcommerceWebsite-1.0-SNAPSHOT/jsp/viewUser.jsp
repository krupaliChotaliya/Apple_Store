<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! login first");
        response.sendRedirect("login");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "Sorry!! You are not admin! Do not access this page.");
            response.sendRedirect("login");
            return;
        }
    }
%>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css"/>
        <link rel="stylesheet" href="../assests/dataTable.css"/>
        

    </head>
    <body>
        <jsp:include page="../components/common_adminpanel_module.jsp" />
        <div class="report-container">
            <div class="report-header">
                <h2 class="recent-article">User</h2>
                <a href="${pageContext.request.contextPath}/jsp/addUser"><button class="view" data-toggle="modal" data-target="#add-user-modal">add</button></a>
            </div>
            <div class="report-body">
                <table class="table table-striped" id="mytable">
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

                            <th><a href="${pageContext.request.contextPath}/users?action=update&id=<%= u.getUserId()%>"> <button class="btn btn-primary">update</button></a> </th>
                            <th><a href="${pageContext.request.contextPath}/users?action=delete&id=<%= u.getUserId()%>"><button class="btn btn-danger" onclick="deleteRow(<%= u.getUserId()%>)">delete</button></a></th>
                        </tr>

                        <% i++;
                            }
                        %>

                    </tbody>
                </table>
                <script  src="../assests/dataTable.js"></script>       
                <script  src="../js/Custom_dataTable.js"></script>       
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
