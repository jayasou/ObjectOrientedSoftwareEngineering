<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="studentInfo" class="StudentInfoManagement.Student" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="employeeStyle.css">
</head>
<body>
	<%
		//Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
		ResultSet rs = studentInfo.getAllStudentRS(); //모든 수강생 정보를 가져온다.
	%>
	<form action="inquireAllStudentInfoDetailView.jsp" method="post">
		<div align="center">
			<h1>수강생 목록</h1>

			<table class="ex1" border="1" width="30%">
				<thead>
					<tr>
						<th>수강생 이름</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><select name="studentName"
							id="studentName">
								<%
									while (rs.next()) {
								%>
								<option><%=rs.getString("name")%></option>
								<%
									}
								%>
						</select></td>
					</tr>
				</tbody>
			</table>
			
			<br>
			<br> <input type="submit" value="상세조회" class="button">
		</div>
	</form>

</body>
</html>