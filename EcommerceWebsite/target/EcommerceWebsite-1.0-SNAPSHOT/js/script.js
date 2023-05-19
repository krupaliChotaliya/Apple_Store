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

            //        json.Stringify => to convert array into string
            localStorage.setItem("cart", JSON.stringify(Products));
//            console.log("add product for first time");
            showtoast("product is added Successfully!!");
        } else
        {
            //cart in already present

            //return array
            let pcart = JSON.parse(cart);


//            product is already present just increase its quantity
            let oldProduct = pcart.find((item) => item.productID === pId);

            if (oldProduct)
            {
                if (oldProduct.productQuantity <= pQuantity - 1)
                {
                    oldProduct.productQuantity = oldProduct.productQuantity + 1;
                    pcart.map((item) => {
                        if (item.productID === oldProduct.productID)
                            item.productQuantity = oldProduct.productQuantity;
                    });

                    localStorage.setItem("cart", JSON.stringify(pcart))
//                console.log("product quantity has been increased!!" + oldProduct.productQuantity);
                    showtoast(oldProduct.productName + " quantity has been increased by " + oldProduct.productQuantity);


                } else
                {
                    console.log("product is not available");
                    showtoast("We're Sorry !! Product is not available");
                }

            } else
            {
                //we have add product
                let product = {productID: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
                pcart.push(product);
                localStorage.setItem("cart", JSON.stringify(pcart));
//                console.log("product is added!!");
                showtoast(" Product is added Successfully!!");
            }
        }
        updateCart();

    } else
    {
//        console.log("product is not available");
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
//        console.log("cart is empty");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".cart-items").html("(0)");
        $(".cart-checkout").addClass("disabled");
    } else {
//        console.log("cart have some items..");
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
        cart.map((item) => {

            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productPrice * item.productQuantity}</td>
                    <td><button class="btn btn-danger" onclick="deleteItemFromCart('${item.productID}')">remove</button></td>
                    <td><button type="button" class="btn btn btn-light">edit</button></td>
                </tr>    
            `
        })

        table = table + `</table>`;
        $(".cart-body").html(table);
        $(".cart-checkout").removeClass("disabled");

    }
}

$(document).ready(function () {
    updateCart();
})

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
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newProduct = cart.filter((item) =>
        item.productID != pid
    );
    localStorage.setItem("cart", JSON.stringify(newProduct));

    updateCart();
    showtoast("Product is Deleted.");
}