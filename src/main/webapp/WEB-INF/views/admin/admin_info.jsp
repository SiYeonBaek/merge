<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 정보</title>
		<link rel="stylesheet" href="resources/css/Admin_css/admin_info.css">
		<script>
			function send(f) {
				
			}
		</script>
	</head>
	<body style="width:1800px; margin:0 auto;">
		<!-- Header -->
		<jsp:include page="../include/admin_header.jsp" />
		
		<!-- Main Content -->
		<form>
			<div class="main">
				<div class="content">
					<div class="admin_info">
						<div class="info_img">
							<div class="info_page">
								<h2>관리자 정보</h2>
							</div>
							<div class="profil_box">
									
								<div class="profile_img">
									<img alt="" src="">
								</div>
							</div>
						</div>
						<div class="info_text">
							<div class="txt_lng">
								<div class="txt_style">
									<label>이름</label>
									<input type="text" value="${vo.uname }">
								</div>
							</div>
							<div class="txt_left">
								<div class="txt_style">
									<label>기존 비밀번호</label>
									<input type="text" value="${vo.upwd }">
								</div>
							</div>
							<div class="txt_right">
								<div class="txt_style">
									<label>새로운 비밀번호</label>
									<input type="text">
								</div>
							</div>
							<div class="txt_long">
								<div class="txt_style">
									<label>생년월일</label>
									<input type="text" value="${vo.ubirth }">
								</div>
								<div class="txt_style">
									<label>이메일주소<label>
									<input type="text" value="${vo.uemail }">
								</div>
							</div>
						</div>
						<div class="info_btn">
							<div class="btn_action">
								<input type="button" class="btn_mod" value="수정하기" onclick="send(this.form)">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>