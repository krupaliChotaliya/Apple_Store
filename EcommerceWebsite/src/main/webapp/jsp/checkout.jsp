<%@page import="com.ecommerce.Dao.ProductDao"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! login first");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page import="com.ecommerce.entities.User"%>
<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.Dao.OrderDao"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Integration</title>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <style>
            body{
                overflow-x: hidden;
            }
            header{
                width: 100%;
                margin-bottom: 30px;
            }
            .test1 , .test2 {
                flex-basis: 50%;
            }
            .demo{
                display: flex;
                flex-wrap: wrap;
            }
            @media screen and (max-width: 600px) {
                .test1 , .test2 {
                    flex-basis: 100%;
                }
            }

        </style>
    </head>
    <%@include file="../components/common_css_js.jsp" %>
    <body>
        <header>
            <%@include file="../components/navbar.jsp" %>
        </header>

        <%@include file="../components/message.jsp" %>

        <form action="../OrderCreation" method="post" id="shippingForm">
            <div class="demo">         
                <div class=" test1">                          
                    <h3>Shipping Address</h3>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" class="form-control" name="name"  value="<%= user.getUserName()%>" id="name" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Phone no</label>
                        <input type="number" class="form-control" name="phoneno" value="<%= user.getUserPhone()%>" id="phoneno"  placeholder="Phone no">
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <select class="form-control custom-select" name="state">
                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chhattisgarh">Chhattisgarh</option>
                            <option value="Gujarat">Gujarat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                            <option value="Goa">Goa</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="Odisha">Odisha</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttarakhand">Uttarakhand</option>
                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                            <option value="West Bengal">West Bengal</option>
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                            <option value="Daman and Diu">Daman and Diu</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Lakshadweep">Lakshadweep</option>
                            <option value="Puducherry">Puducherry</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Pincode</label>
                        <input type="number" name="pincode" class="form-control" id="pincode" placeholder="Pincode">
                    </div>
                    <div class="form-group">
                        <label for="">City</label>
                        <input type="text" name="city" class="form-control" id="city" placeholder="City">
                    </div>
                    <div class="form-group">
                        <label for="landmark">landmark</label>
                        <input type="text" name="landmark" class="form-control" id="landmark" placeholder="landmark (optional)">
                    </div>
                    <div class="form-group">
                        <label for="Address">Address</label>
                        <textarea class="form-control" name="address"  id="address"><%= user.getUserAddress()%> </textarea>
                    </div>  

                </div>     
                <div class="test2">    
                    <div class="card bg-dark text-white">
                        <div class="cart-body"> </div>               
                    </div>
                    <button type="submit" class="btn btn-success text-white mt-3 cart-checkout">Checkout</button>
                </div>
            </div>
        </form>        


        <!-- start toast :: error msg-->
        <div class="toast align-items-center position-fixed top-0 end-0 text-bg-danger mt-5 mr-2 p-2 border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body fs-6" id="toast-content">
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
        <!--end toast-->




        <script>

            $(document).ready(function () {

                //validation of delivery form
                function validation() {
                    var phone = /^\d{10}$/;
                    var pincodePattern = /^\d{6}$/;
                    var name = document.getElementById('name').value;
                    var phoneno = document.getElementById('phoneno').value;
                    var pincode = document.getElementById('pincode').value;
                    var city = document.getElementById('city').value;
                    var landmark = document.getElementById('landmark').value;
                    var address = document.getElementById('address').value;

                    if (name == "")
                    {
                        document.getElementById('toast-content').innerHTML = "please enter name";
                        $(".toast").toast("show");
                        return true;
                    }

                    if (!phoneno.match(phone))
                    {
                        document.getElementById('toast-content').innerHTML = "please enter valid phone no";
                        $(".toast").toast("show");
                        return true;
                    }


                    if (!pincode.match(pincodePattern))
                    {
                        document.getElementById('toast-content').innerHTML = "please enter valid pincode";
                        $(".toast").toast("show");
                        return true;
                    }

                    if (city == "")
                    {
                        document.getElementById('toast-content').innerHTML = "please enter city";
                        $(".toast").toast("show");
                        return true;
                    }

                    if (landmark == "")
                    {
                        document.getElementById('toast-content').innerHTML = "please enter landmark";
                        $(".toast").toast("show");
                        return true;
                    }
                    if (address == "")
                    {
                        document.getElementById('toast-content').innerHTML = "please enter address";
                        $(".toast").toast("show");
                        return true;
                    }
                }
                const shippingForm = document.getElementById('shippingForm');
                shippingForm.addEventListener('submit', handleFormSubmit);

                function handleFormSubmit(event) {

                    console.log("hi");
                    if (validation()) {

                        event.preventDefault();
                    }
                }

            });
        </script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            //payment prompt
            <%
                String orderId = (String) session.getAttribute("orderId");
                if (orderId != null) {
            %>

            let amount = $("#payment_field").val();

            let option = {
                key: 'rzp_test_cYbIr5dlXYJiZs',
                amount: amount * 100,
                currency: 'INR',
                name: 'Apple Store',
                description: 'Payment',
                order_id: '<%= orderId%>',
                handler: function (response) {
                    console.log(response.razorpay_payment_id);
                    console.log(response.razorpay_order_id);
                    console.log(response.razorpay_signature);
                    console.log("successful..");
                    updatePayment(response.razorpay_payment_id, response.razorpay_order_id, "paid");
                },
                prefill: {
                    name: "",
                    email: "",
                    contact: "",
                },
                notes: {
                    address: "",

                },
                "theme": {
                    "color": "#3399cc"
                }
            }
            let rzp = new Razorpay(option);
            rzp.on('payment.failed', function (response) {
                console.log(response.error.code);
                console.log(response.error.description);
                console.log(response.error.source);
                console.log(response.error.step);
                console.log(response.error.reason);
                console.log(response.error.metadata.order_id);
                console.log(response.error.metadata.payment_id);
            });
            rzp.open();

            function updatePayment(payment_id, order_id, status) {

                $.ajax({
                    url: "../OrderProcess",
                    data: JSON.stringify({
                        payment_id: payment_id,
                        order_id: order_id,
                        status: status
                    }),
                    type: "post",
                    contentType: "application/json",
                    dataType: 'json',
                    success: function (response) {

                        console.log("entered sucess");
                        if (response == "success") {

                            alert("sucess");
                        }

                    },
                    error: function (error) {
                        if (error == "failed") {

                            alert("fail");
                        }
                    }
                })

            }

        </script>
        <%
            }
            session.removeAttribute("orderId");
        %>
    </body>
</html>
