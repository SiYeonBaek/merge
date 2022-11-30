<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body>
	<!-- header -->
	<div id="header">
		<div class="header_nav_all">
			<!-- main으로 연결~~ -->
			<a href="admin_main.do" class="admin_hidden">AdminPage</a>
			<div class="navbar_left">
				<a href="index.do">Travel Tour Reservation System</a>
			</div>
			<!-- 상품페이지 연결 부분 -->
			<div class="navbar_main">
				<a href="#">국내여행</a> 	<!-- domestic_traveling.do -->
				<a href="#">해외여행</a> 	<!-- foreign_traveling.do -->
				<a href="#">자유여행</a>	<!-- free_traveling.do -->
				<a href="#">고객센터</a>	<!-- customer_service.do -->
			</div>
			
				<div class="navbar_right">
					<a href="userLogin_form.do">Login</a>
					<a href="userSignUpSelect.do">Join</a>
				</div>
		</div>
	</div>
</body>
</html>