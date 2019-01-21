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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="establishmentLectureStyle.css">
<script type="text/javascript" src="establishmentLectureScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String radioValue = request.getParameter("radio");
	System.out.print(radioValue);

	int establish_lecture_num = Integer.parseInt(radioValue);

	if (radioValue == "null")
		return;

	else
		establishment_lecture_info.setEstablishmentLecture(establish_lecture_num);
%>


<body>
	<form method="post" onsubmit="return on_submit();" action="updateEstablishmentLecture.jsp" method="post">
		<div align="center">
			<h2>개설 강의 수정</h2>
		</div>

		<%
			ResultSet rs = establishment_lecture_management.inqurieEstablishmentLecture();
			int establishment_lecture_num = 0;
			while (rs.next()) {
				establishment_lecture_num = rs.getInt("lectureNumber");
			}
		%>
		<div style="display: none">
			<input name="index" value="<%=establishment_lecture_num%>">
		</div>
		<fieldset>
			<div align="center">
				<table style="width: 400px">
					<tr>
						<td colspan="2">개설 과목 선택</td>
					</tr>

					<tr>
						<td colspan="2"><select style="width: 100%"
							name="subjectName" id="subjectName">
								<%
									ResultSet rs2 = manage_subject_management.inqurieManagementSubject();
									while (rs2.next()) {
										if (rs2.getString("openCheck").equals("1")) {
								%>

								<option><%=rs2.getString("managementSubName")%></option>
								<%
									}
									}
								%>
						</select></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td colspan="2">강의 명</td>
					</tr>

					<tr>
						<td colspan="2"><input type="text" name="lectureName" style="width: 100%" value="<%=establishment_lecture_info.getLectureName()%>"></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td>강사 명</td>
						<td>강의실</td>
					</tr>

					<tr>
						<td><input type="text" name="lecturerName" style="width: 150px" value="<%=establishment_lecture_info.getLecturerName()%>"></td>
						<td><input type="text" name="classRoom" style="width: 150px" value="<%=establishment_lecture_info.getClassRoom()%>"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<br>
		<div align="center">
			<input type="submit" value="저장" class="button"> 
			<input type="button" value="취소" class="button" onclick="cancle()">
		</div>
	</form>
</body>
</html>