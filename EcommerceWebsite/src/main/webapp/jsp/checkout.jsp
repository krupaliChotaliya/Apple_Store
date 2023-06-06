<html>
    <head>
        <title>Checkout</title>

        <%@include file="../components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        <form action="../checkoutServlet" method="post">
            <div class="container py-2 mt-4 " >
                <div class="row rounded-3 " >
                    <div class="col-lg-7 mt-5">
                        <div class="card bg-dark">
                            <div class="cart-body">
                            </div>
                            <a href="#!" class="text-white text-center " style="text-decoration: none"><i  class="fas fa-long-arrow-alt-left me-2"></i>Bact to shop</a>
                        </div>    
                    </div>
                    <div class="col-lg-5">
                        <h3>Shipping Address</h3>
                        <form class="form-control mt-4">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <input type="text" class="form-control" value=""  placeholder="Enter name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Phone no</label>
                                <input type="number" class="form-control" value="" placeholder="Phone no">
                            </div>

                            <div class="form-group">
                                <label for="state">State</label>
                                <select class=" form-control custom-select">
                                    <option value="AP">Andhra Pradesh</option>
                                    <option value="AR">Arunachal Pradesh</option>
                                    <option value="AS">Assam</option>
                                    <option value="BR">Bihar</option>
                                    <option value="CT">Chhattisgarh</option>
                                    <option value="GA">Gujarat</option>
                                    <option value="HR">Haryana</option>
                                    <option value="HP">Himachal Pradesh</option>
                                    <option value="JK">Jammu and Kashmir</option>
                                    <option value="GA">Goa</option>
                                    <option value="JH">Jharkhand</option>
                                    <option value="KA">Karnataka</option>
                                    <option value="KL">Kerala</option>
                                    <option value="MP">Madhya Pradesh</option>
                                    <option value="MH">Maharashtra</option>
                                    <option value="MN">Manipur</option>
                                    <option value="ML">Meghalaya</option>
                                    <option value="MZ">Mizoram</option>
                                    <option value="NL">Nagaland</option>
                                    <option value="OR">Odisha</option>
                                    <option value="PB">Punjab</option>
                                    <option value="RJ">Rajasthan</option>
                                    <option value="SK">Sikkim</option>
                                    <option value="TN">Tamil Nadu</option>
                                    <option value="TG">Telangana</option>
                                    <option value="TR">Tripura</option>
                                    <option value="UT">Uttarakhand</option>
                                    <option value="UP">Uttar Pradesh</option>
                                    <option value="WB">West Bengal</option>
                                    <option value="AN">Andaman and Nicobar Islands</option>
                                    <option value="CH">Chandigarh</option>
                                    <option value="DN">Dadra and Nagar Haveli</option>
                                    <option value="DD">Daman and Diu</option>
                                    <option value="DL">Delhi</option>
                                    <option value="LD">Lakshadweep</option>
                                    <option value="PY">Puducherry</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Pincode</label>
                                <input type="number" class="form-control" id="exampleInputPassword1" placeholder="Pincode">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">City</label>
                                <input type="number" class="form-control" id="exampleInputPassword1" placeholder="City">
                            </div>
                            <div class="form-group">
                                <label for="landmark">landmark</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="landmark (optional)">
                            </div>
                            <div class="form-group">
                                <label for="Address">Address</label>
                                <textarea class="form-control"></textarea>
                            </div>
                            <button type="submit" class="btn btn-warning btn-block text-white">Checkout</button>
                        </form>
                    </div>
                </div>
            </div>
        </form>    
    </body>
</html>
