<!DOCTYPE html>
<html>
    <head>
        <title>Payment Confirmation</title>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </head>
    <body>
        <h1>Payment Confirmation</h1>
        <p>Order ID: ${orderId}</p>

        <script>

            var options = {
                "key": "rzp_test_cYbIr5dlXYJiZs",
                "amount": "parseInt(<%= request.getParameter("amount")%>) * 100%>",
                "currency": "INR",
                "name": "Your Company",
                "description": "Payment for Order #${orderId}",
                "handler": function (response) {
                    // Handle the payment success
                    alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                },
                "prefill": {
                    "name": "<%= request.getParameter("customerName")%>",
                    "email": "<%= request.getParameter("email")%>"
                }
            }
        </script>

    </body>
</html>