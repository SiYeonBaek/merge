<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function send(f) {
		// 유효성 검사
		var userId = f.userId.value.trim();
		var userPwd = f.userPwd.value.trim();
		
		
		// 만약 ID를 입력하지 않았다면,
		if(userId == '') {
			alert('아이디를 입력해주세요.');
			return;
		}
		// 만약 PWD를 입력하지 않았다면,
		if(userPwd == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
		
		// ID, PWD 검사
		
		
		f.action = "userLogin.do";
		f.submit();
	}
</script>
</head>
<body>
	<h1>로그인</h1>
	<h3>다시 만나고 싶은 여행</h3>

	<!-- Login input -->
	<form method="get">
		<input type="text" name="userId" placeholder="아이디를 입력하세요.">
		<input type="password" name="userPwd" placeholder="비밀번호를 입력하세요.">
		<input type="button" value="로그인" onclick="send(this.form)">
		<input type="button" value="돌아가기" onclick="<!-- 돌아갈 Mapping 입력 -->">
	</form>
	
	<br>
	
	<!-- ID, PWD, 회원가입 -->
	<a href="#">아이디 찾기</a>
	<a href="#">비밀번호 찾기</a>
	<a href="userSignUpSelect.do">회원가입</a>
	
		
</body>
</html>