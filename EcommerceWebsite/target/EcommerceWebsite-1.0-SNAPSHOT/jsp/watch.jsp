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


            #hero {
                width: 100%;
                height: 80vh;
                background: #37517e;
                color: white;
                background-color: #8BC6EC;
                background-image: linear-gradient(135deg, #cacad9 0%, #033364 100%);

            }
            #hero .btn-get-started {
                padding: 14px 28px;
                background: linear-gradient(180deg, #040557 0%, #7376b8 100%);
                border: none;
            }

            #hero h1 {
                margin: 0 0 40px 0;
                font-size: 3rem;
                font-weight: 700;
                line-height: 56px;
                text-transform: uppercase;
                background: linear-gradient(180deg, #040557 0%, #280768 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;

            }
            #hero h2 {
                font-size: 1.5rem;
                line-height: 24px;
                margin-bottom: 30px;
                color: white
            }

            @media (max-width: 991px) {
                #hero {
                    height: auto;
                    text-align: center;
                }


                #hero .hero-img {
                    text-align: center;
                    height: 40%;
                }

                #hero .hero-img img {
                    width: 50%;
                }

            }
            @media (max-width: 992px)  {
                #hero h1 {
                    font-size: 3rem;
                    line-height: 60px;

                }

                #hero h2 {
                    font-size: 1.3rem;
                    line-height: 30px;
                    margin-bottom: 30px;
                }

                #hero .hero-img img {
                    width: 80%;
                }

                #hero .btn-get-started {
                    padding: 14px 28px;
                    background: linear-gradient(180deg, #040557 0%, #7376b8 100%);

                }

            }
            @media (max-width: 575px) {


                #hero .hero-img img {
                    width: 90%;
                }


                #hero h2 {
                    font-size: 1rem;

                }

            }

        </style>


    </head>

    <body>
        <!-- header design -->
        <header>
            <%@include file="../components/navbar.jsp" %>
        </header>
        <main id="hero" class="d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-3 order-lg-1"    data-aos="fade-up" data-aos-delay="200">
                        <h1>Smart Watch 2.0</h1>
                        <h2>Apple continues to push the boundaries of innovation, providing users with exceptional products.</h2>
                        <div class="d-flex justify-content-center justify-content-lg-start" style="margin-bottom:50px">                        
                            <button class="btn btn-primary btn-lg btn-get-started mb-3" >order now</button>
                        </div>
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2 hero-img mb-5" data-aos="zoom-in" data-aos-delay="200">
                        <img src="../img/media/hero_watch.png" class="img-fluid animated" alt="">
                    </div>
                </div>
            </div>
        </main>

        <!-- section-2 counter -->
        <section id="counter">
            <section class="counter-section">
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count1"></span>+
                            </h2>
                            <p>Orders</p>
                        </div>
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count2"></span>+
                            </h2>
                            <p>Reviews</p>
                        </div>
                        <div class="col-md-3 mb-lg-0 mb-md-0 mb-5">
                            <h2>
                                <span id="count3"></span>+
                            </h2>
                            <p>Customers</p>
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
                                <h2>Which Watch is right for you?</h2>
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

