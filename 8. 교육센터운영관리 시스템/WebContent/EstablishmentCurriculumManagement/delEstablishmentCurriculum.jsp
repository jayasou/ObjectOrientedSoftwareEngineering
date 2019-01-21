<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="establishment_curriculum_info"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculum" />
<jsp:useBean id="establishment_curriculum_management"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculumManagement" />
<%
	String radioValue = request.getParameter("radio");
	System.out.print(radioValue);
	if(radioValue == "null")
		return;

	establishment_curriculum_management.delEstablishmentCurriculum(radioValue);
%>

<script type="text/javascript">

	var retVal = confirm("정말 삭제 하시겠습니까?");
	if (retVal == true) {
		alert("삭제 되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
	location.href = "../EstablishmentCurriculumManagement/inquireEstablishmentCurriculumView.jsp"
</script>	