<%

    Product p = (Product) session.getAttribute("productdetails");
    String pics = p.getpOhterPics();
    String[] a = pics.split(",");

   

%>

<%@page import="com.ecommerce.entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpName()%></title>
        <%@include  file="../components/common_css_js.jsp" %>
    </head>
    <body class="bg-dark text-white">

        <div class="container d-flex align-items-center justify-content-center vh-100 ">
            <div class="row">
                <div class="col-lg-6">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="../img/products/<%= p.getpPic()%>" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../img/products/<%= a[0] %>" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../img/products/<%= a[1] %>" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../img/products/<%= a[2] %>" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon bg-dark" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon bg-dark" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 mt-5 py-5">
                    <h2><%= p.getpName()%></h2>
                    <h3 class="card-title" style="color: #e0eafc">&#8377;<%= p.getProductPriceAfterDiscount()%>.00</h3>
                    <span style="color:gray"><del>&#8377;<%= p.getpPrice()%>.00</del> &nbsp;<%=p.getpDiscount()%>% off  </span>
                    <h5 class="mt-3"><%=p.getpDescription()%></h5>
                </div>
            </div>        
    </body>
</html>
