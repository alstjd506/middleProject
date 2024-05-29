document.getElementById('modBtn').addEventListener('click', function() {
    
    document.getElementById('bodna').readOnly = false;
    document.getElementById('bodco').readOnly = false;

    document.getElementById('modBtn').style.display = 'none';
    document.getElementById('saveBtn').style.display = 'inline';
});