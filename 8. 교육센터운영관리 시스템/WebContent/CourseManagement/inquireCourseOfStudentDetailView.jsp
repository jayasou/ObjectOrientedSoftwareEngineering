<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="course" class="CourseManagement.Course"></jsp:useBean>
<jsp:useBean id="dbController" class="DatabaseManagement.DBController" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href=courseStyle.css>
<script type="text/javascript" src="courseScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" id="su">
		<div align="center">
			<h1>수강생 목록 상세조회</h1>
			<%
				String radioValue = request.getParameter("radio");
				if (radioValue == "null")
					return;
				//개설과정 number를 받아온다.
				int curriculumNumber = Integer.parseInt(radioValue);

				ResultSet studentRS = dbController.studentInfoOfID(curriculumNumber);
				ResultSet employeeRS = dbController.employeeInfoOfID(curriculumNumber);

				if (studentRS != null) {
					while (studentRS.next()) {
			%>
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th>이메일</th>
						<th>휴대폰번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=studentRS.getString("name")%></td>
						<td><%=studentRS.getString("sex")%></td>
						<td><%=studentRS.getString("address")%></td>
						<td><%=studentRS.getString("email")%></td>
						<td><%=studentRS.getString("phoneNum")%></td>
					</tr>
				</tbody>
			</table>
			<br> <br>
			<%
				}
				}
				if (employeeRS != null) {
					while (employeeRS.next()) {
			%>
			<table class="ex1" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th>이메일</th>
						<th>휴대폰번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=employeeRS.getString("koreanName")%></td>
						<td><%=employeeRS.getString("sex")%></td>
						<td><%=employeeRS.getString("address")%></td>
						<td><%=employeeRS.getString("email")%></td>
						<td><%=employeeRS.getString("phoneNum")%></td>
					</tr>
				</tbody>
			</table>
			<br> <br>

			<%
				}
				}
			%>
		</div>
		<br>
		<div align="center">
			<input type="button" value="목록으로 돌아가기" class="button"
				onclick="back()">
		</div>
		<div style="display: none">
			<input name="hidden" value="" id="hidden">
		</div>
	</form>
</body>
</html>