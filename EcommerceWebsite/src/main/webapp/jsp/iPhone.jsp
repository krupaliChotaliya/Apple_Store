<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/tlds/mylib" prefix="t" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iPhone</title>
         <link rel="icon" href="../img/media/titlebarlogo.png"  type="image/x-icon"/>
        <%@include file="../components/common_css_js.jsp" %>

    </head>

    <body>
        <%@include file="../components/navbar.jsp" %>
        <%@include file="../components/common_cart_modal.jsp" %>
        <t:pagebody categoryname="iphone"></t:pagebody>
        
      
        
    </body>

</html>