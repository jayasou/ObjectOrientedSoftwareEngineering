<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="managementSubjectStyle.css">
<script type="text/javascript" src="managementSubjectScript.js"></script>
</head>
<%
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
%>

<body>
	<form method="post" onsubmit="javascript:return on_submit();" action="regManagementSubject.jsp" method="post">
		<fieldset style="border: 0">
			<div align="center">
				<h2>운영과목 등록</h2>
				<table>
					<tr align="center">
						<td width="300x">운영 과목 명 : <input style="" name="managementSubName"></td>
						<td width="300x">운영 센터 : <input style="" name="managementCenter"></td>
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
						style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">학습 목표</td>
					<td><input type="text" name="goal" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">수강 대상</td>
					<td><input type="text" name="target" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">과목의 특장점</td>
					<td><input type="text" name="benefits" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">총 강의 일수</td>
					<td><input type="text" name="totalDuration"
						style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">총 강의 시간</td>
					<td><input type="text" name="hours" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">모집인원</td>
					<td><input type="text" name="capacity" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center">수강료</td>
					<td><input type="text" name="tuition" style="width: 100%"></td>
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
						style="width: 100%; padding: 50px"></td>
				</tr>
			</table>
		</fieldset>

		<br>

		<div align="center">
			<input type="submit" value="등록" class="btn_submit"> <input
				type="button" value="취소" class="btn_cancle" onclick="cancle()">
		</div>
	</form>
</body>
</html>