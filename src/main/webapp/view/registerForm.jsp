<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/stylesheet/main.css">
<style>
	form {
		width: 100%;
	}
	
	input[name=cEmail] {
		width: 60%;
	}
</style>
</head>
<body>
	<form method="POST" action="<%= request.getContextPath() %>/servlet/register.jsp">
		<h1>회원 등록</h1>
		<table>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="pId">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pPw">
					</td>
				</tr>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="cName">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="cEmail">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="tel" name="cTel">
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">등 록</button>
						&nbsp;
						<button type="button" id="toCustomerListBtn">조 회</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<script>
		document.getElementById('toCustomerListBtn').onclick = function () {
			window.location.href = 'customerList.jsp';
		};
	</script>
</body>
</html>