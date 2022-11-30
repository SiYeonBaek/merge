<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="Text1">그 동안 홈페이지를 이용해 주셔서 감사합니다.</div>
	
	<div>
		<ul>
			<li>
				이름
				<input type="text" value="${vo.uname}">
			</li>
			
			<li>
				회원탈퇴사유
				<textarea rows="3" cols="10"></textarea>
			</li>
			
			<li>
				<input type="button" value="탈퇴하기" onclick="location.href='userLeave.do?uidx=${vo.uidx}'">
			</li>
		</ul>
	</div>
</body>
</html>