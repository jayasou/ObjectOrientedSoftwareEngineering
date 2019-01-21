<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="manage_subject_info"
	class="ManageSubjectManagement.ManageSubject" />
<jsp:useBean id="manage_subject_management"
	class="ManageSubjectManagement.ManageSubjectManagement" />
<jsp:useBean id="manage_subject_view"
	class="ManageSubjectManagement.ManageSubjectView" />

<%
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");

	request.setCharacterEncoding("UTF-8");
	String managementSubNum = request.getParameter("index");
	
	manage_subject_info.setEmployeeName(employee.getKoreanName());
	manage_subject_info.setManagementSubName(request.getParameter("managementSubName"));
	manage_subject_info.setManagementCenter(request.getParameter("managementCenter"));
	manage_subject_info.setSubjectDescription(request.getParameter("subjectDescription"));
	manage_subject_info.setGoal(request.getParameter("goal"));
	manage_subject_info.setTarget(request.getParameter("target"));
	manage_subject_info.setBenefits(request.getParameter("benefits"));
	manage_subject_info.setTotalDuration(request.getParameter("totalDuration"));
	manage_subject_info.setHours(request.getParameter("hours"));
	manage_subject_info.setCapacity(request.getParameter("capacity"));
	manage_subject_info.setTuition(request.getParameter("tuition"));
	manage_subject_info.setLectureContents(request.getParameter("lectureContents"));
	manage_subject_info.setOpenCheck(request.getParameter("openCheck"));

	manage_subject_management.updateManageSubjectInfo(managementSubNum, manage_subject_info);
%>

<script type="text/javascript">
	alert("수정 되었습니다!");
	javascript: location.href = "../ManagementSubjectManagement/inquireManagementSubjectView.jsp"
</script>

