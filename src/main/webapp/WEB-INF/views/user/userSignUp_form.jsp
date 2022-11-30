<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/usercss/userSignUp_form_css.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<!-- 우편번호 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 우편번호 script -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function user_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_postcode').value = data.zonecode;
                document.getElementById("user_roadAddress").value = roadAddr;
                document.getElementById("user_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("user_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("user_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script>
	// ================================ id중복체크 ================================
	// 아이디 중복체크를 위한 변수
	var idCheck = false;
	
	// 정규식을 위한 변수
	var idRules = /^[0-9a-zA-Z]+$/; // 영어 & 숫자만 가능
	var passwordRules = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자,  문자,  숫자 포함 형태의 8~15자리 이내의 암호 정규식
	var phoneRules = /^01[016789]{1}?[0-9]{3,4}?[0-9]{4}$/;
	var emailRules = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	
	function user_id_check() {
		var uId = f.uid.value.trim();
		
		// 아이디를 입력하지 않았을 경우,
		if(uId == ''){
			alert("아이디를 입력하세요");
			return;
		}
		
		// 아이디 정규식 테스트
		if(!idRules.test(uId)) {
			alert('아이디는 영어, 숫자만 입력 가능합니다.');
			f.userId.focus();
			return;
		}
		
		// ajax로 보낼 url, param
		var url = "check_id.do";
		var param = "uId="+encodeURIComponent(uId).trim();
		
		sendRequest(url, param, resultFn, "post");
		
	}// user_id_check() end
	
	// 콜백함수
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			if(json[0].res == 'no'){
				alert('사용할 수 없는 아이디입니다.');
				return;
			} else {
				alert('사용할 수 있는 아이디입니다.');
				idCheck = true;
				return;
			}
		}
	} // 콜백함수 end
	// =============================================================================

	function send(f) {
		var id = f.uid.value.trim();
		var name = f.uname.value.trim();
		var pwd = f.upwd.value.trim();
		var pwd2 = f.upwd2.value.trim();
		var birth = f.ubirth.value.trim();
		var phone = f.uphone.value.trim();
		var email = f.uemail.value.trim();
		var postcode = f.upostcode.value.trim();
		var roadAddress = f.uroadAddress.value.trim();
		var postcode = f.ujibunAddress.value.trim();
		var detailAddress = f.udetailAddress.value.trim();
		
		// ============= 유효성 검사 =============
  		if(id == '') {
			// 아이디를 입력 안했을 경우
			alert('아이디를 입력해 주세요.');
			f.uid.focus();
			return;
		}
		
		if(!idCheck) {
			// 중복체크를 안했을 경우
			alert('아이디 중복체크를 해주세요.');
			return;
		}
		
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
		
 		if(email == '') {
			// 이메일을 입력 안했을 경우
			alert('이메일을 입력해 주세요.');
			f.uemail.focus();
			return;
		}
 		
		if(!emailRules.test(email)) {
			// 이메일 정규식과 맞지 않을 경우
			alert('올바른 이메일을 입력해 주세요.');
			f.uemail.value = null;
			f.uemail.focus();
			return;
		} 
		
		 if(postcode == '') {
			// 주소를 입력하지 않았을 경우
			alert('주소를 입력해 주세요.');
			return;
		} 
	
		f.method="post";
		f.action = "userInsert.do";
		f.submit();
		
	}// send() end
	
	
</script>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	<div class="textArea">
		<h1>회원가입</h1>
	</div>
	
<form name="f">
	<div class="infoBox">
		<ul>
			<!-- 아이디 input -->
			<li>
				<div class="infoText">아이디</div>
				<input type="button" value="중복확인" onclick="user_id_check()" >
				<input type="text" name="uid" placeholder="아이디를 입력해 주세요.">
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 비밀번호 input -->
			<li>
				<div class="infoText">비밀번호</div>
				<input type="password" name="upwd" placeholder="비밀번호를 입력해 주세요.">
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			<li>
				<div class="infoText">비밀번호 확인</div>
				<input type="password" name="upwd2" placeholder="비밀번호를 입력해 주세요.">
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 이름 input -->
			<li>
				<div class="infoText">이름</div>
				<input type="text" name="uname" placeholder="이름을 입력해 주세요.">
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 생년월일 input -->
			<li>
				<div class="infoText">생년월일</div>
				<input type="text" name="ubirth" placeholder="생년월일 8자리를 입력해 주세요. 예) 19900101"
				       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 핸드폰 번호 input -->	
			<li>
				<div class="infoText">핸드폰 번호</div>
				<input type="text" name="uphone" placeholder="휴대폰 번호를 입력해 주세요. 예) 01012345678"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력할 수 있게 해주는 것 -->
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 이메일 input -->
			<li>
				<div class="infoText">이메일</div>
				<input type="text" name="uemail" placeholder="이메일을 입력해 주세요.">
				<div class="under-bar">
      				<div class="color"></div>
     			</div>
			</li>
			
			<!-- 주소 input -->
			<li>
				<div class="addrArea">
					<div class="infoText">주소</div>
					<input type="text" name="upostcode" id="user_postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="user_execDaumPostcode()" value="우편번호 찾기"><br>
					<div class="addr">
							<input type="text" name="uroadAddress" id="user_roadAddress" placeholder="도로명주소" readonly>
							<input type="text" name="ujibunAddress" id="user_jibunAddress" placeholder="지번주소" readonly>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" name="udetailAddress" id="user_detailAddress" placeholder="상세주소">
							<input type="text" name="uextraAddress" id="user_extraAddress" placeholder="참고항목" readonly>
					</div>
				</div>
			</li>
		</ul>
	</div>
	
	<div class="btnArea">
		<!-- 회원가입 버튼, 취소 버튼 -->
		<input type="button" value="회원가입" onclick="send(this.form)">
		<input type="button" value="돌아가기" onclick="location.href='userLogin_form.do'">
	</div>
</form>
</body>
</html>






























