<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="courseInfo" class="CourseManagement.Course">
</jsp:useBean>
<jsp:useBean id="courseManagement"
	class="CourseManagement.CourseManagement">
</jsp:useBean>

<jsp:useBean id="curriculumInfo"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculum"></jsp:useBean>
<jsp:useBean id="curriculumManagement"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculumManagement"></jsp:useBean>


<html>
<head>
<link rel="stylesheet" href="courseStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="courseScript.js"></script>
</head>
<body>
	<form id="su" action="regCourse.jsp" method="post">
		<div align="center">
			<h1>수강신청등록</h1>

			<table style="width: 70%;">
				<tr>
					<td align="right">과정 명</td>
					<td><select style="width: 70%;'" name="curriculumName"
						id="curriculumName">
							<%
								ResultSet rs2 = courseManagement.inqurieCurriculum();
								while (rs2.next()) {
							%>
							<option><%=rs2.getString("curriculumName")%></option>
							<%
								}
							%>
					</select></td>
				</tr>
			</table>

			<br> <input type="submit" value="등록" class="button" onclick="'">
			<input type="button" value="목록으로 돌아가기" class="button"
				onclick="go('inquireCourseView.jsp')">
		</div>
	</form>
</body>
</html>