//when user click on cart this function is executed and it will add product into localstorage.
function addToCart(pId, pQuantity, pName, pPrice) {
    if (pQuantity > 0) {
        //return string 
        let cart = localStorage.getItem("cart");

        if (cart == null)
        {
            //add product for first time
            let Products = [];
            let product = {productID: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
            Products.push(product);

//            json.Stringify => to convert array into string
            localStorage.setItem("cart", JSON.stringify(Products));

            showtoast("product is added Successfully!!");

        } else
        {
            let pcart = JSON.parse(cart);
            //we have add product
            let product = {productID: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));

            showtoast("Product is added Successfully!!");
        }
        updateCart();
    } else
    {
        showtoast("We're Sorry !! Product is not available");
    }
}
;

//update cart
function updateCart() {

    let cartString = localStorage.getItem("cart");

    //return javascript object
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        $(".cart-body").html("<h3>Your cart is empty</h3>");
        $(".cart-items").html("(0)");
        $(".cart-checkout").addClass("disabled");
    } else {

        $(".cart-items").html(`(${cart.length})`);
        let table = `
         <table class="table table-striped table-dark">
            <thead class="thead-dark">
                <tr>
                    <th>Name</th>
                    <th>Price</th> 
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                </tr>         
            </thead>
        `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                <tr>                   
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>                    
                        <div class="container">
                             <input type="hidden" name="productname" value="${item.productName}"/>
                             <input type="hidden" name="productprice" value="${item.productPrice}"/>
                            <button type="button"  class="mb-2" onclick="decrementValue(${item.productID})" value="" style="width:25px" /><i class="fa fa-minus"></i></button>
                            <input type="text" name="quantity" class="text-center" id="${item.productID}"  maxlength="2" size="1" value="${item.productQuantity}"/>
                            <button type="button" class="mt-2" onclick="incrementValue(${item.productID})" value="" style="width:25px" /><i class="fa fa-plus"></i></button>
                        </div>
                    </td>
                    <td>${item.productPrice * item.productQuantity}</td>
                 
                    <td><button class="btn btn-danger"  onclick="deleteItemFromCart(${item.productID})">remove</button></td>
                    <td><button type="button" class="btn btn btn-light">edit</button></td>
                </tr>    
            `
            totalPrice += item.productPrice * item.productQuantity;
            $("#" + item.productID).prop('disabled', true);

        })

        table += `<td  colspan='6' class="text-right font-weight-bold py-2"><h5>Total Amount : &#8377; ${totalPrice}/- </h5>
           <input type="hidden" name="total" value="${totalPrice}"/> </td>`
        table = table + `</table>`;

        $(".cart-body").html(table);
        $(".cart-checkout").removeClass("disabled");

    }
}

$(document).ready(function () {
    updateCart();
});

// toast
function showtoast(content) {

    $("#toast").addClass("show");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("show");
    }, 3000);
}

//to remove product from cart
function deleteItemFromCart(pid)
{
    swal({
        title: "Are you sure?",
        text: "Do you really want to remove item from cart?",
        icon: "warning",
        buttons: ["No", "Yes"],
        dangerMode: true,
    })
            .then((willDelete) => {
                if (willDelete) {
                    let cart = JSON.parse(localStorage.getItem('cart'));
                    let newProduct = cart.filter((item) =>
                        item.productID != pid
                    );
                    localStorage.setItem("cart", JSON.stringify(newProduct));
                    updateCart();
                    location.reload();
                }
            });
}


// quantity increase button
function incrementValue(pid)
{
    var value = parseInt(document.getElementById(pid).value, 10);

    value = isNaN(value) ? 0 : value;
    if (value < 10) {
        value++;
        document.getElementById(pid).value = value;
        let qty = document.getElementById(pid).value;

        //product is already present just increase its quantity

        let pcart = JSON.parse(localStorage.getItem('cart'));
        if (pcart != null && pcart.length > 0)
        {

            let oldProduct = pcart.find((item) => item.productID === pid);

            if (oldProduct)
            {
                console.log(qty);
                if (qty > 1 && qty <= 10)
                {
                    oldProduct.productQuantity = parseInt(qty);
                    pcart.map((item) => {
                        if (item.productID === oldProduct.productID)
                            item.productQuantity = oldProduct.productQuantity;

                    });

                    localStorage.setItem("cart", JSON.stringify(pcart))
                    console.log("product quantity has been increased!!" + oldProduct.productQuantity);
                    showtoast(oldProduct.productName + " quantity has been increased by " + oldProduct.productQuantity);
                }

            }
        }
    }
    updateCart();

}
// quantity decrese button
function decrementValue(pid)
{

    var value = parseInt(document.getElementById(pid).value, 10);

    value = isNaN(value) ? 0 : value;
    if (value > 1) {
        value--;

        document.getElementById(pid).value = value;

        let qty = document.getElementById(pid).value;

        //product is already present just increase its quantity
        let pcart = JSON.parse(localStorage.getItem('cart'));
        if (pcart != null && pcart.length > 0)
        {
            console.log(qty);
            let oldProduct = pcart.find((item) => item.productID === pid);
            if (oldProduct)
            {
                if (qty >= 1)
                {
                    oldProduct.productQuantity = parseInt(qty);
                    pcart.map((item) => {
                        if (item.productID === oldProduct.productID)
                            item.productQuantity = oldProduct.productQuantity;

                    });

                    localStorage.setItem("cart", JSON.stringify(pcart))
                    console.log("product quantity has been Decresed!!" + oldProduct.productQuantity);

                    showtoast(oldProduct.productName + " quantity has been Decresed by " + oldProduct.productQuantity);
                }

            }
        }

    }
    updateCart();
}

