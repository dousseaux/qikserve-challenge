// = require duxstrap-bundle-min.js
// = require duxdash-bundle-min.js

$(function() {

    $('.add-to-cart').click(function() {
        var $this = $(this);
        $('#cart-product-name').text($this.data('productName'));
        $('#cart-product-price').text($this.data('productPrice'));
        $('#product_id').val($this.data('productId'));
        $('#product_qtt').val(1);
        $('#add-cart-modal').modal('show');
        setTimeout(function() {
            $('#product_qtt').focus();
        }, 500);
    });

});
