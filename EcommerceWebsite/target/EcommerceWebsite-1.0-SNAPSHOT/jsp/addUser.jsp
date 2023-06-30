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
            <h1>add user</h1>
            <form action="${pageContext.request.contextPath}/users" method="post">
                <%
                    User user = (User) request.getAttribute("user");
                    if (user != null) {
                %>  
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
    </body>
</html>
