<%@page import="EmployeeInfoManagement.Employee"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="establishment_lecture_info"
	class="EstablishmentLectureManagement.EstablishmentLecture" />
<jsp:useBean id="establishment_lecture_management"
	class="EstablishmentLectureManagement.EstablishmentLectureManagement" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String sub_name = request.getParameter("subjectName");
	int manage_sub_num = establishment_lecture_info.subNameOfNumber(sub_name);
	String establishment_lecture_num = request.getParameter("index");
	
	establishment_lecture_info.setManagementSubNumber(manage_sub_num);
	establishment_lecture_info.setSubjectName(request.getParameter("subjectName"));
	establishment_lecture_info.setLectureName(request.getParameter("lectureName"));
	establishment_lecture_info.setLecturerName(request.getParameter("lecturerName"));
	establishment_lecture_info.setClassRoom(request.getParameter("classRoom"));

	establishment_lecture_management.updateEstablishmentLecture(establishment_lecture_num, establishment_lecture_info);
%>

<script type="text/javascript">
	alert("수정 되었습니다!");
	javascript: location.href = "../EstablishmentLectureManagement/inquireEstablishmentLectureView.jsp"
</script>

