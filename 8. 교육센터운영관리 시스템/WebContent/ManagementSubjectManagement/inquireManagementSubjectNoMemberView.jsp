<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="manage_subject_info"
	class="ManageSubjectManagement.ManageSubject" />
<jsp:useBean id="manage_subject_management"
	class="ManageSubjectManagement.ManageSubjectManagement" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="managementSubjectStyle.css">
<script type="text/javascript" src="managementSubjectScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="" id ="su">
		<div align="center">
			<h1>운영과목</h1>
		</div>
		<%
			ResultSet rs = manage_subject_management.inqurieManagementSubject();
		%>
		<div align="center">
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>운영과목 명</th>
						<th>운영센터</th>
						<th>개설여부</th>
						<th>등록자</th>
					</tr>
				</thead>
				<tbody>
					<%
						int count = 0;
						while (rs.next()) {
							String openCheck = "";
							String openCheck_str = rs.getString("openCheck");
							if(openCheck_str.equals("0"))
								openCheck = "미개설";
							else
								openCheck = "개설";
								
					%>
					<tr>
						<td><input type="radio" name="radio"
							value="<%=rs.getString("managementSubNumber")%>"></td>
						<td><%=rs.getString("managementSubName")%></td>
						<td><%=rs.getString("managementCenter")%></td>
						<td><%=openCheck%></td>
						<td><%=rs.getString("employeeName")%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<br>
			<div align="center">
		<input type="button" value="상세조회" class="button" onclick="go('inquireManagementDetailView.jsp')">
		</div>
	</form>
</body>
</html>