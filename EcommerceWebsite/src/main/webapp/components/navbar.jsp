<%@page import="com.ecommerce.entities.User"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">apple</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--Web Application Context Path = /EcommerceWebsite-->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/store.jsp">Store</a>               
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/mac.jsp">Mac</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/iPhone.jsp">iPhone <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/iPad.jsp">iPad</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/watch.jsp">Watch</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/AirPods.jsp">AirPods</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jsp/desktop.jsp">Desktop</a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
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