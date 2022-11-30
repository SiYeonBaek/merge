<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script>
	var msg = '${msg}';

	if(msg != '') {
		alert(msg);
	}	
	
</script>
<style>
	*{ margin: 0; padding: 0; }
	.floatdix_a{text-decoration-line: none;
	color: black;}
	
	.Reservation_Text, .Inquire_Text, .Like_Text{
		/* border: 1px solid black; */
		width: 1000px;
		margin: 30px auto 0px;
		padding: 20px 0;
	}
	
	.Reservation_Text p, .Inquire_Text p, .Like_Text p {
		font-weight: bold;
		margin-left: 10px;
		font-size: 16px;
	}
	
	span {
		font-weight: normal;
		font-size: 10px;
	}
	
	.Reservation_List, .Inquire_List, .Like_List {
		width: 1000px;
		/* border-bottom: 1px solid blue; */
		margin: 10px auto 10px;
		height: 300px;
	}
	
	table {
		width: 1000px;
		margin: 0 auto;
		text-align: center;
		border-collapse : collapse;
	}
	
	
	
	table th {
		background-color: #D8D8D8;
		border-top: 1px solid gray;
	}
	
	th, td {
		padding: 20px 30px;
	}
	
	td {font-size: 0.8em; border-bottom: 1px solid #D8D8D8;}
	th {font-size: 0.9em;}
	
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
</head>
<body>	
	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	<div id="floatdiv">
		<a class="floatdix_a" href="myPage.do?uidx=${param.uidx}&uid=${param.uid}">마이페이지</a><br>
		<a class="floatdix_a" href="userModify.do?uidx=${param.uidx}&uid=${param.uid}">회원정보 수정</a><br>
		<a class="floatdix_a" href="userLeave_form.do?uidx=${param.uidx}&uid=${param.uid}">회원 탈퇴</a><br>
		<a class="floatdix_a" href="#">찜항목</a><br>
		<a class="floatdix_a" href="userContactBoard_form.do?uidx=${param.uidx}&uid=${param.uid}">1:1 게시판 문의</a><br>
	</div>

	 <div class="content">
	 
 		<div class="Reservation_Text">
			<p>나의 예약 내역 <span style="font-size:0.8em;">나의 예약 내역을 확인해보세요.</span></p>	 		
 		</div> <!-- Reservation_Text -->
 		
		 	<div class="Reservation_List">
			 <table>
				 <tr>
				 	<th>상품이름</th>
				 	<th>출발일-도착일</th>
				 	<th>여행기간</th>
					<th>예약 총 인원</th>
				</tr>
			 	<c:if test="${not empty productList}">
					<c:forEach var="productList" items="${productList}">
						 <tr>
							<td>${productList.pname}</td>
							<td>${productList.pmove}</td>
							<td>${productList.pperiod}</td>
							<td>${productList.ptotcount}명</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty productList}">
					<tr>
						<td colspan="4">현재 예약 하신 내역이 없습니다.</td>
					</tr>	
				</c:if>
			</table>
		</div> <!-- Reservation_List -->
		
		
		
		
		<div class="Inquire_Text">
			<p>나의 문의 내역 <span style="font-size:0.8em;">나의 문의 내역을 확인해보세요.</span></p>	 		
 		</div> <!-- "Inquire_Text" -->
		
		<div class="Inquire_List">
			<table>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변유무</th>
				</tr>
				
				<c:if test="${not empty contactList}">
					<c:forEach var="contactList" items="${contactList}">
						 <tr>
							<td><a href='contactBoard_one.do?cidx=${contactList.cidx}&uidx=${param.uidx}&uid=${param.uid}'>${contactList.ctitle}</a></td>
							<td>${contactList.uid}</td>
							<td>${contactList.cregdate}</td>
							<td>${contactList.cadmin}</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty contactList}">
					<tr>
						<td colspan="4">현재 문의 하신 내역이 없습니다.</td>
					</tr>	
				</c:if>
			</table>
		</div> <!-- Inquire_List -->
		
		
		
		
		
		
		<div class="Like_Text">
			<p>나의 찜 내역 <span style="font-size:0.8em;">나의 찜 내역을 확인해보세요.</span></p>	 		
 		</div> <!-- "Like_Text" -->
		
		<div class="Like_List">
			<table>
				<tr>
					<th>상품이름</th>
					<th>상품가격</th>
					<th>여행기간</th>
					<th>여행지</th>
				</tr>
				
				<c:if test="${not empty likeList}">
					<c:forEach var="likeList" items="${likeList}">
						 <tr>
							<td><a href='#'>${likeList.pname}</a></td>
							<td>${likeList.pprice}</td>
							<td>${likeList.pperiod}</td>
							<td>${likeList.pcountry}</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty likeList}">
					<tr>
						<td colspan="4">현재 찜 내역이 없습니다.</td>
					</tr>	
				</c:if>
			</table>
		</div> <!-- Like_List -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	 </div>	<!-- content -->
</body>
</html>










































































