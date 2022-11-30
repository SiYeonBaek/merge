<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	*{ margin: 0; padding: 0; }
	
	.Reservation_Text, .Inquire_Text{
		/* border: 1px solid black; */
		width: 1000px;
		margin: 30px auto 0px;
		padding: 20px 0;
	}
	
	.Reservation_Text p, .Inquire_Text p {
		font-weight: bold;
		margin-left: 10px;
		font-size: 16px;
	}
	
	span {
		font-weight: normal;
		font-size: 10px;
	}
	
	.Reservation_List, .Inquire_List {
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
			 	<c:if test="${not empty list}">
					<c:forEach var="list" items="${list}">
						 <tr>
							<td>${list.pname}</td>
							<td>${list.pmove}</td>
							<td>${list.pperiod}</td>
							<td>${list.ptotcount}명</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list}">
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
				
				<c:if test="${not empty list}">
					<c:forEach var="list" items="${list}">
						 <tr>
							<td>${list.ctitle}</td>
							<td>${list.uid}</td>
							<td>${list.cregdate}</td>
							<td>${list.cadmin}</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">현재 문의 하신 내역이 없습니다.</td>
					</tr>	
				</c:if>
			</table>
		</div> <!-- Inquire_List -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	 </div>	<!-- content -->
</body>
</html>










































































