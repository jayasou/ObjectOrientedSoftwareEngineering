<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="establishment_lecture_info"
	class="EstablishmentLectureManagement.EstablishmentLecture" />
<jsp:useBean id="establishment_lecture_management"
	class="EstablishmentLectureManagement.EstablishmentLectureManagement" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="establishmentLectureStyle.css">
<script type="text/javascript" src="establishmentLectureScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
%>

<body>
	<form action="" id ="su">
		<div align="center">
			<h1>개설강의</h1>
		</div>
		<%
			ResultSet rs = establishment_lecture_management.inqurieEstablishmentLecture();
		%>
		<div align="center">
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>과목 명</th>
						<th>강의 명</th>
						<th>강사 명</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next()) {
					%>
					<tr>
						<td><input type="radio" name="radio" value="<%=rs.getString("lectureNumber")%>"></td>
						<td><%=rs.getString("subjectName")%></td>
						<td><%=rs.getString("lectureName")%></td>
						<td><%=rs.getString("lecturerName")%></td>
						<td><%=rs.getString("classRoom")%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<br>
		<div align="center">
			<input type="button" value="등록" class="button" onclick="javascript:location.href='regEstablishmentLectureView.jsp'">
			<input type="button" value="수정" class="button" onclick="go('updateEstablishmentLectureView.jsp')">
			<input type="button" value="삭제" class="button" onclick="go('delEstablishmentLecture.jsp')">
			<input type="button" value="상세조회" class="button" onclick="go('inquireEstablishmentLectureDetailView.jsp')">
		</div>
	</form>
</body>
</html>