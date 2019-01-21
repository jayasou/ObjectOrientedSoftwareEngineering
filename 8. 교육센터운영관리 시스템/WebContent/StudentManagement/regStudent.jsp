<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="student_info" class="StudentInfoManagement.Student" />
<jsp:useBean id="student_management"
	class="StudentInfoManagement.StudentManagement" />
<jsp:useBean id="student_view" class="StudentInfoManagement.StudentView" />
<jsp:useBean id="dbController" class="DatabaseManagement.DBController" />

<%
	request.setCharacterEncoding("UTF-8");
	student_info.setId(request.getParameter("input_id"));
	student_info.setName(request.getParameter("input_name"));
	student_info.setPassword(request.getParameter("input_password"));
	student_info.setSex(request.getParameter("input_sex"));
	student_info.setAddress(request.getParameter("input_address"));
	student_info.setEmail(request.getParameter("input_email"));
	student_info.setPhoneNum(request.getParameter("input_phone"));
	student_info.setCompany(request.getParameter("input_company"));
	student_info.setDepartment(request.getParameter("input_department"));
	student_info.setPosition(request.getParameter("input_position"));
	student_info.setJob(request.getParameter("input_job"));

	String id = request.getParameter("input_id");
	ResultSet studentRS = dbController.chkStudentID(id);
	ResultSet employeeRS = dbController.chkEmployeeID(id);

	String testStudentID = "";
	String testEmployeeID = "";
	while (studentRS.next()) {

		testStudentID = studentRS.getString("id");
		System.out.println("studentID:" + testStudentID);
	}
	while (employeeRS.next()) {

		testEmployeeID = employeeRS.getString("id");
		System.out.println("employeeID:" + testEmployeeID);
	}

	if (testStudentID == "" && testEmployeeID == "") {

		System.out.println("수강생중복처리 등록 body 안");
		student_management.regStudent(student_info);
		session.setAttribute("student_info", student_info);
%>
<script type="text/javascript">
	alert("등록 되었습니다!");
	javascript: location.href = "../MainView/mainBackground.jsp"
</script>

<%
	} else {
		System.out.println("수강생중복처리 등록 body 밖");
%>
<script type="text/javascript">
	alert("중복된 ID입니다.");
	javascript: location.href = "../StudentManagement/joinStudentView.html"
</script>
<%
	}
%>

