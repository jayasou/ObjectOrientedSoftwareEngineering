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
	//Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	String radioValue = request.getParameter("radio");
	
	int managementSubNum = Integer.parseInt(radioValue);

	if (radioValue == "null")
		return;
	
	else
		manage_subject_info.setManageSubject(managementSubNum);
	
	String openCheck = "";
	if(manage_subject_info.getOpenCheck().equals("0"))
		openCheck = "미개설";
	else
		openCheck = "개설";
%>

<body>
	<form action="regManagementSubject.jsp" method="post">
		<fieldset style="border: 0">
			<div align="center">
				<h2>운영과목 상세 조회</h2>
				<table>
					<tr align="center">
						<td width="200x">운영 과목 명 : <%= manage_subject_info.getManagementSubName()%></td>
						<td width="200px">운영 센터 : <%= manage_subject_info.getManagementCenter()%></td>
						<td width="200px">등록자 : <%=manage_subject_info.getEmployeeName()%></td>
					</tr>
					<tr align="center"><td colspan="3">개설여부 : <%=openCheck%></td></tr>
				</table>
			</div>
		</fieldset>
		<br>
		<fieldset>
			<table style="width: 95%">
				<tr>
					<td align="center">과목 설명</td>
					<td><%= manage_subject_info.getSubjectDescription()%></td>
				</tr>
				<tr>
					<td align="center">학습 목표</td>
					<td><%= manage_subject_info.getGoal()%></td>
				</tr>
				<tr>
					<td align="center">수강 대상</td>
					<td><%= manage_subject_info.getTarget()%></td>
				</tr>
				<tr>
					<td align="center">과목의 특장점</td>
					<td><%= manage_subject_info.getBenefits()%></td>
				</tr>
				<tr>
					<td align="center">총 강의 일수</td>
					<td><%= manage_subject_info.getTotalDuration()%></td>
				</tr>
				<tr>
					<td align="center">총 강의 시간</td>
					<td><%= manage_subject_info.getHours()%></td>
				</tr>
				<tr>
					<td align="center">모집인원</td>
					<td><%= manage_subject_info.getCapacity()%></td>
				</tr>
				<tr>
					<td align="center">수강료</td>
					<td><%= manage_subject_info.getTuition()%></td>
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
					<td><%= manage_subject_info.getLectureContents()%></td>
				</tr>
			</table>
		</fieldset>

		<br>

		<div align="center">
			<input type="button" value="목록으로 돌아가기" class="btn_cancle" onclick="back()">
		</div>
	</form>
</body>
</html>

