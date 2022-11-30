<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/usercss/userLogin_form_css.css">
<script>
	var msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}

	function send(f) {
		// 유효성 검사
		var uid = f.uid.value.trim();
		var upwd = f.upwd.value.trim();
		
		
		// 만약 ID를 입력하지 않았다면,
		if(uid == '') {
			alert('아이디를 입력해주세요.');
			return;
		}
		// 만약 PWD를 입력하지 않았다면,
		if(upwd == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
		
		// ID, PWD 검사
		var url = "userLogin.do";
		var param = "uid="+encodeURIComponent(uid)+"&upwd="+encodeURIComponent(upwd);
		
		sendRequest(url, param, resultFn, "get");
	}
	
	// 콜백 메서드
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			if(json[0].param == 'no_id'){
				alert("아이디가 존재하지 않습니다.");
				
			} else if(json[0].param == 'no_pwd'){
				alert("비밀번호가 일치하지 않습니다.");
				
			} else {
				alert("로그인 성공");
				location.href="userLogin_form.do";
				
			}
		}
	}// resultFn() end
</script>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	
	<div class="loginTextBox">
		<h1>로그인</h1>
		<h3>다시 만나고 싶은 여행</h3>
	</div>
	
	<div class="loginArea">
	
		<!-- vo가 비어있다는 말은 session에 로그인 정보가 저장되어있지 않다는 의미이다. 즉, 로그인이 되어있지 않은 상태. -->
		<c:if test="${empty vo}">
			<!-- Login input -->
			<div class="loginBox">
				<form method="get">
					<ul>
						<li>
							<div class="idBox">
								<input type="text"  name="uid" value="${param.uid}" placeholder="아이디를 입력하세요.">
							</div>
						</li>
						
						<li>
							<div class="pwdBox">
								<input type="password" class="" name="upwd" placeholder="비밀번호를 입력하세요.">
							</div>
						</li>
					
					</ul>
					
					<input type="button" value="로그인" class="loginBtn" onclick="send(this.form)">
					<input type="button" value="돌아가기" class="backBtn" onclick="<!-- 돌아갈 Mapping 입력 -->">
				</form>
				
				<div class="findBox">
					<!-- ID, PWD, 회원가입 -->
					<a href="findId_form.do">아이디 찾기</a> | 
					<a href="findPwd_form.do">비밀번호 찾기</a> | 
					<a href="userSignUpSelect.do">회원가입</a>
				</div><!-- findBox end -->
				
			</div> <!-- login_box end -->
		</c:if>
		
	
	
	
		<!-- vo가 비어 있지 않다면(값이 들어있다면) 로그인 되어 있는 상태 -->
		<c:if test="${not empty vo}">
			<table>
				<tr>
					<th>아이디</th>
					<td>${vo.uid}</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>${vo.uname}</td>
				</tr>
				
				<tr>
					<th>
						<input type="button" value="마이페이지" onclick="location.href='myPage.do?uidx=${vo.uidx}&uid=${vo.uid}'">
						<input type="button" value="로그아웃" onclick="location.href='userLogout.do'">
					</th>
				</tr>
			</table>
		</c:if>
	</div> <!-- loginArea end -->
	<br>
	
		
</body>
</html>