<!-- add to cart -->
<div class="modal fade"  id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-dark" id="exampleModalLabel">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <a type="button" href="${pageContext.request.contextPath}/jsp/checkout" class="btn btn-success text-white cart-checkout" >Checkout</a>
            </div>
        </div>
    </div>
</div>

<!--toast-->
<div id="toast"></div>











