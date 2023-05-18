function addToCart(pId, pQuantity, pName, pPrice) {
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
//        console.log("add product for first time");
    }
    else
    {

        //cart in already present

        //return array
        let pcart = JSON.parse(cart);

        
        let oldProduct = pcart.find((item) => item.productID === pId);

        if (oldProduct)
        {
             oldProduct.productQuantity = oldProduct.productQuantity + 1;
             pcart.map((item) => {
             if(item.productID === oldProduct.productID)
                 
                item.productQuantity=oldProduct.productQuantity ;
            });
            
            localStorage.setItem("cart",JSON.stringify(pcart))
           //  console.log("product quantity has been increased!!" +   oldProduct.productQuantity);

        } 
        else
        {

            //we have add product
            let product = {productID: pId, productName: pName, productPrice: pPrice, productQuantity: 1};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("product is added!!");

        }



    }

}
;