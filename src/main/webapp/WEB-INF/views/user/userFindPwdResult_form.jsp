<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{text-align: center;}
</style>
<script>
	var passwordRules = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자,  문자,  숫자 포함 형태의 8~15자리 이내의 암호 정규식

	function send(f) {
		var pwd = f.upwd.value.trim();
		var pwd2 = f.upwd2.value.trim();
		
		if(pwd == '') {
			// 비밀번호를 입력 안했을 경우
			alert('비밀번호를 입력해 주세요.');
			f.upwd.focus();
			return;
		}
		
		if(!passwordRules.test(pwd)) {
			// 비밀번호 정규식 테스트 
			alert('비밀번호는 문자, 숫자, 특수문자를 포함한 8-15자만 입력가능합니다.');
			f.upwd.value = null;
			f.upwd.focus();
			return;
		}
		
		if(pwd != pwd2) {
			// 비밀번호1 과 비밀번호2 가 같지 않을 경우
			alert('비밀번호가 맞지 않습니다.');
			f.upwd2.focus();
			return;
		}
		
		f.method="get";
		f.action="change_pwd.do";
		f.submit();
	}
</script>
</head>
<body>
	<!-- vo가 비어있을 경우 즉, 받은 값 중에 하나라도 틀린경우 또는 아예 없는 경우 -->
	<c:if test="${empty vo}">
		<p>일치하는 회원정보가 없습니다.</p>
		<input type="button" value="회원가입 하러 가기" onclick="location.href='userSignUpSelect.do'">
	</c:if>
	
	
	<!-- 조건에 맞는 데이터가 존재할 경우 -->
	<form>
		<input type="hidden" name="uid" value="${vo.uid}">
		<c:if test="${not empty vo}">
			<table border="1" align="center">
				<tr>
					<th>아이디</th>
					<td>${vo.uid}</td>
				</tr>
				
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" name="upwd" placeholder="새로운 비밀번호"></td>
				</tr>
				
				<tr>
					<th>새로운 비밀번호 확인</th>
					<td><input type="password" name="upwd2" placeholder="새로운 비밀번호 확인"></td>
				</tr>
			</table>
			<input type="button" value="변경하기" onclick="send(this.form)">
		</c:if>
	</form>
	
	<input type="button" value="돌아가기" onclick="location.href='userLogin_form.do'">
</body>
</html>