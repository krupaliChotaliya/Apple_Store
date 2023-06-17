<%@include file="../components/common_css_js.jsp" %>

<style>
    /* Footer CSS */

.footer_wrapper {
    background-color: black;
    color: white;
    padding-bottom: 0rem;
    overflow-x: hidden;
    
}

.footer_wrapper .footer-logo img {
    width: 25rem;
    height: auto;
    object-fit: cover;
}

.footer_wrapper h5 {
    color: white;
    margin-bottom: 2rem;
    font-weight: 600;
    text-transform: capitalize;
    font-size: 2rem;
}

.footer_wrapper h5 a {
    color: white;
}

.footer_wrapper ul {
    
    list-style: none;
    display: flex;
    align-items: center;
}


.footer_wrapper ul li {
   
    margin-right: 1.5rem;
}

.footer_wrapper .copyright-section p {
    margin: 0;
    padding: 3rem 0;
    text-align: center;
}


/* whatsapp intgration */
.whatsapp-icon {
    position: relative;
}

.whatsapp-icon .whatsapp {
    position: fixed;
    width: 6rem;
    z-index: 1;
    bottom: 1rem;
    right: 0.5rem;
}

.whatsapp-icon .whatsapp img {
    width: 5.5rem;

}
</style>



<!-- Footer section Start-->
<section class="footer_wrapper wrapper mb-0">
    <div class="container">
        <div class="row  mb-5">

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
    <div class="container-fluid copyright-section ">
        <p>Copyright© 2023 Apple Inc. All Rights Reserved</p>
    </div>
</section>
<!-- Footer Section Exit  -->