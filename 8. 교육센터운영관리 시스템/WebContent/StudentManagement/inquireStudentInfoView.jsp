<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="studentStyle.css">
<script type="text/javascript" src="studentScript.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	Student student = (StudentInfoManagement.Student) session.getAttribute("student");
%>
	<form action="updateStudentView.jsp" method="post">
		<div align="center">
			<table id="table_student">
				<tr>
					<td colspan="2"><h1>수강생 정보 조회</h1></td>
				</tr>

				<tr>
					<td>ID</td>
					<td><%=student.getID()%></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><%=student.getPassword()%></td>
				</tr>

				<tr>
					<td>성명</td>
					<td><%=student.getName()%></td>
				</tr>

				<tr>
					<td>성별</td>
					<td><%=student.getSex()%></td>
				</tr>

				<tr>
					<td>주소</td>
					<td><%=student.getAddress()%></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><%=student.getEmail()%></td>
				</tr>

				<tr>
					<td>휴대폰번호</td>
					<td><%=student.getPhone()%></td>
				</tr>

				<tr>
					<td>근무회사명</td>
					<td><%=student.getCompany()%></td>
				</tr>

				<tr>
					<td>부서명</td>
					<td><%=student.getDepartment()%></td>
				</tr>

				<tr>
					<td>직위</td>
					<td><%=student.getPosition()%></td>
				</tr>

				<tr>
					<td>직무</td>
					<td><%=student.getJob()%></td>
				</tr>
			</table>
		</div>
		<br>
		
		<table align="center">
			<tr>
				<td><form action="updateStudentView.jsp" method="post"><input type="submit" value="수정" class="btn_submit"> </form></td>
				<td><form action="delStudent.jsp" method="post"><input type="submit" value="탈퇴" class="btn_cancle" ></form></td>
			</tr>
		</table>
</body>
</html>