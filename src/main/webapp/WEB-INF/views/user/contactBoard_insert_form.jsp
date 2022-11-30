<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(f) {
		var ctitle = f.ctitle.value;
		var ccontext = f.ccontext.value;
		var cpwd = f.cpwd.value;
		
		if(ctitle == '') {
			alert('제목을 입력해 주세요.');
			f.ctitle.focus();
			return;
		}
		
		if(ccontext == '') {
			alert('내용을 입력해 주세요.');
			f.ccontext.focus();
			return;
		}
		
		if(cpwd == '') {
			alert('비밀번호를 입력해 주세요.');
			f.cpwd.focus();
			return;
		}

		f.action = "contactBoard_insert.do";
		f.method = "get";
		f.submit();
		
	}
</script>
</head>
<body>
	<form>
		<input type="hidden" value="${vo.uidx}" name="uidx">
		<input type="hidden" value="${vo.uid}" name="uid">
	
		<table>
			<tr>
				<th>작성자</th>
				<td>${vo.uname}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="ctitle">
				</td>
			</tr>
			
			<tr>
				<th>문의내용</th>
				<td>
					<textarea rows="5" cols="10" name="ccontext"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="cpwd">
				</td>
			</tr>	
			
			<tr>
				<td>
					<input type="button" value="등록하기" onclick="send(this.form)">
					<input type="button" value="돌아가기" onclick="location.href='userContactBoard_form.do?uidx=${vo.uidx}&uid=${param.uid}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>