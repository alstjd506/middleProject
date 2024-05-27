<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Join Action</title>
</head>
<body>
    <%
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        String userName = request.getParameter("userName");
        String userPhone = request.getParameter("userPhone");
        String userPost = request.getParameter("userPost");
        String userAddr = request.getParameter("userAddr");
        String userDetailAddr = request.getParameter("userDetailAddr");

        String dbURL = "http:localhost:8080/ShoppingMall/join.do"; // 데이터베이스 URL 수정 필요
        String dbUser = "mid"; // 데이터베이스 사용자명 수정 필요
        String dbPassword = "mid"; // 데이터베이스 비밀번호 수정 필요

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "INSERT INTO user (userId, userPw, userName, userPhone, userPost, userAddr, userDetailAddr) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            pstmt.setString(3, userName);
            pstmt.setString(4, userPhone);
            pstmt.setString(5, userPost);
            pstmt.setString(6, userAddr);
            pstmt.setString(7, userDetailAddr);
            pstmt.executeUpdate();

            out.println("Join Successful");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
