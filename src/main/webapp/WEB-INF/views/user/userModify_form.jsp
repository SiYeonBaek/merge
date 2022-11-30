<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$('document').ready(function() {
		// 비밀번호 변경을 눌렀을 때
		var showAndHide = false;
		
			$('input[name="change"]').click(function() {
			
				if(showAndHide) {
					document.getElementById('pwdChangeDiv').style.display = "none";
					showAndHide = false;
					
				} else {
					document.getElementById('pwdChangeDiv').style.display = "";
					showAndHide = true;
				}
			});
			
	});
</script>

<script>
	//비밀번호 변경으로 눌렀을 떄,
	function chg() {
		var changeUpwd = document.getElementById('changeUpwd').value;
		var upwd = '${vo.upwd}';
			
		if(changeUpwd != upwd) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		location.href = "userPwdChange.do?uidx=${vo.uidx}";
	}
	
	// 변경하기 버튼을 클릭했을 때,
	function modify(f) {
		var name = f.uname.value.trim();
		var phone = f.uphone.value.trim();
		var phoneRules = /^01[016789]{1}?[0-9]{3,4}?[0-9]{4}$/; // 휴대폰 번호 정규식
		
		if(name == '${vo.uname}' && phone == '${vo.uphone}') {
			alert('변경된 항목이 없습니다.');
			return;
		}
		
		if(!phoneRules.test(phone)) {
			// 핸드폰 정규식과 맞지 않을 경우
			alert('올바른 핸드폰 번호를 입력해 주세요.');
			f.uphone.value = null;
			f.uphone.focus();
			return;
		} 
		
		if(phone == '') {
			// 핸드폰 번호를 입력하지 않았을 경우
			alert('핸드폰 번호를 입력해 주세요.');
			f.uphone.focus();
			return;
		}
		
		if(name == '') {
			// 이름을 입력 안했을 경우
			alert('이름을 입력해 주세요.');
			f.uname.focus();
			return;
		}
		
		f.action = "modify.do";
		f.method = "get";
		f.submit();
	}
</script>

<style>
	*{padding: 0; margin: 0;}
	ul{list-style: none;}

	.userText{
		display: inline-block;
	}
	#floatdiv {
	   	position: fixed;
	    width: 175px;
	    display: inline-block;
	    left: 98px;
	    top: 48%;
	    background-color: transparent;
	    margin: 0;
	}
</style>
</head>
<body>
	<div id="floatdiv">
		<a href="myPage.do?uidx=${param.uidx}">마이페이지</a><br>
		<a href="userModify.do?uidx=${param.uidx}">회원정보 수정</a><br>
		<a href="userLeave_form.do?uidx=${param.uidx}">회원 탈퇴</a><br>
		<a href="#">찜항목</a><br>
		<a href="#">1:1 게시판 문의</a><br>
	</div>

	<div class="text">회원정보수정</div>

	<div class="content">
		<form>
			<input type="hidden" name="uidx" value="${vo.uidx}">
			<ul>
				<!-- 아이디 input -->
				<li>
					<div class="userText">아이디</div>
					<input type="text" value="${vo.uid}" disabled>
				</li>
				
				<!-- 비밀번호, 비밀번호 변경 input -->
				<li>
					<div class="userText">비밀번호</div>
					<input type="button" name="change" value="비밀번호 변경">
					
					<div class="pwdChangeInput" id="pwdChangeDiv" style="display: none;">
					
						<input type="password" id="changeUpwd" name="changePwd" placeholder="기존의 비밀번호를 입력해 주세요.">
						<input type="button" id="pwdChange" value="변경" onclick="chg()">
						
					</div>
				</li>
				
				<!-- 이름 input -->
				<li>
					<div class="userText">이름</div>
					<input type="text" name="uname" value="${vo.uname}">
				</li>
				
				<!-- 생년월일 input -->				
				<li>
					<div class="userText">생년월일</div>
					<input type="text" value="${vo.ubirth}" disabled>
				</li>
				
				<!-- 휴대폰 번호 input -->
				<li>
					<div class="userText">휴대폰 번호</div>
					<input type="text" name="uphone" value="${vo.uphone}">
				</li>
			</ul>
			
			<div class="buttonArea">
				<input type="button" value="변경하기" onclick="modify(this.form)">
				<input type="button" value="뒤로가기" onclick="location.href='myPage.do?uidx=${vo.uidx}'">
			</div>
		</form>
	</div>
</body>
</html>