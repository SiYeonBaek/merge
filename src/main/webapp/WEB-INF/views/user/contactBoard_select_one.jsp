<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(f) {
		var cpwd = f.cpwd.value;
		var real_cpwd = document.getElementById('real_cpwd').value;
		alert(real_cpwd);
		
		if(cpwd != real_cpwd) {
			alert('비밀번호가 일치하지 않습니다.');
			document.getElementById('cpwd').focus();
			document.getElementById('cpwd').value = null;
			return;
		}
		
		f.action = 'contactBoard_modify_form.do';
		f.method = 'get';
		f.submit();
		
	} 
</script>
</head>
<body>
	<form>
		<input type="hidden" value="${vo.cpwd}" id="real_cpwd">
		<input type="hidden" value="${vo.uid}" name="uid">
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
					<input type="text" name="ctitle" value="${vo.ctitle}" readonly>
				</td>
			</tr>
			
			<tr>
				<th>문의내용</th>
				<td>
					<textarea rows="5" cols="10" name="ccontext" readonly>${vo.ccontext}</textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="cpwd" id="cpwd">
				</td>
			</tr>	
			
			<tr>
				<td>
					<input type="button" value="수정하기" onclick="send(this.form)">
					<input type="button" value="돌아가기" onclick="location.href='userContactBoard_form.do?&uid=${vo.uid}&uidx=${param.uidx}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>