<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add_Product</title>
		<link rel="stylesheet" href="resources/css/Admin_css/addproduct.css">
		<script src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript">
		function delBtn(f) {
			var delCon = confirm('정보 삭제')

			/* 체크박스 체크된 항목 */
			const idxes = document.querySelectorAll("input[name='chk_box']:checked");
			/* 체크박스 체크된 항목 갯수 */
			const selectedElementsCnt = idxes.length;
			
			console.log(selectedElementsCnt)
			
			if(selectedElementsCnt == 0) {
				alert("삭제할 항목을 선택해주세요")
				return false;
			}
			else {
				if(delCon) {
					alert('삭제');
					
					var arr = new Array(selectedElementsCnt)
					
					
					document.querySelectorAll('input[name="chk_box"]:checked').forEach(function(v, i){
						arr[i] = v.value;
						console.log(arr[i]);
					});
					
					$.ajax({
						type:'get',
						url: 'addproduct_delete.do',
						data: {arr, arr},
						traditional: true,
						success: function(data) {
							location.href='memManagement_list.do';
						}
					});
				}
				else {
					alert('취소');
				}
			}
		}
		
		/* 수정하기 */
		function modBtn(f) {
			$('#modify').click(function(e){
				var pidx = $(this).val();
				alert($(this).val());					
				f.action = "modifyproduct_form.do?pidx="+pidx;
				f.method = "post";
				f.submit();
			})
		}
		</script>
		
	</head>
	<body style="width:1800px; margin:0 auto;">
		<!-- Header -->
		<jsp:include page="../include/header.jsp" />
		
		<!-- Main Content -->
		<div class="main">
			<div class="content">
				<div class="product">
					<form method="post">
						<div class="product_btn">
							<input class="btn" type="button" value="관리자추가" onclick="location.href='addproduct_form.do'">
							<input class="btn" type="button" value="유저삭제" id="delete" onclick="delBtn(this.form);">
						</div>
						<div class="product_add">
							<table border="1" align="center">
								<tr>
									<th>
	                                	<input type="checkbox" id="allCheckBox">
	                                </th>
									<th>번호</th>
									<th>이름</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>우편번호</th>
									<th>도로명 주소</th>
									<th>지번 주소</th>
									<th>상세 주소</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>관리자여부</th>
								</tr>
								<c:forEach var="u" items="${list }" varStatus="no">
									<tr>
										<td>
		                                   	<input type="checkbox" name="chk_box" class="chk" value="${u.uidx}" >
										</td>
										<td id="">${u.uidx  }</td>
										<td>${u.uname }</td>
										<td>${u.uid }</td>
										<td>${u.upwd }</td>
										<td>${u.upostcode }</td>
										<td>${u.uroadAddress  },${u.udetailAddress }</td>
										<td>${u.ujibunAddress },${u.udetailAddress }</td>
										<td>${u.udetailAddress }</td>
										<td>${u.uphone }</td>
										<td>${u.uemail }</td>
										<td>${u.ubirth }</td>
										<td>
											
										</td>
										<td>
											<input class="btn_mod" type="button" value="${p.pidx }" id="modify" onclick="modBtn(this.form);">
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<script>
	/* 전체체크박스 체크 여부에 따른 하위 체크박스들 상태 변경 */
	$("#allCheckBox").change(function(){	
		if($("#allCheckBox").is(":checked")) {
			$(".chk").prop("checked", true);
		}
		else {
			$(".chk").prop("checked", false);
		}
	});
	/* 하위 체크박스들 체크 여부에 따른 전체 체크박스 상태 변경 */
	$(".chk").change(function(){
		if($(".chk:checked").length == $(".chk").length){
			$("#allCheckBox").prop("checked", true);
		}
		else {
			$("#allCheckBox").prop("checked", false);
		}
	});
</script>