<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="courseManagement"
	class="CourseManagement.CourseManagement" />
	
<%
	String radioValue = request.getParameter("radio");
	System.out.println(radioValue);
	System.out.println("radioValue : " + radioValue);

	if (radioValue == "null")
		return;

	courseManagement.delCourse(radioValue);

	System.out.println("delCourse실행되는데???..아니네..");
%>

<script type="text/javascript">
	var retVal = confirm("정말 삭제 하시겠습니까?");
	if (retVal == true) {
		alert("삭제 되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
	location.href = "../CourseManagement/inquireCourseView.jsp"
</script>
