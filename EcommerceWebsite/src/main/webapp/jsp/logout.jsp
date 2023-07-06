<%@page errorPage="error.jsp" %>
<%@page import="com.ecommerce.entities.User"%>
<% 
    User user=(User)session.getAttribute("current-user");
    
if(user!=null)
{
    session.removeAttribute("current-user");
    response.sendRedirect("login");
}
%>