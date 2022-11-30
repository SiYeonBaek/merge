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
		
		if(ctitle == '	') {
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
		
		f.action = 'contactBoard_update.do';
		f.method = 'get';
		f.submit();
		
	} 
</script>
</head>
<body>
	<form>
		<input type="hidden" value="${param.uid}" name="uid">
		<input type="hidden" value="${param.uidx}" name="uidx">
		<input type="hidden" value="${vo.cidx}" name="cidx">
		
		<table>
			<tr>
				<th>작성자</th>
				<td>${vo.uid}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="ctitle" value="${vo.ctitle}">
				</td>
			</tr>
			
			<tr>
				<th>문의내용</th>
				<td>
					<textarea rows="5" cols="10" name="ccontext">${vo.ccontext}</textarea>
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
					<input type="button" value="수정하기" onclick="send(this.form)">
					<input type="button" value="돌아가기" onclick="location.href='userContactBoard_form.do?uid=${param.uid}&uidx=${param.uidx}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>