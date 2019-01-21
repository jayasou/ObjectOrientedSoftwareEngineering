<%@page import="StudentInfoManagement.Student"%>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="studentInfo" class="StudentInfoManagement.Student"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("왜안돼샹");

	String studentName = request.getParameter("studentName");
	System.out.println("★" + studentName);
	ResultSet rs = studentInfo.getInfoOfName(studentName);
%>
<html>
<head>
<script type="text/javascript" src="employeeScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="employeeStyle.css">
</head>
<body>
	<form action="" method="post">
		<div align="center">
			<h1>수강생 정보 조회</h1>
			<%
				while (rs.next()) {
			%>
			<table id="table_student" class="ex1" border="1">

				<thead>

					<tr>
						<th>성명</th>
						<th>성별</th>
						<th>주소</th>
						<th>이메일</th>
						<th>휴대폰번호</th>
						<th>근무회사명</th>
						<th>부서명</th>
						<th>직위</th>
						<th>직무</th>
					</tr>

				</thead>

				<tbody>
					<tr>
						<td><%=rs.getString("name")%></td>

						<td><%=rs.getString("sex")%></td>

						<td><%=rs.getString("address")%></td>

						<td><%=rs.getString("email")%></td>

						<td><%=rs.getString("phoneNum")%></td>

						<td><%=rs.getString("company")%></td>

						<td><%=rs.getString("department")%></td>

						<td><%=rs.getString("position")%></td>
						<td><%=rs.getString("job")%></td>
					</tr>
				</tbody>

			</table>
			<%
				}
			%>
			<br> <br> <input type="button" value="목록으로 돌아가기"
				class="button" onclick="back()">
		</div>
		<br>

	</form>
</body>
</html>