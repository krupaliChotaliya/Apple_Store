<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
         <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
            rel="stylesheet"
            />
        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        
        <div class="row">
            
       
        <div class=" mx-auto col-10 col-md-8 col-lg-6">
           
         <div class="card bg-dark text-white rounded-3 mb-5">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="mb-0">Card details</h5>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                     class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                            </div>

                            <p class="small mb-2">Card type</p>
                            <a href="#!" type="submit" class="text-white"><i
                                    class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                            <a href="#!" type="submit" class="text-white"><i
                                    class="fab fa-cc-visa fa-2x me-2"></i></a>
                            <a href="#!" type="submit" class="text-white"><i
                                    class="fab fa-cc-amex fa-2x me-2"></i></a>
                            <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                            <form class="mt-4">
                                <div class="form-outline form-white mb-4">
                                    <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                           placeholder="Cardholder's Name" />
                                    <label class="form-label" for="typeName">Cardholder's Name</label>
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                           placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                    <label class="form-label" for="typeText">Card Number</label>
                                </div>

                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div class="form-outline form-white">
                                            <input type="text" id="typeExp" class="form-control form-control-lg"
                                                   placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                            <label class="form-label" for="typeExp">Expiration</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-outline form-white">
                                            <input type="password" id="typeText" class="form-control form-control-lg"
                                                   placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                            <label class="form-label" for="typeText">Cvv</label>
                                        </div>
                                    </div>
                                </div>

                            </form>

                            <hr class="my-4">

                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Subtotal</p>
                                <p class="mb-2">$4798.00</p>
                            </div>

                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Shipping</p>
                                <p class="mb-2">$20.00</p>
                            </div>

                            <div class="d-flex justify-content-between mb-4">
                                <p class="mb-2">Total(Incl. taxes)</p>
                                <p class="mb-2">$4818.00</p>
                            </div>

                            <button type="button" class="btn btn-warning btn-block btn-lg">
                                <div class="d-flex justify-content-between">
                                    <span>$4818.00</span>
                                    <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                </div>
                            </button>

                        </div>
        </div>
             </div>
         </body>
         <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>
</html>
