<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <title>home</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>

        <%@include file="../components/common_css_js.jsp" %>      
    </head>

    <body class="bg-dark">

        <%@include file="../components/navbar.jsp" %>
        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">

            <div class="container">
                <div class="row">
                    <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-3 order-lg-1"    data-aos="fade-up" data-aos-delay="200">
                        <h1>Experience Technology in its Finest Form at the Apple Store</h1>
                        <h2>Apple continues to push the boundaries of innovation, providing users with exceptional products.</h2>
                        <div class="d-flex justify-content-center justify-content-lg-start" style="margin-bottom:50px">                        
                            <a href="#about" class="btn-get-started" >order now</a>
                            <a href="${pageContext.request.contextPath}/img/media/home/iphone.mp4" class="glightbox btn-watch-video"><i class="fa fa-play-circle"></i></span>Watch Video</span></a>
                        </div>
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
                        <img src="${pageContext.request.contextPath}/img/media/home/14-pro-max.png" class="img-fluid animated" alt="">
                    </div>
                </div>
            </div>

        </section><!-- End Hero -->

        <main id="main">

            <!-- ======= Clients Section ======= -->

            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us section-bg">
                <div class="container-fluid" data-aos="fade-up">
                    <div class="row">
                        <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">
                            <div class="content">
                                <h3>Introducing AirPods (3rd Generation)
                                    <strong>IMMERSE YOURSELF IN WIRELESS AUDIO</strong></h3>
                                <p>
                                    Experience the next level of wireless audio with the all-new AirPods (3rd Generation). Combining cutting-edge technology, superior sound quality, and effortless connectivity, these earbuds are designed to enhance your listening experience in every way.
                                </p>
                            </div>

                            <div class="accordion-list">
                                <ul>
                                    <li>
                                        <a data-bs-toggle="collapse" class="collapse" data-bs-target="#accordion-list-1"><span>01</span> Non consectetur a erat nam at lectus urna duis? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                                        <div id="accordion-list-1" class="collapse show" data-bs-parent=".accordion-list">
                                            <p>
                                                Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                                            </p>
                                        </div>
                                    </li>

                                    <li>
                                        <a data-bs-toggle="collapse" data-bs-target="#accordion-list-2" class="collapsed"><span>02</span> Feugiat scelerisque varius morbi enim nunc? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                                        <div id="accordion-list-2" class="collapse" data-bs-parent=".accordion-list">
                                            <p>
                                                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                                            </p>
                                        </div>
                                    </li>

                                    <li>
                                        <a data-bs-toggle="collapse" data-bs-target="#accordion-list-3" class="collapsed"><span>03</span> Dolor sit amet consectetur adipiscing elit? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                                        <div id="accordion-list-3" class="collapse" data-bs-parent=".accordion-list">
                                            <p>
                                                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                                            </p>
                                        </div>
                                    </li>

                                </ul>
                            </div>

                        </div>

                        <div class="col-lg-5 align-items-stretch order-1 order-lg-2 img" style='background-image: url("${pageContext.request.contextPath}/img/media/home/airpods 3.avif");' data-aos="zoom-in" data-aos-delay="150">&nbsp;</div>
                    </div>

                </div>
            </section><!-- End Why Us Section -->

            <!-- ======= Skills Section ======= -->
            <section id="skills" class="skills">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-6 d-flex align-items-center" data-aos="fade-right" data-aos-delay="100">
                            <img src="${pageContext.request.contextPath}/img/media/home/MacBook-Air-15-Inch-Feature-Teal (1).jpg" class="img-fluid" alt="">
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 content" data-aos="fade-left" data-aos-delay="100">
                            <h3>Introducing the All-New MacBook Air 15:
                                UNLEASH YOUR PRODUCTIVITY AND CREATIVITY</h3>
                            <p class="fst-italic">
                                The MacBook Air 15 is here to revolutionize the way you work, create, and connect. Packed with powerful features and a stunning display, this ultra-thin and lightweight laptop sets a new standard for performance and portability.
                            </p>

                            <div class="skills-content">
                                <div class="progress">
                                    <span class="skill" style="color: white;">Long Battery Life<i class="val">65%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="100" style="width: 65%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="progress">
                                    <span class="skill" style="color: white;">Sound<i class="val">90%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="90" style="width: 90%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="progress">
                                    <span class="skill" style="color: white;">FaceTime HD camera<i class="val">75%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="75" style="width: 75%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="progress">
                                    <span class="skill" style="color: white;">Thin and Light Design<i class="val">55%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="55" style="width: 55%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </section><!-- End Skills Section -->

            <!-- ======= Services Section ======= -->
            <section id="services" class="services section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Services</h2>
                        <p>We are here to help. Apple-certified repairs are performed by trusted experts who use genuine Apple parts. Only Apple-certified repairs are backed by Apple. Whichever option you choose, you?ll get your product back working exactly the way it should.</p>
                    </div>

                    <div class="row">
                        <div class="col-xl-3 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bxl-dribbble"></i></div>
                                <h4><a href="">AppleCare+</a></h4>
                                <p>Get unlimited repairs for accidental damage protection, priority access to Apple experts, and more.</p>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-file"></i></div>
                                <h4><a href="">Get the latest</a></h4>
                                <p>Get up-to-date information about your Apple products including cover, repairs and much more.</p>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0" data-aos="zoom-in" data-aos-delay="300">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-tachometer"></i></div>
                                <h4><a href="">Apple Support app</a></h4>
                                <p>Get help for all of your Apple products in one place, or connect with an expert.</p>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0" data-aos="zoom-in" data-aos-delay="400">
                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-layer"></i></div>
                                <h4><a href="">Apple Repair</a></h4>
                                <p>We are here to help. Apple-certified repairs are performed by trusted experts who use genuine Apple parts.</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Services Section -->

            <!-- ======= Cta Section ======= -->
            <section id="cta" class="cta">
                <div class="container" data-aos="zoom-in">

                    <div class="row">
                        <div class="col-lg-9 text-center text-lg-start">
                            <h3>i-connect</h3>
                            <p>Step into a World of Innovation and Excellence at the Apple Store.</p>
                        </div>
                        <div class="col-lg-3 cta-btn-container text-center">
                            <a class="cta-btn align-middle" href="#">Visit Now</a>
                        </div>
                    </div>

                </div>
            </section><!-- End Cta Section -->

            <!-- ======= Portfolio Section ======= -->
            <section id="portfolio" class="portfolio">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2 style="color: white;">Discover New Products</h2>
                    </div>

                    <ul id="portfolio-flters" class="d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">
                        <li data-filter="*" class="filter-active">All</li>
                        <li data-filter=".filter-app" class="text-white">iPhone</li>
                        <li data-filter=".filter-card" class="text-white">Watch</li>
                        <li data-filter=".filter-web" class="text-white">MacBook</li>
                        <li data-filter=".filter-web" class="text-white">AirPods</li>
                    </ul>

                    <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

                        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/Apple-iPhone-14-Pro.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>iphone 14</h4>
                                <a href="${pageContext.request.contextPath}/media/airpods.jpeg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 1"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/collection-3.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>iPads</h4>
                                <a href="assets/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/watch9.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>Watchs</h4>
                                <a href="assets/img/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 2"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/3.webp" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>iPads</h4>
                                <a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 2"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/desktop3.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>Desktop</h4>
                                <a href="assets/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 2"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/colllection-2.webp" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>Macbook</h4>
                                <a href="../img/media/home/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 3"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/airpod2ndgen2.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>AirPods</h4>
                                <a href="assets/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 1"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/macbook.webp" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>Macbook</h4>
                                <a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 3"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                            <div class="portfolio-img"><img src="${pageContext.request.contextPath}/img/media/home/watchseries8_3.jpg" class="img-fluid" alt=""></div>
                            <div class="portfolio-info">
                                <h4>Watch</h4>
                                <a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
                                <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Portfolio Section -->

            <!-- ======= Team Section ======= -->
            <section id="team" class="team section-bg">
                <div class="container" data-aos="fade-up">
                    <div class="section-title">
                        <h2>Team</h2>
                        <p>For support inquiries, including product related inquiries, issues with your Apple ID, password resets, security and phishing and more, please contact Apple Support (click on Billing & Subscriptions for Apple ID, password, security & phishing issues).</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-6" data-aos="zoom-in" data-aos-delay="100">
                            <div class="member d-flex align-items-start">
                                <div class="pic"><img src="${pageContext.request.contextPath}/img/media/home/team-1.jpg" class="img-fluid" alt=""></div>
                                <div class="member-info">
                                    <h4>Walter White</h4>
                                    <span>Chief Executive Officer</span>
                                    <p>Explicabo voluptatem mollitia et repellat qui dolorum quasi</p>
                                    <div class="social">
                                        <a href=""><i class="ri-twitter-fill"></i></a>
                                        <a href=""><i class="ri-facebook-fill"></i></a>
                                        <a href=""><i class="ri-instagram-fill"></i></a>
                                        <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="member d-flex align-items-start">
                                <div class="pic"><img src="${pageContext.request.contextPath}/img/media/home/team-2.jpg" class="img-fluid" alt=""></div>
                                <div class="member-info">
                                    <h4>Sarah Jhonson</h4>
                                    <span>Product Manager</span>
                                    <p>Aut maiores voluptates amet et quis praesentium qui senda para</p>
                                    <div class="social">
                                        <a href=""><i class="ri-twitter-fill"></i></a>
                                        <a href=""><i class="ri-facebook-fill"></i></a>
                                        <a href=""><i class="ri-instagram-fill"></i></a>
                                        <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
                            <div class="member d-flex align-items-start">
                                <div class="pic"><img src="${pageContext.request.contextPath}/img/media/home/team-3.jpg" class="img-fluid" alt=""></div>
                                <div class="member-info">
                                    <h4>William Anderson</h4>
                                    <span>CTO</span>
                                    <p>Quisquam facilis cum velit laborum corrupti fuga rerum quia</p>
                                    <div class="social">
                                        <a href=""><i class="ri-twitter-fill"></i></a>
                                        <a href=""><i class="ri-facebook-fill"></i></a>
                                        <a href=""><i class="ri-instagram-fill"></i></a>
                                        <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="400">
                            <div class="member d-flex align-items-start">
                                <div class="pic"><img src="${pageContext.request.contextPath}/img/media/home/team-4.jpg" class="img-fluid" alt=""></div>
                                <div class="member-info">
                                    <h4>Amanda Jepson</h4>
                                    <span>Accountant</span>
                                    <p>Dolorum tempora officiis odit laborum officiis et et accusamus</p>
                                    <div class="social">
                                        <a href=""><i class="ri-twitter-fill"></i></a>
                                        <a href=""><i class="ri-facebook-fill"></i></a>
                                        <a href=""><i class="ri-instagram-fill"></i></a>
                                        <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section>

        </main><!-- End #main -->

    </div>  

    <!-- section-9 footer-->
    <%@include file="../components/footer.jsp" %>


</body>
</html>