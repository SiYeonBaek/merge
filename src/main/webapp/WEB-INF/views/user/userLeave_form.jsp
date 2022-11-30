<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{ margin: 0; padding: 0;}
	ul{list-style: none;}
	a{text-decoration-line: none;
	color: black;}

	.Text1 {
		border-bottom: 1px solid #bbb;
		text-align: center;
		margin: 100px auto 50px;
		padding: 50px 0;
		width: 1000px;
	}
	
	.content {
		text-align: center;
		width: 1000px;
		margin: 0 auto;
	}
	
	.content ul li {
		margin: 0 auto;
		padding: 20px 10px;
		width: 580px;
	}
	
	.content ul li:nth-child(1) {
		border-bottom: 1px solid #bbb;
	}
	
	.content ul li .text {
		display: inline-block;
		margin-left: 30px;
		width: 120px;
		padding: 10px 30px;
		float: left;
		font-weight: bold;
		font-size: 1.1em;
	}

	input[type=text] {
		width: 300px;
		padding: 10px 10px;
	}

	textarea {
		margin-right: 0px;
	    width: 320px;
	    height: 150px;
	}

	.buttonArea {
		width: 1000px;
		text-align: center;
		margin-top: 30px;
	}
	
	.buttonArea input[type=button] {
		width: 230px;
	    padding: 10px 10px;
	    margin: 0px auto;
	    border: none;
	    border-radius: 5px;
	}
	
	.buttonArea input:nth-child(1) {
		margin-right: 20px;
	    background-color: #81F781;
    }
    
    .buttonArea input:nth-child(2) {
    	background-color: #BDBDBD;
  	}
  	
  	.buttonArea input:nth-child(1):hover {
    	margin-right: 20px;
    	background-color: #01DF3A;
    }


	#floatdiv {
	   	position: fixed;
	    width: 175px;
	    display: inline-block;
	    left: 40px;
	    top: 43%;
	    background-color: transparent;
	    margin: 0;
	}
	
	#floatdiv a {
		line-height: 1.8;
	}
</style>
<script>
	function leave() {
		
		if(!confirm('정말 삭제하시겠습니까?')) {
			return;
		}
		
		location.href='userLeave.do?uidx=${vo.uidx}&uid=${vo.uid}';
	}
</script>
</head>
<body>
	<div id="floatdiv">
		<a href="myPage.do?uidx=${param.uidx}&uid=${param.uid}">마이페이지</a><br>
		<a href="userModify.do?uidx=${param.uidx}&uid=${param.uid}">회원정보 수정</a><br>
		<a href="userLeave_form.do?uidx=${param.uidx}&uid=${param.uid}">회원 탈퇴</a><br>
		<a href="#">찜항목</a><br>
		<a href="userContactBoard_form.do?uidx=${param.uidx}&uid=${param.uid}">1:1 게시판 문의</a><br>
	</div>

	<div class="Text1"><h1>그 동안 홈페이지를 이용해 주셔서 감사합니다.</h1></div>
	
	<div class="content">
		<ul>
			<li>
				<div class="text">이름</div>
				<input type="text" value="${vo.uname}">
			</li>
			
			<li>
				<div class="text">회원탈퇴사유</div>
				<textarea rows="3" cols="10"></textarea>
			</li>
		</ul>
		<div class="buttonArea">
				<input type="button" value="탈퇴하기" onclick="leave()">
				<input type="button" value="돌아가기" onclick="location.href='myPage.do?uidx=${param.uidx}&uid=${param.uid}'">
			</div>
	</div>
</body>
</html>