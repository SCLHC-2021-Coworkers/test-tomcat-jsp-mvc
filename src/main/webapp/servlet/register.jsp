<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = null;

	if (request.getMethod().equals("POST")) {
		String pId = request.getParameter("pId");
		
		if (pId == null || pId.length() == 0) {
			msg = "아이디는 공백일 수 없습니다.";
		} else {		
			String checkSql = new StringBuilder("")
					.append("select ")
						.append("case when exists ( ")
							.append("select 1 ")
							.append("from custom_01 c ")
							.append("where c.p_id = ? ")
						.append(") ")
							.append("then 'Y' ")
							.append("else 'N' ")
						.append("end is_dup ")
					.append("from dual")
					.toString();
			
			PreparedStatement stmt = DbUtil.getInstance().createStmt(checkSql);
			
			stmt.setString(1, request.getParameter("pId"));
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			boolean isDup = rs.getString("is_dup").equals("Y");
			stmt.close();
			if (isDup) {
				msg = "중복된 아이디입니다.";
			} else {
				String insertSql = new StringBuilder("")
						.append("insert ")
							.append("into custom_01 ")
							.append("(p_id, p_pw, c_name, c_email, c_tel) ")
						.append("values (?, ?, ?, ?, ?)")
						.toString();
				
				stmt = DbUtil.getInstance().createStmt(insertSql);
				
				stmt.setString(1, pId);
				stmt.setString(2, request.getParameter("pPw"));
				stmt.setString(3, request.getParameter("cName"));
				stmt.setString(4, request.getParameter("cEmail"));
				stmt.setString(5, request.getParameter("cTel"));
	
				stmt.executeUpdate();
				
				stmt.close();
				
				msg = "회원정보가 등록되었습니다.";
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 등록</title>
</head>
<body>
	<% if (msg != null) { %>
		<script>
			alert('<%= msg %>');
			window.location.href = '<%= request.getContextPath() %>/view/registerForm.jsp';
		</script>
	<% } %>
</body>
</html>