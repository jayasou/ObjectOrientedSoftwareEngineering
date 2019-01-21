<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="employeeStyle.css">
</head>
<body>
	<%
		Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	%>
	<form action="updateEmployeeView.jsp" method="post">
		<div align="center">
			<h1>직원 정보 조회</h1>
			<fieldset>
				<legend>기본정보</legend>
				<table style="width: 800px">
					<tr>
						<td>한글 성명</td>
						<td><%=employee.getKoreanName()%></td>
						<td>영어 성명</td>
						<td><%=employee.getEnglishName()%></td>
					</tr>

					<tr>
						<td>주민등록번호</td>
						<td><%=employee.getSsn()%></td>
						<td>성별</td>
						<td><%=employee.getSex()%></td>
					</tr>

					<tr>
						<td>직원ID</td>
						<td colspan="4"><%=employee.getEmployeeId()%></td>
					</tr>

					<tr>
						<td>ID</td>
						<td><%=employee.getId()%></td>
						<td>비밀번호</td>
						<td><%=employee.getPassword()%></td>
					</tr>
				</table>
			</fieldset>

			<fieldset>
				<legend>연락처 정보</legend>
				<table style="width: 800px">
					<tr>
						<td>주민등록지주소</td>
						<td colspan="5"><%=employee.getResidenceAddress()%></td>
					</tr>

					<tr>
						<td>거주지주소</td>
						<td colspan="4"><%=employee.getAddress()%></td>
					</tr>

					<tr>
						<td>집전화번호</td>
						<td><%=employee.getPhoneHomeNum()%></td>
					</tr>

					<tr>
						<td>휴대폰 번호</td>
						<td><%=employee.getCellPhoneNum()%></td>
					</tr>

					<tr>
						<td>비상연락번호</td>
						<td><%=employee.getEmergencyCallNum()%></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><%=employee.getEmail()%></td>
					</tr>
				</table>
			</fieldset>

			<fieldset>
				<legend>계좌 정보</legend>
				<table style="width: 800px">
					<tr>
						<td>은행 코드</td>
						<td><%=employee.getBankCode()%></td>
					</tr>

					<tr>
						<td>계좌번호</td>
						<td><%=employee.getAccountNum()%></td>
					</tr>

					<tr>
						<td>예금주 명</td>
						<td><%=employee.getAccountHolder()%></td>
					</tr>
				</table>
			</fieldset>
		</div>
	</form>

	<table align="center">
		<tr>
			<td><form action="updateEmployeeView.jsp" method="post">
					<input type="submit" value="수정" class="btn_submit">
				</form></td>
			<td><form action="delEmployee.jsp" method="post">
					<input type="submit" value="탈퇴" class="btn_cancle">
				</form></td>
		</tr>
	</table>
</body>
</html>