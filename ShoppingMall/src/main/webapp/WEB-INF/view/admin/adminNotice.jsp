<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="outer">
    <br> <h2 align="center">공지글 작성</h2>
    <form action="#" method="post">
    <input type="hidden" name="userNo" value="">
        <table align="center" id="enrollForm">
            <tr>
                <th width="10%">제목</th>
                <td><input type="text" name="title" id="title" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="content" id="content" cols="50" rows="20" style="resize:none;" 
                    required></textarea>
                </td>
            </tr>
        </table>
            
        <div align="center">
            <button type="button" id="add">등록</button>
            <button type="button" id="cancle">취소</button>
            <!-- history.back(): 뒤로가기 전용 함수 -->
        </div>
    </form>
</div>
<script src="js/adminNotice.js">
</script>