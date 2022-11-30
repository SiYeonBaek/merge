<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty vo}">
		<p>일치하는 아이디가 없습니다.</p>
		<input type="button" value="회원가입 하러 가기" onclick="location.href='userSignUpSelect.do'">
	</c:if>
	
	<c:if test="${not empty vo}">
		<p>당신의 아이디는 [ <b>${vo.uid}</b> ] 입니다.</p>
		<input type="button" value="로그인 하러 가기" onclick="location.href='userLogin_form.do?uid=${vo.uid}'">
		<input type="button" value="비밀번호 찾으러 가기" onclick="location.href='findPwd_form.do?uid=${vo.uid}'">
	</c:if>
	
	<input type="button" value="돌아가기" onclick="location.href='userLogin_form.do'">
</body>
</html>