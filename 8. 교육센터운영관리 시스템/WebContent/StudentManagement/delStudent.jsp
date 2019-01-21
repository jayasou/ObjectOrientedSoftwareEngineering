<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="student_info" class="StudentInfoManagement.Student" />
<jsp:useBean id="student_management" class="StudentInfoManagement.StudentManagement" />

<%
	Student student = (StudentInfoManagement.Student) session.getAttribute("student");
	
	String del_id = student.getID();
	student_management.delStudent(del_id);
	session.setAttribute("student_info", null);
	session.setAttribute("member", null);
	session.setAttribute("login", null);
%>

<script type="text/javascript">

	var retVal = confirm("정말 탈퇴 하시겠습니까?");
	if (retVal == true) {
		alert("탈퇴 되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
	parent.location.href = "../MainView/mainView.jsp"
</script>