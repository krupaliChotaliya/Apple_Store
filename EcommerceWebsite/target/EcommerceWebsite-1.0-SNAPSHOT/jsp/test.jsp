<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <%@include file="../components/common_css_js.jsp" %>    
        <style>
            #hero {
                width: 100%;
                height: 80vh;
                background: #37517e;
                color: white;
                background-color: #8BC6EC;
                background-image: linear-gradient(135deg, #a09eba 0%, #070e3d 100%);

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
                #hero {
                    margin-top: 4px;

                }

                #hero .hero-img img {
                    width: 50%;
                }

                #hero h1 {
                    font-size: 3rem;

                }

                #hero h2 {
                    font-size: 3rem;

                }

            }


        </style>
    </head>

    <body>
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
    </body>
</html>
