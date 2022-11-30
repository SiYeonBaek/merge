<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(f) {
		var passwordRules = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자,  문자,  숫자 포함 형태의 8~15자리 이내의 암호 정규식
		
		var upwd = f.upwd.value.trim();
		var upwd2 = f.upwd2.value.trim();
		
		if(upwd == '') {
			// 비밀번호를 입력 안했을 경우
			alert('비밀번호를 입력해 주세요.');
			f.upwd.focus();
			return;
		}
		
		if(!passwordRules.test(upwd)) {
			// 비밀번호 정규식 테스트 
			alert('비밀번호는 문자, 숫자, 특수문자를 포함한 8-15자만 입력가능합니다.');
			f.upwd.value = null;
			f.upwd.focus();
			return;
		}

		if(upwd != upwd2) {
			// 비밀번호1 과 비밀번호2 가 같지 않을 경우
			alert('비밀번호가 맞지 않습니다.');
			f.upwd2.focus();
			return;
		}
		
		f.action = "changePwd.do";
		f.method = "get";
		f.submit();
	}
</script>
</head>
<body>
	<form>
		<input type="hidden" name="uidx" value="${param.uidx}">
		비밀번호 변경하기
		<input type="password" name="upwd" placeholder="새로운 비밀번호를 입력하세요.">
		<input type="password" name="upwd2" placeholder="새로운 비밀번호를 입력하세요.">
		<input type="button" value="변경하기" onclick="send(this.form)">
		<input type="button" value="뒤로하기" onclick="location.href='myPage.do?uidx=${param.uidx}&uid=${param.uid}'">
	</form>
</body>
</html>