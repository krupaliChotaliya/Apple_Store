<%@page import="com.ecommerce.entities.User"%>
<%@page isELIgnored="false"%>
<%@include file="../components/common_css_js.jsp" %> 

<nav class="navbar navbar-dark navbar-expand-md bg-dark" >
    <div class="container "><a href="${pageContext.request.contextPath}">
            <svg xmlns="http://www.w3.org/2000/svg" height="2em" style="margin-right:25px" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{
                        fill:#f3f1f1
                    }</style><path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"/></svg>
        </a>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav flex-grow-1 justify-content-between ">               
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/store.jsp">Store</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/mac.jsp">Mac</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/iPhone.jsp">iPhone</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/iPad.jsp">iPads</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/watch.jsp">Watch</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/AirPods.jsp">AirPods</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="${pageContext.request.contextPath}/jsp/desktop.jsp" style="margin-right: 30px">Desktop</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="#"><i class="fa fa-shopping-cart" ></i><span style="font-size: 18px" class="cart-items">(0)</span></a></li>
                            <%
                                User user1 = (User) session.getAttribute("current-user");
                                if (user1 == null) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/login.jsp">Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/signup.jsp">Register<span class="sr-only">(current)</span></a>
                </li>
                <%

                } else {

                %>
                <li class="nav-item active">
                    <a class="nav-link" href="#!"><%= user1.getUserName()%> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">logout<span class="sr-only">(current)</span></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>


