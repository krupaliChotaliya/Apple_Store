<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
       
        <% 
            out.println(factoryProvider.getfactory()+"<br>");
            out.println(factoryProvider.getfactory()+"<br>");
            
            out.println(factoryProvider.getfactory());
            
        %>
        Web Application Context Path = ${pageContext.request.contextPath}
    </body>
</html>
