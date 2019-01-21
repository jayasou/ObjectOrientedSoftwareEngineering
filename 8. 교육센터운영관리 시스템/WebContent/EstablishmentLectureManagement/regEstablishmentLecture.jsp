<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="establishmentLectureInfo" class="EstablishmentLectureManagement.EstablishmentLecture" />
<jsp:useBean id="establishmentLectureManagement" class="EstablishmentLectureManagement.EstablishmentLectureManagement" />

<script type="text/javascript">

</script>

<%
	request.setCharacterEncoding("UTF-8");
	String sub_name = request.getParameter("subjectName");
	int management_sub_num = establishmentLectureInfo.subNameOfNumber(sub_name);
	
	establishmentLectureInfo.setManagementSubNumber(management_sub_num);
	establishmentLectureInfo.setSubjectName(sub_name);
	establishmentLectureInfo.setLectureName(request.getParameter("lectureName"));
	establishmentLectureInfo.setLecturerName(request.getParameter("lecturerName"));
	establishmentLectureInfo.setClassRoom(request.getParameter("classRoom"));
	establishmentLectureManagement.regEstablishmentLecture(establishmentLectureInfo);
%>

<script type="text/javascript">
	alert("등록 되었습니다!");
	javascript: location.href = "../EstablishmentLectureManagement/inquireEstablishmentLectureView.jsp"
</script>
