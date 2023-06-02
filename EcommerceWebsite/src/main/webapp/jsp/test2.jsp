<%@page import="com.ecommerce.helper.factoryProvider"%>
<%@page import="com.ecommerce.Dao.OrderDao"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Integration</title>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </head>
    <%@include file="../components/common_css_js.jsp" %>
    <body>
       
        <form action="../OrderCreation" method="post" id="login-form" >
            <input type="number" placeholder="enter amount" name="amount" required="true"  id="payment_field"/>
            <button  type="submit">pay</button>
        </form>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            <%
                String orderId = (String) session.getAttribute("orderId");

                if (orderId != null) {
            %>

            let amount = $("#payment_field").val();

            console.log(amount);

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

         ``   console.log("enter>>>>>>>>>>>>>>>>>");
                $.ajax({
                    url: "../OrderProcess",
                    data: JSON.stringify({
                        payment_id: payment_id,
                        order_id: order_id,
                        status: status
                    }),
                    type: "post",
                    contentType: "application/json",
                    datatype: 'json',
                    success: function (response) {

                        if(response=="success"){
                            
                             alert("sucess");
                        }
                       
                    },
                    error: function (error) {
                        
                            if(error=="failed"){
                            
                            alert("fail");
                        } 
                        
                    }

                })

            }

        </script>
        <%
            }
        %>
    </body>
</html>
