<%@page import="java.util.Map"%>
<%@page import="com.ecommerce.helper.helper"%>
<%@page import="com.ecommerce.Dao.userDao"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="java.util.List"%>
<%
    Map<String, Long> map = helper.getcounts(factoryProvider.getfactory());
%>   

<body>
    <header class="header">
        <div class="logo">
             <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{
                        fill:#000000
                    }</style><path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"/></svg>      
            <i class="fa fa-bars  logo-icon "></i>
        </div>
        <div class="search-area">
            <input type="text" name="search" class="search-input"/>
            <button class="search-btn"><i class="fa fa-search search-btn-icon"></i></button>
        </div>

        <div class="notification">
            <div class="red-circle"></div>
            <i class="fa fa-bell"></i>            
            <i class="fa fa-user-circle-o"></i>
            <h3>admin</h3>
        </div>
      
    </header>


    <div class="main-container">
        <div class="nav-container">
            <div class="nav">
                <div class="nav-option option1">
                    <i class="fa fa-user-plus"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewUser" style="text-decoration: none">
                        <h3>User</h3>
                    </a>
                </div>
                <div class="nav-option option2">
                    <i class="fa fa-tasks"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewCategory" style="text-decoration: none">
                        <h3 style="color:black">Category</h3>
                    </a>
                </div>
                <div class="nav-option option3">
                    <i class="fa fa-cubes"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewProduct" style="text-decoration: none">
                        <h3>Product</h3>
                    </a>
                </div>
                <div class="nav-option option4">
                    <i class="fa fa-cart-plus"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewOrder" style="text-decoration: none">
                        <h3>Orders</h3>
                    </a>
                </div>
                <div class="nav-option option5"> 
                    <i class="fa fa-power-off"></i>
                    <a href="${pageContext.request.contextPath}/jsp/logout" style="text-decoration: none">
                        <h3>logout</h3>
                    </a>
                </div>
            </div>
        </div>
        <!--main content-->
           
        <div class="main">
            <%@include file="../components/message.jsp" %>    
            <div class="box-container">
                <div class="box box1">
                    <div class="text">
                        <h2><%= map.get("userCount")%></h2>
                        <p>Total Users</p>
                    </div>
                    <i class="fa fa-user-plus"></i>
                </div>

                <div class="box box1">
                    <div class="text">
                        <h2><%= map.get("categoryCount")%></h2>
                        <p>Total Catgories</p>
                    </div>
                    <i class="fa fa-tasks"></i>
                </div>

                <div class="box box1">
                    <div class="text">
                        <h2><%= map.get("productCount")%></h2>
                        <p>Total Products</p>
                    </div>
                    <i class="fa fa-cubes"></i>
                </div>
                <div class="box box1">
                    <div class="text">
                        <h2><%= map.get("orderCount")%></h2>
                        <p>Total Orders</p>
                    </div>
                    <i class="fa fa-cart-plus"></i>
                </div>
            </div>

        