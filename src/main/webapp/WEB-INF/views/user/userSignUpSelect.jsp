<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/usercss/userSignUpSelect_css.css">
</head>
<body>
	<div class="textBox">
		<h2>::: 회원가입 ::: </h2>
	</div>

	<div class="selectBox">
		<ul>
			<li class="basic">
				<label for="basic">
					<a href="terms_agree.do">사이트 회원가입</a>
				</label>
			</li>
			
			<li class="kko"><a href="#">카카오톡으로 회원가입</a></li>
			<li class="nav"><a href="#">네이버로 회원가입</a></li>
		</ul>
	</div>
</body>
</html>