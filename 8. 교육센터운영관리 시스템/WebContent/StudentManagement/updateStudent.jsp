<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="student_info" class="StudentInfoManagement.Student" />
<jsp:useBean id="student_management" class="StudentInfoManagement.StudentManagement" />

<%
	request.setCharacterEncoding("UTF-8");
	Student student = (StudentInfoManagement.Student) session.getAttribute("student");
	
	student_info.setId(student.getID());
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

	student_management.updateStudent(student_info);
	session.setAttribute("student", student_info);
	
	student = (StudentInfoManagement.Student) session.getAttribute("student");

%>

<script type="text/javascript">
	alert("수정 되었습니다!");
	javascript: location.href = "../StudentManagement/inquireStudentInfoView.jsp"
</script>