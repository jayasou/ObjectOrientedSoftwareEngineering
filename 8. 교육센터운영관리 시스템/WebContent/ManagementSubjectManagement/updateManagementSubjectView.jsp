<!DOCTYPE html>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="manage_subject_info"
	class="ManageSubjectManagement.ManageSubject" />
<jsp:useBean id="manage_subject_management"
	class="ManageSubjectManagement.ManageSubjectManagement" />
<jsp:useBean id="manage_subject_view"
	class="ManageSubjectManagement.ManageSubjectView" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="managementSubjectStyle.css">
<script type="text/javascript" src="managementSubjectScript.js"></script>
</head>
<%
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	String radioValue = request.getParameter("radio");
	System.out.print(radioValue);
	
	int managementSubNum = Integer.parseInt(radioValue);

	if (radioValue == "null")
		return;
	
	else
		manage_subject_info.setManageSubject(managementSubNum);
%>

<body>
	<form method="post" onsubmit="return on_submit();" action="updateManagementSubject.jsp" method="post">
		<fieldset style="border: 0">
			<div align="center">
				<h2>운영과목 수정</h2>
				<div style="display: none"><input name="index" value="<%=managementSubNum%>"></div>
				<table>
					<tr>
						<td width="300x">운영 과목 명 : <input style="" name="managementSubName" value="<%= manage_subject_info.getManagementSubName()%>"></td>
						<td width="300x">운영 센터 : <input style="" name="managementCenter" value="<%= manage_subject_info.getManagementCenter()%>"></td>
						<td width="200x">등록자 : <%=employee.getKoreanName()%></td>					
					</tr>
					
					<tr align="center"><td colspan="3">개설여부 : <input type="radio" name="openCheck" value="1">개설  &nbsp;&nbsp; <input type="radio" name="openCheck" checked="checked" value="0"> 미개설</td></tr>
				</table>
			</div>
		</fieldset>
		<br>
		<fieldset>
			<table style="width: 95%">
				<tr>
					<td align="center">과목 설명</td>
					<td><input type="text" name="subjectDescription"
						style="width: 100%" value="<%= manage_subject_info.getSubjectDescription()%>" ></td>
				</tr>
				<tr>
					<td align="center">학습 목표</td>
					<td><input type="text" name="goal" style="width: 100%" value="<%= manage_subject_info.getGoal()%>" ></td>
				</tr>
				<tr>
					<td align="center">수강 대상</td>
					<td><input type="text" name="target" style="width: 100%" value="<%= manage_subject_info.getTarget()%>" ></td>
				</tr>
				<tr>
					<td align="center">과목의 특장점</td>
					<td><input type="text" name="benefits" style="width: 100%" value="<%= manage_subject_info.getBenefits()%>" ></td>
				</tr>
				<tr>
					<td align="center">총 강의 일수</td>
					<td><input type="text" name="totalDuration"
						style="width: 100%" value="<%= manage_subject_info.getTotalDuration()%>" ></td>
				</tr>
				<tr>
					<td align="center">총 강의 시간</td>
					<td><input type="text" name="hours" style="width: 100%" value="<%= manage_subject_info.getHours()%>" ></td>
				</tr>
				<tr>
					<td align="center">모집인원</td>
					<td><input type="text" name="capacity" style="width: 100%" value="<%= manage_subject_info.getCapacity()%>" ></td>
				</tr>
				<tr>
					<td align="center">수강료</td>
					<td><input type="text" name="tuition" style="width: 100%" value="<%= manage_subject_info.getTuition()%>"></td>
				</tr>
			</table>
		</fieldset>
		<br>
		<fieldset>
			<table style="width: 95%">
				<tr>
					<td>강의내용</td>
				</tr>

				<tr>
					<!-- textarea?? -->
					<td><input type="text" name="lectureContents"
						style="width: 100%; padding: 50px" value="<%= manage_subject_info.getLectureContents()%>"></td>
				</tr>
			</table>
		</fieldset>

		<br>

		<div align="center">
			<input type="submit" value="수정" class="btn_submit"> <input
				type="button" value="취소" class="btn_cancle" onclick="cancle()">
		</div>
	</form>
</body>
</html>

