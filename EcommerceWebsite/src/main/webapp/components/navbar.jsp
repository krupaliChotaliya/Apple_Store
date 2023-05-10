<%@page import="com.ecommerce.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">app</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <%
                    User user1 = (User) session.getAttribute("current-user");
                    if (user1 == null) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="signup.jsp">Register<span class="sr-only">(current)</span></a>
                </li>
                <%

                } else {

                %>
                <li class="nav-item active">
                    <a class="nav-link" href="#!"><%= user1.getUserName()%> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="logout.jsp">logout<span class="sr-only">(current)</span></a>
                </li>
                <%
                    }
                %>



            </ul>
        </div>
    </div>
</nav>