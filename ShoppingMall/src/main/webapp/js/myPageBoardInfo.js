document.getElementById('modBtn').addEventListener('click', function() {
    
    document.getElementById('boardTitle').readOnly = false;
    document.getElementById('boardContent').readOnly = false;

    document.getElementById('modBtn').style.display = 'none';
    document.getElementById('saveBtn').style.display = 'inline';
});

document.getElementById('saveBtn').addEventListener('click', function() {
    const boardNo = document.getElementById('boardNo').value;
    const boardTitle = document.getElementById('boardTitle').value;
    const boardContent = document.getElementById('boardContent').value;
   	
   	 const params = new valueParam({
        boardNo: boardNo,
        boardTitle: boardTitle,
        boardContent: boardContent});

    fetch('myPageBoardUpdate.do', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: params.toString()
    })
    .then(resolve => resolve())
    .then(result => {
        if (result.includes("성공")) {
            window.location.href = 'myPageBoard.do';
        } else {
            alert('업데이트에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});