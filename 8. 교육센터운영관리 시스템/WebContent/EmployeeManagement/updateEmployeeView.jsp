<!DOCTYPE html>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="employee_info" class="EmployeeInfoManagement.Employee" />
<jsp:useBean id="employee_management" class="EmployeeInfoManagement.EmployeeManagement" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="employeeStyle.css">
<script type="text/javascript" src="employeeScript.js"></script>

</head>
<body>
<%
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");

	employee_info.setEmployee(employee.getId());
	
	// 주민번호 split
	String input_ssn = employee_info.getSsn();
	String[] input_ssn_split = input_ssn.split("-");
	String input_ssn_fst = input_ssn_split[0];
	String input_ssn_sec = input_ssn_split[1];
	
	// 집전화번호 split
	String input_home_phone = employee_info.getPhoneHomeNum();
	String[] home_phone_split = input_home_phone.split("-");
	String input_home_phone_fst = home_phone_split[0];
	String input_home_phone_sec = home_phone_split[1];
	String input_home_phone_tir = home_phone_split[2];
	
	// 휴대폰번호 split
	String input_cell_phone = employee_info.getCellPhoneNum();
	String[] cell_phone_split = input_cell_phone.split("-");
	String input_cell_phone_fst = cell_phone_split[0];
	String input_cell_phone_sec = cell_phone_split[1];
	String input_cell_phone_tir = cell_phone_split[2];
	
	// 비상번호 split
	String input_emergy_phone = employee_info.getEmergencyCallNum();
	String[] emergy_phone_split = input_emergy_phone.split("-");
	String input_emergy_phone_fst = emergy_phone_split[0];
	String input_emergy_phone_sec = emergy_phone_split[1];
	String input_emergy_phone_tir = emergy_phone_split[2];
	
	// 이메일 split
	String input_email = employee_info.getEmail();
	String[] email_split = input_email.split("@");
	String input_email_fst = emergy_phone_split[0];
	String input_email_sec = emergy_phone_split[1];
%>
	<form action="updateEmployee.jsp" method="post">
	<div align="center">
	<h1>직원 정보 수정</h1>
		<fieldset>
			<legend>기본정보</legend>
			<table style="width: 800px">
				<tr>
					<td>한글 설명</td>
					<td><input type="text" name="input_kor_name" value="<%=employee_info.getKoreanName()%>"></td>
					<td>영문 성명</td>
					<td><input type="text" name="input_eng_name" value="<%=employee_info.getEnglishName()%>"></td>
				</tr>
				
				<tr>
					<td>주민등록번호</td>
					<td><input type="text" name="input_ssn_fst" value="<%=input_ssn_fst%>"> - <input type="text" name="input_ssn_sec" value="<%=input_ssn_sec%>"></td>
					<td>성별</td>
					<td><select name="input_sex">
							<option selected="selected">남</option>
							<option>여</option>
					</select></td>
				</tr>
				
				<tr>
					<td>직원ID</td>
					<td colspan="4"><%=employee.getEmployeeId()%></td>
				</tr>
				
				<tr>
					<td>ID</td>
					<td><%=employee.getId()%></td>
					<td>비밀번호</td>
					<td><input type="password" name="input_password" value="<%=employee_info.getPassword()%>"></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>연락처 정보</legend>
			<table style="width: 800px">
				<tr>
					<td>주민등록지주소</td>
					<td colspan="5"><input type="text" style="width: 650px" name="input_res_address" value="<%=employee_info.getResidenceAddress()%>"></td>
				</tr>
				
				<tr>
					<td>거주지주소</td>
					<td colspan="4"><input type="text" style="width: 650px" name="input_address" value="<%=employee_info.getAddress()%>"></td>
				</tr>
				
				<tr>
					<td>집전화번호</td>
					<td><input type="text" style="width: 50px" name="input_home_phone_fst" value="<%=input_home_phone_fst%>"> - <input type="text" style="width: 50px" name="input_home_phone_sec" value="<%=input_home_phone_sec%>"> - <input type="text" style="width: 50px" name="input_home_phone_tir" value="<%=input_home_phone_tir%>"></td>
				</tr>
				
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" style="width: 50px" name="input_phone_fst" value="<%=input_cell_phone_fst%>"> - <input type="text" style="width: 50px" name="input_phone_sec" value="<%=input_cell_phone_sec%>"> - <input type="text" style="width: 50px" name="input_phone_tir" value="<%=input_cell_phone_tir%>"></td>
				</tr>
				
				<tr>
					<td>비상연락번호</td>
					<td><input type="text" style="width: 50px" name="input_emergency_phone_fst" value="<%=input_emergy_phone_fst%>"> - <input type="text" style="width: 50px" name="input_emergency_phone_sec" value="<%=input_emergy_phone_sec%>"> - <input type="text" style="width: 50px" name="input_emergency_phone_tir" value="<%=input_emergy_phone_tir%>"></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td><input type="text" style="width: 200px" name="input_email_fst" value="<%=input_email_fst%>"> @ <input type="text" style="width: 200px" name="input_email_sec" value="<%=input_email_sec%>"> 
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>계좌 정보</legend>
			<table style="width: 800px">
				<tr>
					<td>은행 코드</td>
					<td><input type="text" style="width: 680px" name="input_bank_code" value="<%=employee_info.getBankCode()%>"></td>
				</tr>
				
				<tr>
					<td>계좌번호</td>
					<td><input type="text" style="width: 680px" name="input_account_num" value="<%=employee_info.getAccountNum()%>"></td>
				</tr>
				
				<tr>
					<td>예금주 명</td>
					<td><input type="text" style="width: 680px" name="input_account_holder" value="<%=employee_info.getAccountHolder()%>"></td>
				</tr>
			</table>
		</fieldset>
		
	</div>
	<br>
	<div align="center">
		<input type="submit" value="수정" class="btn_submit"> 
		<input type="button" value="취소" class="btn_cancle" onclick="cancle()">
	</div>
	</form>
</body>
</html>