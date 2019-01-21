<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student_info" class="StudentInfoManagement.Student" />
<jsp:useBean id="student_management" class="StudentInfoManagement.StudentManagement" />
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

	student_info.setStudent(student.getID());
%>
	<form action="updateStudent.jsp" method="post">
		<div align="center">
			<table id="table_student">
				<tr>
					<td colspan="2"><h1>수강생 정보 수정</h1></td>
				</tr>

				<tr>
					<td>ID</td>
					<td><%=student.getID()%></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="input_password" value="<%=student_info.getPassword()%>"></td>
				</tr>

				<tr>
					<td>성명</td>
					<td><input type="text" name="input_name" value="<%=student_info.getName()%>"></td>
				</tr>

				<tr>
					<td>성별</td>
					<td><select name="input_sex" id="input_sex">
							<option selected="selected" value="남">남</option>
							<option value="여">여</option>
					</select></td>
				</tr>

				<tr>
					<td>주소</td>
					<td><input type="text" name="input_address" value="<%=student_info.getAddress()%>"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="text" name="input_email" value="<%=student_info.getEmail()%>"></td>
				</tr>

				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="input_phone" value="<%=student_info.getPhone()%>"></td>
				</tr>

				<tr>
					<td>근무회사명</td>
					<td><input type="text" name="input_company" value="<%=student_info.getCompany()%>"></td>
				</tr>

				<tr>
					<td>부서명</td>
					<td><input type="text" name="input_department" value="<%=student_info.getDepartment()%>"></td>
				</tr>

				<tr>
					<td>직위</td>
					<td><input type="text" name="input_position" value="<%=student_info.getPosition()%>"></td>
				</tr>

				<tr>
					<td>직무</td>
					<td><input type="text" name="input_job" value="<%=student_info.getJob()%>"></td>
				</tr>
			</table>
		</div>
		<br>
		<div align="center">
			<input type="submit" value="수정" class="btn_submit"> 
			<input type="button" value="취소" class="btn_cancle" onclick="cancle()">
		</div>
	</form>
</body>
</html>