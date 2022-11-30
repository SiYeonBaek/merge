<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	*{margin: 0; padding: 0;}
	ul{list-style: none;}
	.textArea {
		border-bottom: 1px solid #bbb;
		text-align: center;
		width: 800px;
		margin: 50px auto 10px;
		padding-bottom: 30px;
	}
	
	.inputArea {
		padding-top: 10px;
		margin: 0 auto;
		width: 800px;
		height: 260px;
	}
	
	.inputArea ul li {
		border-bottom: 1px solid #bbb;
		padding: 20px 0;
		width: 500px;
		margin: 0 auto;
	}
	
	.inputArea ul li input[type=text]{
		width: 300px;
		padding: 10px 10px;
	}
	
	.inputArea ul li input[type=text]:focus{
		outline: none;
	}
	
	.inputText {
		display: inline-block;
		margin-left: 5px;
		text-align: center;
		font-weight: bold;
		width: 130px;
		font-size: 1.2em;
		
	}
	
	.btnArea {
		margin-top: 20px;
		text-align: center;
	}
	
	.btnArea input[type=button] {
		width: 230px;
	    padding: 10px 10px;
	    margin: 0px auto;
	    border: none;
	    border-radius: 5px;
	}
	
	.btnArea input:nth-child(1) {
		margin-right: 20px;
	    background-color: #81F781;
    }
    
    .btnArea input:nth-child(2) {
    	background-color: #BDBDBD;
  	}
  	
  	.btnArea input:nth-child(1):hover {
    	margin-right: 20px;
    	background-color: #01DF3A;
    }
    
    .btnArea input:nth-child(2):hover {
    	background-color: #848484;
  	}
	
</style>
<script>
	var phoneRules = /^01[016789]{1}?[0-9]{3,4}?[0-9]{4}$/;

	function send(f) {
		var name = f.uname.value.trim();
		var birth = f.ubirth.value.trim();
		var phone = f.uphone.value.trim();
		
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
		f.action = "findId.do";
		f.submit();
	}
</script>
</head>
<body>
	<div class="textArea">
		<h1>아이디 찾기</h1>
	</div>
<form>	
	<div class="inputArea">
			<ul>
				<li>
					<div class="inputText">이름</div> 
					<input type="text" name="uname" placeholder="이름을 입력하세요.">
				</li>
				
				<li>
					<div class="inputText">생년월일</div>
					<input type="text" name="ubirth" placeholder="생년월일 8자리를 입력해 주세요. 예) 19900101"
				               oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				</li>
				
				<li>
					<div class="inputText">핸드폰 번호</div>
					<input type="text" name="uphone" placeholder="휴대폰 번호를 입력해 주세요. 예) 01012345678"
				   	       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				</li>
			</ul>

	</div>

	<ul>
		<li>
			<div class="btnArea">
				<input type="button" value="아이디 찾기" onclick="send(this.form)">
				<input type="button" value="돌아가기" onclick="location.href='userLogin_form.do'">
			</div>
		<li>
	</ul>
</form>


</body>
</html>