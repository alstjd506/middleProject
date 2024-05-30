/**
 * 
 */
document.querySelectorAll('.detail').forEach(function(element) {
    element.addEventListener('click', function(event) {
        event.preventDefault();
        var orderNo = this.getAttribute('data-order-no');
        var form = document.getElementById('orderForm' + orderNo);
        form.submit();
    });
});