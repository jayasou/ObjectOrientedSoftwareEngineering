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
	//Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	String radioValue = request.getParameter("radio");

	int establish_lecture_num = Integer.parseInt(radioValue);

	if (radioValue == "null")
		return;

	else
		establishment_lecture_info.setEstablishmentLecture(establish_lecture_num);
%>

<body>
	<form action="regEstablishmentLecture.jsp" method="post">
		<div align="center">
			<h2>개설강의 상세 조회</h2>
		</div>

		<fieldset>
			<div align="center">
				<table style="width: 400px">
					<tr>
						<td colspan="2">개설 과목</td>
					</tr>

					<tr>
						<td colspan="2"><%=establishment_lecture_info.getSubjectName()%></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td colspan="2">강의 명</td>
					</tr>

					<tr>
						<td colspan="2"><%=establishment_lecture_info.getLectureName()%></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td>강사 명</td>
						<td>강의실</td>
					</tr>

					<tr>
						<td><%=establishment_lecture_info.getLecturerName()%></td>
						<td><%=establishment_lecture_info.getClassRoom()%></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<br>
		<div align="center">
			<input type="button" value="목록으로 돌아가기" class="btn_cancle" onclick="back()">
		</div>
	</form>
</body>
</html>