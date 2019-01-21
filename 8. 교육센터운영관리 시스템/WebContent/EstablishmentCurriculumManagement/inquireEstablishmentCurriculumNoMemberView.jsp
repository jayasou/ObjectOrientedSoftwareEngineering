<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="establishment_curriculum_info"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculum" />
<jsp:useBean id="establishment_curriculum_management"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculumManagement" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="establishmentCurriculumStyle.css">
<script type="text/javascript" src="establishmentCurriculumScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="" id ="su">
		<div align="center">
			<h1>개설과정</h1>
		</div>
		<%
			ResultSet rs = establishment_curriculum_management.inqurieEstablishmentCurriculum();
		%>
		<div align="center">
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>과정 명</th>
						<th>강의 명</th>
						<th>과목 명</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next()) {
					%>
					<tr>
						<td><input type="radio" name="radio" value="<%=rs.getString("curriculumNumber")%>"></td>
						<td><%=rs.getString("curriculumName")%></td>
						<td><%=rs.getString("lectureName")%></td>
						<td><%=rs.getString("subjectName")%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<br>
		<div align="center">
			<input type="button" value="상세조회" class="button" onclick="go('inquireEstablishmentCurriculumDetailView.jsp')">
		</div>
	</form>
</body>
</html>