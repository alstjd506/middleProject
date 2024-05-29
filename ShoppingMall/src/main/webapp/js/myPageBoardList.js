
document.querySelectorAll('.info').forEach(function(element) {
    element.addEventListener('click', function(event) {
        event.preventDefault();
        let boardNo = this.getAttribute('data-board-no');
        let form = document.getElementById('boardForm' + boardNo);
        form.submit();
    });
});