<% request.setCharacterEncoding("UTF-8"); %>
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
<%
	String radioValue = request.getParameter("radio");

	int establish_curriculum_num = Integer.parseInt(radioValue);

	if (radioValue == "null")
		return;

	else
		establishment_curriculum_info.setEstablishmentCurriculum(establish_curriculum_num);
%>
<body>
	<form action="updateEstablishmentCurriculum.jsp" id="su">
	<div align="center">
		<div style="display: none">
			<input name="index" value=0 id="index">
		</div>
		
		<%
			ResultSet rs = establishment_curriculum_management.inqurieEstablishmentCurriculum();
			int establishment_curriculum_num = 0;
			while (rs.next()) {
				establishment_curriculum_num = rs.getInt("curriculumNumber");
				
			}
		%>
		<div style="display: none">
			<input name="index2" value="<%=establishment_curriculum_num%>">
		</div>
		
			<h1>개설 과정 상세조회</h1>
			<div></div>
			<table width="800px">
				<tr>
					<td style="text-align: right;">개설 과정 명&nbsp;&nbsp; : &nbsp;&nbsp;</td>
					<td colspan="4"><%=establishment_curriculum_info.getCurriculumName()%></td>
				
			</table>
			<fieldset>
				<table id="curriculum_table" style="width: 800px">
					<tr>
						<td style="color: green; font-weight: bold; text-align: center;">번호</td>
						<td style="color: green; font-weight: bold; text-align: center;">과목 명</td>
						<td style="color: green; font-weight: bold; text-align: center;">강의 명</td>
					</tr>
					
					<%
						String lectures = establishment_curriculum_info.getLectureName();
						String subjects = establishment_curriculum_info.getSubjectName();
					
						String[] lecture_split = lectures.split("/");
						String[] subject_split = subjects.split("/");
						
						int count = 0;
						for(int i = 0; i < lectures.length(); i++)
						{
							if(lectures.charAt(i) == '/')
								count ++;
						}
						
						int lecture_count = count + 1;
						
						for(int i = 0; i < lecture_count; i++)
						{
					%>	
						<tr>
							<td style="text-align: center;"><%=i+1%></td>
							<td style="text-align: center;"><%=subject_split[i]%></td>
							<td style="text-align: center;"><%=lecture_split[i]%></td>
						</tr>
					<% 	
						}
					%>
				</table>
			</fieldset>
		</div>
		<br>
		<div align="center">
			<input type="button" value="목록으로 돌아가기" class="button" onclick="back()">
		</div>
		<div style="display: none">
			<input name="hidden" value="" id="hidden">
		</div>
	</form>
</body>
</html>