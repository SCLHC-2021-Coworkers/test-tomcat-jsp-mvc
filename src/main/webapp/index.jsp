<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
	<%
		request.getRequestDispatcher(
				request.getContextPath() + "/view/registerForm.jsp")
		.forward(request, response);
	%>
</body>
</html>