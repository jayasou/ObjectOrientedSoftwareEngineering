<%@page import="StudentInfoManagement.Student"%>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="courseInfo" class="CourseManagement.Course" />
<jsp:useBean id="courseManagement" class="CourseManagement.Course" />




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="courseStyle.css">
<script type="text/javascript" src="courseScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
Student student = null;
Employee employee = null;
String id = null;

String member = (String) session.getAttribute("member"); //member = student Or employee 

if (member == "STUDENT") {
	student = (StudentInfoManagement.Student) session.getAttribute("student");
	id = student.getID(); //수강생 id
} else if (member == "EMPLOYEE") {
	employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	id = employee.getId(); //직원 id		
}
%>

<body>
	<form action="" id="su">
		<div align="center">
			<h1>수강신청 목록 조회</h1>
		</div>
		<%
			ResultSet rs = courseInfo.idOfResultSet(id);
		%>
		<div align="center">
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>과정 명</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next()) {
							int curriculumNumber = rs.getInt("curriculumNumber");
							int courseNumber = rs.getInt("courseNumber");
							String curriculumName = courseInfo.numberOfCurriculumName(curriculumNumber);
					%>
					<tr>
						<td><input type="radio" name="radio" value=<%=courseNumber %>></td>
						<td><%=curriculumName%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<br>
		<div align="center">
			<input type="button" value="등록" class="button" onclick="javascript:location.href='regCourseView.jsp'"> 
			<input type="button" value="삭제" class="button" onclick="go('delCourse.jsp')">
		</div>
	</form>
</body>
</html>
