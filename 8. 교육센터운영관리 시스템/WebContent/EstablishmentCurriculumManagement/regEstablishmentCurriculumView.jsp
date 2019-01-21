
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="establishment_lecture_info"
	class="EstablishmentLectureManagement.EstablishmentLecture" />
<jsp:useBean id="establishment_lecture_management"
	class="EstablishmentLectureManagement.EstablishmentLectureManagement" />

<jsp:useBean id="manage_subject_info"
	class="ManageSubjectManagement.ManageSubject" />
<jsp:useBean id="manage_subject_management"
	class="ManageSubjectManagement.ManageSubjectManagement" />

<jsp:useBean id="establishment_curriculum_info"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculum" />
<jsp:useBean id="establishment_curriculum_management"
	class="EstablishmentCurriculumManagement.EstablishmentCurriculumManagement" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="establishmentCurriculumStyle.css">
<script type="text/javascript" src="establishmentCurriculumScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="su" method="post" onsubmit="return on_submit();"
		action="regEstablishmentCurriculum.jsp">
		<div align="center">
			<div style="display: none">
				<input name="index" value=0 id="index">
			</div>
			<h1>개설 과정 등록</h1>
			<div></div>
			<table width="800px">
				<tr>
					<td>개설 과정 명</td>
					<td colspan="4"><input type="text" name="curriculumName"
						size="75"></td>
				<tr>
					<td style="text-align: right;">개설강의</td>
					<td><select style="width: 100%" id="lecture_name"
						name="lecture_name">
							<%
								ResultSet rs1 = establishment_lecture_management.inqurieEstablishmentLecture();
								while (rs1.next()) {
							%>
							<option><%=rs1.getString("lectureName")%></option>
							<%
								}
							%>
					</select></td>
					<td><input type="button" name="add_curriculum" value="추가하기"
						onclick="add_row()"></td>
				</tr>
			</table>
			<fieldset>
				<table id="curriculum_table" style="width: 800px">
					<tr>
						<td style="color: green; font-weight: bold;">번호</td>
						<td colspan="2" style="color: green; font-weight: bold;">강의 명</td>
					</tr>
				</table>
			</fieldset>
		</div>
		<br>
		<div align="center">
			<input type="submit" value="등록" class="button"> <input
				type="button" value="취소" class="button" onclick="cancle()">
		</div>
		<div style="display: none">
			<input name="hidden" value="" id="hidden">
		</div>
	</form>
</body>
</html>