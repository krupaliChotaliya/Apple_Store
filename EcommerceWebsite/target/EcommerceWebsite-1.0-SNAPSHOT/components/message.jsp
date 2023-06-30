<%@page import="com.ecommerce.entities.User"%>
<%
    String msg2 = (String) session.getAttribute("message");
    if (msg2 != null) {
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= msg2 %> </strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message");
    }

%>
