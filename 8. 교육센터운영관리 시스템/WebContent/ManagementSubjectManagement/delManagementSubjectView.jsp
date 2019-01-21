<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="manage_subject_management"
	class="ManageSubjectManagement.ManageSubjectManagement" />
<%
	String radioValue = request.getParameter("radio");
	System.out.print(radioValue);
	if(radioValue == "null")
		return;

	manage_subject_management.delManagementSubject(radioValue);
%>

<script type="text/javascript">

	var retVal = confirm("정말 삭제 하시겠습니까?");
	if (retVal == true) {
		alert("삭제 되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
	location.href = "../ManagementSubjectManagement/inquireManagementSubjectView.jsp"
</script>	