<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
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
		<h1>ȸ�� ���</h1>
		<table>
			<tbody>
				<tr>
					<th>���̵�</th>
					<td>
						<input type="text" name="pId">
					</td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td>
						<input type="password" name="pPw">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td>
						<input type="text" name="cName">
					</td>
				</tr>
				<tr>
					<th>�̸���</th>
					<td>
						<input type="email" name="cEmail">
					</td>
				</tr>
				<tr>
					<th>����ó</th>
					<td>
						<input type="tel" name="cTel">
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">�� ��</button>
						&nbsp;
						<button type="button" id="toCustomerListBtn">�� ȸ</button>
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