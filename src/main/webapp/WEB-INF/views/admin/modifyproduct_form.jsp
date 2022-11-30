<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품추가/삭제</title>
		<link rel="stylesheet" href="resources/css/Admin_css/addproduct_form.css">
		<script type="text/javascript">
			function send(f){
				
				// 유효성 체크
				var pname = f.pname.value;
				var pprice = f.pprice.value;
				var pcountry = f.pcountry.value;
				var pperiod = f.pperiod.value;
				var pcheck = f.pcheck.value;
				var pair = f.pair.value;
				var pmove = f.pmove.value;
				var paccount = f.paccount.value;
				var pschedule = f.pschedule.value;
				var photel = f.photel.value;
				var ptotcount = f.ptotcount.value;
				var prescount = f.prescount.value;
				var psparecount = f.psparecount.value;
				var pdibc = f.pdibc.value;
				
				if(pname == '') {
					alert('상품명을 입력해 주세요');
					return;
				}
				if(pprice == '') {
					alert('가격을 입력해 주세요');
					return;
				}
				if(pcountry == '') {
					alert('도착지를 입력해 주세요');
					return;
				}
				if(pperiod == '') {
					alert('여행기간을 입력해 주세요');
					return;
				}
				if(pcheck == '') {
					alert('예약상태를 입력해 주세요');
					return;
				}
				if(pair == '') {
					alert('항공편을 입력해 주세요');
					return;
				}
				if(pmove == '') {
					alert('상품명을 입력해 주세요');
					return;
				}
				if(paccount == '') {
					alert('상품상세설명을 입력해 주세요');
					return;
				}
				if(pschedule == '') {
					alert('여행일정을 입력해 주세요');
					return;
				}
				if(photel == '') {
					alert('호텔정보를 입력해 주세요');
					return;
				}
				if(ptotcount == '') {
					alert('예약 총 인원을 입력해 주세요');
					return;
				}
				if(prescount == '') {
					alert('예약인원을 입력해 주세요');
					return;
				}
				if(psparecount == '') {
					alert('여유좌석을 입력해 주세요');
					return;
				}
				if(pdibc == '') {
					alert('찜목록을 입력해 주세요');
					return;
				}
						
						
						
				// 사진에 대한 유효성 체크를 해 버리면 파일을 업로드 하지 않으면 통과 할 수 없게 되기 때문에
				// 파일에 대한 유효성 체크는 당장은 하지 않는게 좋다.
				
				f.method="get";
				f.action="modifyproduct.do";
				f.submit();
						
					}
			</script>
</head>
<body style="width:1800px; margin:0 auto;">
	<!-- Header -->
	<jsp:include page="../include/admin_header.jsp" />

	<!-- Main Content -->
	<div class="main">
		<div class="content">
			<div class="product">
				<h1>여행 상품 수정</h1>
				<form enctype="multipart/form-data" method="get" action="modifyproduct.do">
					<div class="product_all">
						<div class="product_content">
							<div class="product_add">
								<div class="add">
									<div  class="add1">
										<label>상품명 : </label>
									</div>
									<input type="text" id="pname" name="pname" class="form_add" value="${vo.pname }">
								</div>
								<div class="add">
									<div class="add1">
										<label>상품 가격 : </label>
									</div>
									<input type="text" id="pprice" name="pprice" class="form_add" value="${vo.pprice }">
								</div>
								<div class="add">
									<div class="add1">
										<label>도착지 : </label>
									</div>
									<input type="text" id="pcountry" name="pcountry" class="form_add" value="${vo.pcountry }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>여행 기간 : </label>
									</div>
									<input type="text" id="pperiod" name="pperiod" class="form_add" value="${vo.pperiod }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>상품 예약 상태 : </label>
									</div>
									<input type="text" id="pcheck" name="pcheck" class="form_add" value="${vo.pcheck }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>항공편 : </label>
									</div>
									<input type="text" id="pair" name="pair" class="form_add" value="${vo.pair }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>출/도착일 : </label> 
									</div>
									<input type="text" id="pmove" name="pmove" class="form_add" value="${vo.pmove }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>여행 일정표 : </label>
									</div>
									<input type="text" id="pschedule" name="pschedule" class="form_add" value="${vo.pschedule }">
								</div>
								<div class="add">
									<div  class="add1">
										<label>호텔 정보 : </label>
									</div>
									<input type="text" id="photel" name="photel" class="form_add" value="${vo.photel }">
								</div>
								<div class="add">
									<div class="add1">
										<label>예약 총 인원 : </label>
									</div>
									<input type="text" id="ptotcount" name="ptotcount" class="form_add" value="${vo.ptotcount }">
								</div>
								<div class="add">
									<div class="add1">
										<label>예약 인원 : </label>
									</div>
									<input type="text"id="prescount" name="prescount" class="form_add" value="${vo.prescount }">
								</div>
								<div class="add">
									<div class="add1">
										<label>여유 좌석 : </label>
									</div>
									<input type="text" id="psparecount" name="psparecount" class="form_add">
								</div>
								<div class="add">
									<div class="add1">
										<label>찜 : </label>
									</div>
									<input type="text" id="pdibc"name="pdibc" class="form_add" value="${vo.pdibc }">
								</div>
								<div class="add">
									<div class="add1">
										<label>상품 상세설명 : </label>
									</div>
									<textarea rows="10" cols="50" id="paccount" name="paccount" class="form_add">${vo.paccount }</textarea>
								</div>
							</div>
							<div class="product_addimg">
								<div class="add">
									<div class="add1">
										<label>상품 이미지 : </label>
									</div>
									<input type="file" name="filemaininfo1">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지1 : </label>
									</div>
									<input type="file" name="fileinfo1">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지2 : </label>
									</div>
									<input type="file" name="fileinfo2">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지3 : </label>
									</div>
									<input type="file" name="fileinfo3">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지4 : </label>
									</div>
									<input type="file" name="fileinfo4">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지5 : </label>
									</div>
									<input type="file" name="fileinfo5">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지6 : </label>
									</div>
									<input type="file" name="fileinfo6">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지7 : </label>
									</div>
									<input type="file" name="fileinfo7">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지8 : </label>
									</div>
									<input type="file" name="fileinfo8">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지9 : </label>
									</div>
									<input type="file" name="fileinfo9">
								</div>
								<div class="add">
									<div class="add1">
										<label>서브 이미지10 : </label>
									</div>
									<input type="file" name="fileinfo10">
								</div>
							</div>
						</div>
						<div class="product_button">
							<div class="btn_mg">
								<div class="btn_add">
									<input type="button" class="btn_lf" value="상품수정" onclick="send(this.form)">
									<input type="button" class="btn_rt" value="돌아가기" onclick="location.href='addproduct_list.do'">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>