<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{text-align: center;}
</style>
<script>
	var phoneRules = /^01[016789]{1}?[0-9]{3,4}?[0-9]{4}$/;

	function send(f) {
		var id = f.uid.value.trim();
		var name = f.uname.value.trim();
		var birth = f.ubirth.value.trim();
		var phone = f.uphone.value.trim();
		
		if(id == '') {
			// 아이디를 입력 안했을 경우
			alert('아이디를 입력해 주세요.');
			f.uid.focus();
			return;
		}
		
		if(name == '') {
			// 이름을 입력 안했을 경우
			alert('이름을 입력해 주세요.');
			f.uname.focus();
			return;
		}
		
		if(birth == '') {
			// 생년월일을 입력하지 않았을 경우
			alert('생년월일을 입력해 주세요.');
			f.ubirth.focus();
			return;
		} 
		
		if(birth.length != 8) {
			// 생년월일이 8자가 아닐 경우
			alert('생년월일은 8자리 입력해 주세요.');
			f.ubirth.value = null;
			f.ubirth.focus();
			return;
		}
		
		if(phone == '') {
			// 핸드폰 번호를 입력하지 않았을 경우
			alert('핸드폰 번호를 입력해 주세요.');
			f.uphone.focus();
			return;
		}
		
		if(!phoneRules.test(phone)) {
			// 핸드폰 정규식과 맞지 않을 경우
			alert('올바른 핸드폰 번호를 입력해 주세요.');
			f.uphone.value = null;
			f.uphone.focus();
			return;
		} 
		
		f.method="get";
		f.action = "findPwd.do";
		f.submit();
	}
</script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<hr>
	<form>
		<table border="1" align="center">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="uid" value="${param.uid}" placeholder="아이디을 입력하세요.">
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="uname" placeholder="이름을 입력하세요.">
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="ubirth" placeholder="생년월일 8자리를 입력해 주세요. 예) 19900101"
			               oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				</td>
			</tr>
			
			<tr>
				<th>핸드폰 번호</th>
				<td colspan="2">
				<input type="text" name="uphone" placeholder="휴대폰 번호를 입력해 주세요. 예) 01012345678"
			   	       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				</td> 
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" value="비밀번호 찾기" onclick="send(this.form)">
					<input type="button" value="돌아가기" onclick="location.href='userLogin_form.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>