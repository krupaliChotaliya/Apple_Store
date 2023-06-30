<%@page import="com.ecommerce.Dao.CategoryDao"%>
<%@page import="com.ecommerce.Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@taglib uri="/tlds/mylib" prefix="t" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>Watch</title>
        <%@include file="../components/common_css_js.jsp" %>
        <!-- OWN CSS -->
        <link rel="stylesheet" href="../css/product.css">

        <style>
            .top-banner{
                width:100%;
                background: url('../img/media/watch2.jpg') no-repeat center;
                background-size:cover;
                padding:16.875rem 0 9.375rem;

            }

            .story-section{
                width:100%;
                height:28.125rem;
                background: url('../img/media/watch3.jpg') no-repeat center;
                background-size: cover;
                padding-top:100px;
                text-align: center;
            }

            .book-food{
                width:100%;
                background:url('../img/media/watch5.png') no-repeat center;
                background-size: cover;
                background-attachment: fixed;
                background-position:0 71.9125px;
                padding:4.375rem 0;
            }
        </style>


    </head>

    <body>
        <!-- header design -->
        <header>
            <%@include file="../components/navbar.jsp" %>
        </header>

        <!-- section-1 top-banner -->
        <section id="home">
            <div class="container-fluid px-0 top-banner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6">
                            <h1 style="color: white">Where Innovation Meets Imagination: Welcome to the Apple Store.</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et purus a odio finibus bibendum amet leo.
                            </p>
                            <div class="mt-4">
                                <button class="main-btn">Order now <i class="fas fa-shopping-basket ps-3"></i></button>
                                <button class="white-btn ms-lg-4 mt-lg-0 mt-4">Order now <i class="fas fa-angle-right ps-3"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- section-2 counter -->
        <section id="counter">
            <section class="counter-section">
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count1"></span>+
                            </h2>
                            <p>SAVINGS</p>
                        </div>
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count2"></span>+
                            </h2>
                            <p>PHOTOS</p>
                        </div>
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count3"></span>+
                            </h2>
                            <p>ROCKETS</p>
                        </div>
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count4"></span>+
                            </h2>
                            <p>GLOBES</p>
                        </div>
                    </div>
                </div>
            </section>
        </section>

        <!-- section-3 about-->
        <section id="about">
            <div class="about-section wrapper">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7 col-md-12 mb-lg-0 mb-5">
                            <div class="card border-0">
                                <img decoding="async" src="../img/media/watch4.jpg" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-12 text-sec">
                            <h2 style="color: white">Introducing iPhone 14 Pro Max: Redefining Excellence in Mobile Technology.</h2>
                            <p>The iPhone 14 Pro Max is here to set a new standard in mobile technology, combining advanced features, cutting-edge design, and unparalleled performance. Get ready to experience a new level of excellence with this flagship device.

                            </p>
                            <button class="main-btn mt-4">Learn More</button>
                        </div>
                    </div>
                </div>
                <div class="container food-type">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-md-12 text-sec mb-lg-0 mb-5">
                            <h2 style="color: white" >Introducing iPhone 13: The Ultimate Device for Innovation and Expression</h2>
                            <p>The iPhone 13 is here, and it's ready to elevate your iPhone experience to new heights. With powerful performance, advanced camera capabilities, stunning displays, and a sleek design.</p>
                            <ul class="list-unstyled py-3">
                                <li>A15 Bionic Chip.</li>
                                <li>Super Retina XDR Display.</li>
                                <li>Advanced Camera System.</li>
                            </ul> 
                            <button class="main-btn mt-4">Learn More</button>
                        </div>
                        <div class="col-lg-7 col-md-12">
                            <div class="card border-0">
                                <img decoding="async" src="../img/media/watch1.jpeg" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- section-3 story-->
        <section id="story">
            <div class="story-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="text-content">
                                <h2 style="color: white">Elevate Your Digital Lifestyle at the Apple Store.</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et purus a odio
                                    finibus bibendum in sit amet leo. Mauris feugiat erat tellus.</p>
                                <button class="main-btn mt-3">Read More</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- section-4 explore food-->
        <section id="explore-food">
            <div class="explore-food wrapper">
                <div class="container-fluid" style="overflow-x: hidden">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="text-content text-center mt-3">
                                <h2>Which iPhone is right for you?</h2>
                                <hr></hr>
                            </div>
                        </div>
                    </div>

                    <!--to add product dynamically-->
                    <div class="row">
                        <!--to add product dynamically-->
                        <t:pagebody categoryname="watch"></t:pagebody>
                        </div>
                    </div>
            </section>

            <!-- Section-5 testimonial-->
            <section id="testimonial">
                <div class="wrapper testimonial-section">
                    <div class="container text-center">
                        <div class="text-center pb-4">
                            <h2>Testimonial</h2>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-lg-10 offset-lg-1">
                                <div id="carouselExampleDark" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                                                aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                                                aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                                                aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <div class="carousel-caption">
                                                <img decoding="async" src="">
                                                <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                                                    live the blind texts. "</p>
                                                <h5>Johnthan Doe - UX Designer</h5>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="carousel-caption">
                                                <img decoding="async" src="">
                                                <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                                                    live the blind texts. "</p>
                                                <h5>Maccy Doe - Front End</h5>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="carousel-caption">
                                                <img decoding="async" src="">
                                                <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                                                    live the blind texts. "</p>
                                                <h5>Johnthan Doe - UX Designer</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- section-6 faq-->

            <!-- section-7 book-food-->
            <section id="book-food">
                <div class="book-food">
                    <div class="container book-food-text">
                        <div class="row text-center">
                            <div class="col-lg-9 col-md-12">
                                <h2>explore Apple new products here.</h2>
                            </div>
                            <div class="col-lg-3 col-md-12 mt-lg-0 mt-4">
                                <button class="main-btn">Learn more</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- section-8 newslettar-->
            <section id="newslettar">
                <div class="newslettar wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="sol-sm-12">
                                <div class="text-content text-center pb-3">
                                    <h2>Hurry up! Subscribe our website
                                        and get 20% Off</h2>
                                    <p>Limited time offer for this month. No credit card required. </p>
                                </div>
                                <form class="newsletter">
                                    <div class="row">
                                        <div class="col-md-8 col-12">
                                            <input class="form-control" placeholder="Email Address here" name="email" type="email">
                                        </div>
                                        <div class="col-md-4 col-12">
                                            <button class="main-btn" type="submit">Subscribe</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- section-9 footer-->
        <%@include file="../components/footer.jsp" %>

        <script>

//                        counter
            document.addEventListener("DOMContentLoaded", () => {
                function counter(id, start, end, duration) {
                    let obj = document.getElementById(id),
                            current = start,
                            range = end - start,
                            increment = end > start ? 1 : -1,
                            step = Math.abs(Math.floor(duration / range)),
                            timer = setInterval(() => {
                                current += increment;
                                obj.textContent = current;
                                if (current == end) {
                                    clearInterval(timer);
                                }
                            }, step);
                }
                counter("count1", 0, 1287, 3000);
                counter("count2", 100, 5786, 2500);
                counter("count3", 0, 1440, 3000);
                counter("count4", 0, 7110, 3000);
            });

        </script>

    </body>
</html>

