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
            <span class="brand-name">apple</span>
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
                    <a href="${pageContext.request.contextPath}/jsp/viewUser.jsp" style="text-decoration: none">
                        <h3>User</h3>
                    </a>
                </div>
                <div class="nav-option option2">
                    <i class="fa fa-tasks"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewCategory.jsp" style="text-decoration: none">
                        <h3 style="color:black">Category</h3>
                    </a>
                </div>
                <div class="nav-option option3">
                    <i class="fa fa-cubes"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewProduct.jsp" style="text-decoration: none">
                        <h3>Product</h3>
                    </a>
                </div>
                <div class="nav-option option4">
                    <i class="fa fa-cart-plus"></i>
                    <a href="${pageContext.request.contextPath}/jsp/viewOrder.jsp" style="text-decoration: none">
                        <h3>Orders</h3>
                    </a>
                </div>
                <div class="nav-option option5"> 

                    <i class="fa fa-power-off"></i>
                    <a href="${pageContext.request.contextPath}/jsp/logout.jsp" style="text-decoration: none">
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

        