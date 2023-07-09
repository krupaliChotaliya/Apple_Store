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

<%@page import="com.ecommerce.Dao.ProductDao"%>
<%@page import="com.ecommerce.Dao.OrderDao"%>
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
        <title>Order</title>
        <%@include file="../components/common_css_js.jsp" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="../css/adminDashboard.css"/>
        <link rel="stylesheet" href="../assests/dataTable.css"/>
    </head>
    <body>


         <jsp:include page="../components/common_adminpanel_module.jsp" />

        <div class="report-container">
            <div class="report-header">
                <h2 class="recent-article">Order</h2>
            </div>
            <div class="report-body">
                <table class="table table-striped" id="mytable">
                    <thead>
                        <tr style="color: #5500cb;" >
                            <th scope="col">#</th>
                            <th scope="col">User Email</th>
                            <th scope="col">Order_id</th>
                            <th scope="col">Payment_id</th>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Status</th>
                            <th scope="col">Receipt</th>
                            <th scope="col" style="padding-right: 20px;">OrderDate</th>
                            <th scope="col">Product name</th>
                            <th scope="col">Product Price</th>
                            <th scope="col">Product Discount(%)</th>
                            <th scope="col">Product Quantity</th>
                            <th scope="col">Address</th>
                            <th scope="col">City</th>
                            <th scope="col">Landmark</th>
                            <th scope="col">Phone no</th>
                            <th scope="col">Pincode</th>
                            <th scope="col">State</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            ProductDao pdao=new ProductDao(factoryProvider.getfactory());
                            int i = 1;
                            OrderDao od = new OrderDao(factoryProvider.getfactory());
                            List<Object[]> list = od.getOrderDeliveryUserData();
                            for (Object[] arr : list) {
                             int result=pdao.caltotalamount(Integer.parseInt(arr[9].toString()),Integer.parseInt(arr[8].toString()),Integer.parseInt(arr[10].toString()));
                        %>
                        <tr>
                            <th scope="row"><%=  i%> </th>
                            <th><%= arr[0]%> </th>
                            <th><%= arr[1]%> </th>
                            <th><%= arr[2]%> </th>                           
                            <th><%=result %></th>
                            <th><%= arr[4]%> </th>
                            <th><%= arr[5]%> </th>
                            <th><%= arr[6]%> </th>
                            <th><%= arr[7]%> </th>                           
                            <th><%= arr[8]%> </th>                           
                            <th><%= arr[9]%> </th>
                            <th><%= arr[10]%> </th>
                            <th><%= arr[11]%> </th>
                            <th><%= arr[12]%> </th>
                            <th><%= arr[13]%> </th>
                            <th><%= arr[14]%> </th>
                            <th><%= arr[15]%> </th>
                            <th><%= arr[16]%> </th>

                        </tr>

                        <%

                                i++;
                                System.out.println(arr[3] + " " + arr[10]);
                            }

                        %>

                    </tbody>
                </table>
            </div>
        </div>

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
