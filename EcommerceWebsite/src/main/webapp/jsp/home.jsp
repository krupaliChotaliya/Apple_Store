<%@page import="com.ecommerce.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>home</title>
        <link rel="icon" href="${pageContext.request.contextPath}/img/media/titlebarlogo.png"  type="image/x-icon"/>
        <%@include file="../components/common_css_js.jsp" %>

        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">


    </head>

    <body class="home">
        <!-- Navbar Section Start -->
        <header>
            <%@include file="../components/navbar.jsp" %>
        </header>
        <!-- Navbar Section Exit -->


        <!--Banner Section Start-->
        <section class="banner-wrapper wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 order-lg-1 order-2">
                        <div>
                            <h2>
                                Where Innovation Meets Imagination <span><br class="d-none d-xl-block">Welcome to the Apple Store</span>
                            </h2>
                            <p>At the Apple Store, we offer a range of services to enhance your Apple experience, provide technical support, and foster your creativity. Visit us today to discover how we can assist you with all your Apple needs.</p>

                            <p>Ensure peace of mind with Apple Care+. Our comprehensive protection plan extends your device's warranty coverage, providing expert technical support and accidental damage coverage.</p>

                            <p>Unlock your creativity and enhance your skills with Today at Apple. Join our free workshops, sessions, and events led by talented artists, photographers, musicians, and experts.</p>

                            <p class="mt-5">Let's get started!</p>
                            <a href="#" class="btn main-btn mt-5">Learn more</a>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-5 order-lg-2 order-1">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/media/iphone-14-pro-fan-2.jpg" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section Exit -->

        <!-- Services Section Start-->
        <section class="parallax parallax-main img1">
            <div class="main-wrapper wrapper">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-12">
                            <div class="sec-title">
                                <h1>Discover <span>New</span></h1>
                                <h4>Products</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid px-lg-0">
                    <div class="row">
                        <div class="offset-lg-6 col-lg-6 offset-md-4 col-md-8 mb-5 mb-lg-0">
                            <div class="parallax parallax-1 img2">
                                <div class="card black-card">
                                    <h3>Introducing AirPods (3rd Generation)</h3>
                                    <h5>Immerse Yourself in Wireless Audio</h5>
                                    <p>Experience the next level of wireless audio with the all-new AirPods (3rd Generation). Combining cutting-edge technology, superior sound quality, and effortless connectivity, these earbuds are designed to enhance your listening experience in every way.

                                    </p>
                                    <a href="#" class="view-link">Learn More <img src="" class="ms-4"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-8 mb-5 mb-lg-0">
                            <div class="text-end parallax img3">
                                <div class="card right black-card">
                                    <h3>Introducing the All-New MacBook Air 15</h3>
                                    <h5>Unleash Your Productivity and Creativity</h5>
                                    <p>The MacBook Air 15 is here to revolutionize the way you work, create, and connect. Packed with powerful features and a stunning display, this ultra-thin and lightweight laptop sets a new standard for performance and portability.</p>
                                    <a href="#" class="view-link">Learn More <img src="" class="ms-4"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="offset-lg-6 col-lg-6 offset-md-4 col-md-8  mb-5 mb-lg-0">
                            <div class="text-end parallax parallax-1 img4">
                                <div class="card black-card">
                                    <h3>Introducing iPhone 14 Pro Max</h3>
                                    <h5>Redefining Excellence in Mobile Technology</h5>
                                    <p>The iPhone 14 Pro Max is here to set a new standard in mobile technology, combining advanced features, cutting-edge design, and unparalleled performance. Get ready to experience a new level of excellence with this flagship device.

                                    </p>
                                    <a href="#" class="view-link">Learn More <img src="" class="ms-4"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-8  mb-5 mb-lg-0">
                            <div class="text-end parallax img5">
                                <div class="card right black-card">
                                    <h3>Introducing Apple Watch Series 9</h3>
                                    <h5>Elevating Your Health and Connectivity</h5>
                                    <p>The Apple Watch Series 9 is here to redefine what a smartwatch can do, combining advanced health tracking features, seamless connectivity, and sleek design. With its innovative technologies, this watch is your ultimate companion for a healthier, more connected lifestyle.</p>
                                    <a href="#" class="view-link">Learn More <img src="" class="ms-4"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!--Services Section Exit-->

        <!-- Process Section Start-->
        <section class="process-wrapper wrapper">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-12">
                        <div class="sec-title">
                            <h1>THE PROCESS</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="d-flex align-items-center justify-content-center process-content">
                            <span>1</span>
                            <p>Explore our services and give us a call to consult what services are right for you</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="d-flex align-items-center justify-content-center process-content">
                            <span>2</span>
                            <p>Explore our services and give us a call to consult what services are right for you</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="d-flex align-items-center justify-content-center process-content">
                            <span>3</span>
                            <p>Explore our services and give us a call to consult what services are right for you</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!--Process Section Exit-->

        <!-- Work Section Start-->
        <section class="work-wrapper wrapper pt-0">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-12">
                        <div class="sec-title">
                            <h1>OUR LATEST PRODUCTS</h1>
                            <p>Elevate Your Digital Lifestyle at the Apple Store</p>
                            <a href="#" class="View More view-link">View More<img src="" class="ms-4"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid px-lg-0">
                <div class="row">
                    <div class="col-sm-6 p-0">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/media/collection-1.webp" class="img-fluid" />
                        </div>
                    </div>
                    <div class="col-sm-6 p-0">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/media/2.jpeg" class="img-fluid" />
                        </div>
                    </div>
                    <div class="col-sm-6 p-0">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/media/ipad.png" class="img-fluid" />
                        </div>
                    </div>
                    <div class="col-sm-6 p-0">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/media/apple-watch_8_2.png" class="img-fluid" />
                        </div>
                    </div>

                    <div class="col-12 text-center mt-5">
                        <a href="#" class="btn main-btn">See More</a>
                    </div>
                </div>
            </div>
        </section>
        <!--Work Section Exit-->

        <!--Testimonial Section Start-->
        <section class="testimonial-wrapper wrapper">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-6 text-lg-end">
                        <h2>WHAT OUR <br class="d-lg-block d-none">CLIENTS SAY</h2>
                    </div>
                    <div class="col-xl-5 col-lg-6">
                        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                        class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                        aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                        aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="card">
                                        <div clas="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="py-5">
                                            <p>lorum Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae nobis molestias natus impedit consequuntur enim inventore aperiam. Error commodi laudantium repellat debitis quisquam ab accusantium ratione saepe laborum consectetur? Sit!</p>
                                        </div>
                                        <div class="title">
                                            <h5>David James</h5>
                                            <h5>Dierector</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="card">
                                        <div clas="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="py-5">
                                            <p>lorum Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae nobis molestias natus impedit consequuntur enim inventore aperiam. Error commodi laudantium repellat debitis quisquam ab accusantium ratione saepe laborum consectetur? Sit!</p>
                                        </div>
                                        <div class="title">
                                            <h5>David James</h5>
                                            <h5>Dierector</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="card">
                                        <div clas="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="py-5">
                                            <p>lorum Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae nobis molestias natus impedit consequuntur enim inventore aperiam. Error commodi laudantium repellat debitis quisquam ab accusantium ratione saepe laborum consectetur? Sit!</p>
                                        </div>
                                        <div class="title">
                                            <h5>David James</h5>
                                            <h5>Dierector</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="card">
                                        <div clas="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="py-5">
                                            <p>?Apple is known for providing strong customer support and service.?</p>
                                        </div>
                                        <div class="title">
                                            <h5>Girdhar</h5>
                                            <h5>Founder Of Girdhar</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="card">
                                        <div clas="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="py-5">
                                            <p>?We are greatly thankful to Analog for supporting us to explore and create
                                                our name as brand on social media. The team of Analog Webmedia works with
                                                full dedication and responsibility to make the market for our brand. It?s
                                                been more than 30 days since we are connected and we are like digital family
                                                now. We appreciate the work and support the working team for best outputs in
                                                future.? </p>
                                        </div>
                                        <div class="title">
                                            <h5>Virasati</h5>
                                            <h5>Founder Of Virasati</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Testimonial Section Exit-->

        <!-- Footer section Start-->
        <section class="footer_wrapper wrapper">
            <div class="container">
                <div class="row align-items-center mb-5">

                    <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                        <h3>Shop and Learn</h3>
                        <h5><a href="#">Mac</a></h5>
                        <h5><a href="#">iPad</a></h5>
                        <h5><a href="#">iPhone</a></h5>
                        <h5><a href="#">Watch</a></h5>
                        <h5><a href="#">AirPods</a></h5>
                        <h5><a href="#">Desktop</a></h5>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0 footer-logo">
                        <h3>Apple Store</h3>
                        <h5><a href="#">Genius Bar</a></h5>
                        <h5><a href="#">Today at Apple</a></h5>
                        <h5><a href="#">Apple camp</a></h5>
                        <h5><a href="#">Apple Trade In</a></h5>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                        <h3>For Education</h3>
                        <h5><a href="#">Apple and Education</a></h5>
                        <h5><a href="#">Shop For Education</a></h5>
                        <h5><a href="#">Shop For University</a></h5>

                    </div>
                    <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                        <h3>About Apple</h3>
                        <h5><a href="#"></a>Newsroom</h5>
                        <h5><a href="#"></a>Apple Leadership</h5>
                        <h5><a href="#"></a>Career Oppoturnities</h5>
                        <h5><a href="#"></a>Investors</h5>

                    </div>
                    <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                        <ul class="link-widget p-0">
                            <li><a href="#"><img src="${pageContext.request.contextPath}/img/media/f.webp" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/img/media/i.webp" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/img/media/l.webp" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/img/media/t.webp" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid pt-5 px-0">
                <div class="row">
                    <div class="col-12">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14016.9363925419!2d77.18302375!3d28.5627323!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1654846055849!5m2!1sen!2sin" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
            <div class="container-fluid copyright-section   ">
                <p>Copyright© 2023 Apple Inc. All Rights Reserved</p>
            </div>
        </section>
        <!-- Footer Section Exit  -->

    </body>

</html>