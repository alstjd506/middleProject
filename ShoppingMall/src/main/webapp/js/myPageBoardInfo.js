document.getElementById('modBtn').addEventListener('click', function() {
    
    document.getElementById('boardTitle').readOnly = false;
    document.getElementById('boardContent').readOnly = false;

    document.getElementById('modBtn').style.display = 'none';
    document.getElementById('saveBtn').style.display = 'inline';
});
