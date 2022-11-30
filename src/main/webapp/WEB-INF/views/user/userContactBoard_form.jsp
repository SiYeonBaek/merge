<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<script>
	function check(uid, cidx) {
		var now_uid = ${param.uid};
		
		if(uid != now_uid) {
			alert('작성자만 내용을 확인할 수 있습니다.');
			return;
		}
		
		location.href = "contactBoard_one.do?cidx=" + cidx + "&uidx=" + ${param.uidx};
	}
</script>
<style>
	*{padding: 0; margin: 0;}
	a{text-decoration-line: none;
	color: black;}
	
	.text {
		text-align: center;
		margin: 50px auto 10px;
		padding: 30px 0;
		width: 1000px;
	}
	
	table {
		margin: 0 auto;
		text-align: center;
		border-collapse : collapse;
		width: 1000px;
	}
	
	th {
		background-color: #D8D8D8;
		border-top: 1px solid gray;
	}
	
	td {
		border-bottom: 1px solid #D8D8D8;
	}
	
	th, td {
		padding: 10px 10px;	
	}
	
	th:nth-child(1), td:nth-child(1) {
		width: 300px;
	}
	
	th:nth-child(2), td:nth-child(2) {
		width: 100px;
	}
	
	th:nth-child(3), td:nth-child(3) {
		width: 200px;
	}
	
	th:nth-child(4), td:nth-child(4) {
		width: 200px;
	}
	
	.buttonArea {
		width: 1000px;
		text-align: center;
	    margin: 30px auto;
	}
	
	.buttonArea input[type=button] {
		width: 180px;
		float: right;
	    padding: 10px 10px;
	    margin-left: 5px;
	    border: none;
	    border-radius: 5px;
	}
	
	.buttonArea input:nth-child(1) {
		margin-right: 20px;
	    background-color: #BDBDBD;
    }
    
    .buttonArea input:nth-child(1):hover {
    	margin-right: 20px;
    	background-color: #848484;
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
</head>
<body>
	<div id="floatdiv">
		<a href="myPage.do?uidx=${param.uidx}&uid=${param.uid}">마이페이지</a><br>
		<a href="userModify.do?uidx=${param.uidx}&uid=${param.uid}">회원정보 수정</a><br>
		<a href="userLeave_form.do?uidx=${param.uidx}&uid=${param.uid}">회원 탈퇴</a><br>
		<a href="#">찜항목</a><br>
		<a href="userContactBoard_form.do?uidx=${param.uidx}&uid=${param.uid}">1:1 게시판 문의</a><br>
	</div>

	<div class="text"><h1>문의 내역</h1></div>
	
	<table>
		<tr>
			<th>문의 제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>수정날짜</th>
			<th>답변유무</th>
		</tr>
		
		<c:forEach var="list" items="${list}">
			<tr>
				<td><a style="cursor: pointer;" onclick="check(${list.uid}, ${list.cidx})">${list.ctitle}</a></td>
				<td>${list.uid}</td>
				<td>${list.cregdate}</td>
				<td>${list.cmoddate}</td>
				<td>${list.cadmin}</td>
			</tr>		
		</c:forEach>
	
		<tr>
			<td colspan="5" align="center"> 
				${pageMenu}
			</td>
		</tr>	
	</table>
	
	<div class="buttonArea">
		<input type="button" value="글쓰기" onclick="location.href='contactBoard_insert_form.do?uidx=${param.uidx}&uid=${param.uid}'">
	</div>
</body>

</html>