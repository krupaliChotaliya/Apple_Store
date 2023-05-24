<html>
    <head>
        <title>title</title>
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
        <style>
            /* Style the form */
            #regForm {
                background-color: #ffffff;
                margin: 100px auto;
                padding: 40px;
                width: 70%;
                min-width: 300px;
            }

            /* Style the input fields */
            input {
                padding: 10px;
                width: 100%;
                font-size: 17px;
                font-family: Raleway;
                border: 1px solid #aaaaaa;
            }

            /* Mark input boxes that gets an error on validation: */
            input.invalid {
                background-color: #ffdddd;
            }

            /* Hide all steps by default: */
            .tab {
                display: none;
            }

            /* Make circles that indicate the steps of the form: */
            .step {
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbbbbb;
                border: none;
                border-radius: 50%;
                display: inline-block;
                opacity: 0.5;
            }

            /* Mark the active step: */
            .step.active {
                opacity: 1;
            }

            /* Mark the steps that are finished and valid: */
            .step.finish {
                background-color: #04AA6D;
            }
        </style>
        <%@include file="../components/common_css_js.jsp" %>
    </head>

    <body class="bg-dark">
        <%@include file="../components/navbar.jsp" %>
        <form id="regForm" action="" class="bg-light">
            <div class="tab"> <h3 class="m-3">Your Order:</h3>
                <div class="cart-body">
                </div>
            </div>

            <div class="tab"> <h3 class="m-3">Delivery Address: </h3>
                <div class="row">
                    <div class="col-lg-6">
                        <p><input placeholder="Name..." oninput="this.className = ''"></p>
                        <p><input placeholder="Phone..." oninput="this.className = ''"></p>
                        <p><input placeholder="Pincode..." oninput="this.className = ''"></p>
                      
                    </div>

                    <div class="col-lg-6">
                        <p><input placeholder="City..." oninput="this.className = ''"></p>
                        <p> Select State : <select class="m-2">
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
                        </select><p>
                        <p><input placeholder="Landmark..." oninput="this.className = ''"></p>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                          <p><input placeholder="Address..." oninput="this.className = ''"></p>
                        </div>
                          
                    </div>
                 
                </div>


            </div>

            <div class="tab"><h3 class="m-3">Payment: </h3>
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
                                            <input type="password"  class="form-control form-control-lg"
                                                   placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                            <label class="form-label" for="typeText">Cvv</label>
                                        </div>
                                    </div>
                                </div>
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
                        </div>
                    </div>

                </div>
            </div>

           
            <div style="overflow:auto;">
                <div style="float:right;">
                    
                    <button type="button"  class="btn btn-secondary btn-lg" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                    <button type="button" class="btn btn-success text-white btn-lg" id="nextBtn" onclick="nextPrev(1)">Next</button>
                </div>
            </div>

            <!-- Circles which indicates the steps of the form: -->
            <div style="text-align:center;margin-top:40px;">
                <span class="step"></span>
                <span class="step"></span>
                <span class="step"></span>
            </div>

        </form>


    </body>
    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form ...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            // ... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "Checkout";
            } else {
                document.getElementById("nextBtn").innerHTML = "Next";
            }
            // ... and run a function that displays the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm())
                return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form... :
            if (currentTab >= x.length) {
                //...the form gets submitted:
                document.getElementById("regForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false:
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class to the current step:
            x[n].className += " active";
        }
    </script>
    <script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</html>
