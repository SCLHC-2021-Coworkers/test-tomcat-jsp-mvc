<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String sql = new StringBuilder("")
			.append("select ")
				.append("c.p_id, ")
				.append("c.c_name, ")
				.append("c.c_email, ")
				.append("c.c_tel ")
			.append("from ")
				.append("custom_01 c ")
			.append("order by ")
				.append("c.p_id")
			.toString();

	PreparedStatement stmt = DbUtil.getInstance().createStmt(sql);
	
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/stylesheet/main.css">
<style>
	h3 {
		text-align: center;
	}
</style>
</head>
<body>
	<h1>회원목록조회</h1>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>이메일</th>
				<th>연락처</th>
			</tr>
		</thead>
		<tbody>
			<% while (rs.next()) { %>
				<tr>
					<td><%= rs.getString("p_id") %></td>
					<td><%= rs.getString("c_name") %></td>
					<td><%= rs.getString("c_email") %></td>
					<td><%= rs.getString("c_name") %></td>
				</tr>
			<% } stmt.close(); %>
		</tbody>
	</table>
	<h3>
		HRDKOREA Copyrightⓒ2015 All rights reserved. Human Resources Development Service of Korea
	</h3>
</body>
</html>