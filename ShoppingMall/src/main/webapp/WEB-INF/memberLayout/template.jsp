<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
       	<link rel="icon" href="images/icon-dog.png">
        <title>Dog good Choice</title>
        <!-- Favicon-->
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link
			href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
			rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/main_styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
		crossorigin="anonymous"></script>
        <style>
        	body{
        		padding-top:50px;
        	}
        	
        </style>
    </head>
    <body>
        <!-- Navigation-->
        	<tiles:insertAttribute name="nav" />
        <!-- Header-->
       		<tiles:insertAttribute name="header" />
        <!-- SideBar-->
        <div id ="main-content">
      		<tiles:insertAttribute name="menu" />
        <!-- Section-->
        	<tiles:insertAttribute name="body" />
        </div>
        <!-- Footer-->
        	<tiles:insertAttribute name="footer" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>         
    </body>
</html>
