<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="employee_info" class="EmployeeInfoManagement.Employee" />
<jsp:useBean id="employee_management"
	class="EmployeeInfoManagement.EmployeeManagement" />
<jsp:useBean id="employee_view"
	class="EmployeeInfoManagement.EmployeeView" />
<jsp:useBean id="dbController" class="DatabaseManagement.DBController" />
<%
	request.setCharacterEncoding("UTF-8");
	employee_info.setId(request.getParameter("input_id"));
	employee_info.setPassword(request.getParameter("input_password"));
	employee_info.setEmployeeId(request.getParameter("input_employee_id"));
	employee_info.setKoreanName(request.getParameter("input_kor_name"));
	employee_info.setEnglishName(request.getParameter("input_eng_name"));

	// 주민번호 첫번째 + 두번째
	String ssn_fst = request.getParameter("input_ssn_fst");
	String ssn_sec = request.getParameter("input_ssn_sec");
	String ssn = ssn_fst + "-" + ssn_sec;

	employee_info.setSsn(ssn);
	employee_info.setSex(request.getParameter("input_sex"));
	employee_info.setAddress(request.getParameter("input_address"));
	employee_info.setResidenceAddress(request.getParameter("input_res_address"));

	// 휴대폰 번호 첫번째 + 두번째 + 세번째
	String phone_num_fst = request.getParameter("input_phone_fst");
	String phone_num_sec = request.getParameter("input_phone_sec");
	String phone_num_tir = request.getParameter("input_phone_tir");
	String phone_num = phone_num_fst + "-" + phone_num_sec + "-" + phone_num_tir;

	employee_info.setCellPhoneNum(phone_num);

	// 집전화 번호 첫번째 + 두번째 + 세번째
	String phone_home_num_fst = request.getParameter("input_home_phone_fst");
	String phone_home_num_sec = request.getParameter("input_home_phone_sec");
	String phone_home_num_tir = request.getParameter("input_home_phone_tir");
	String phone_home_num = phone_home_num_fst + "-" + phone_home_num_sec + "-" + phone_home_num_tir;

	employee_info.setPhoneHomeNum(phone_home_num);

	// 비상전화 번호 첫번째 + 두번째 + 세번째
	String phone_emergency_num_fst = request.getParameter("input_emergency_phone_fst");
	String phone_emergency_num_sec = request.getParameter("input_emergency_phone_sec");
	String phone_emergency_num_tir = request.getParameter("input_emergency_phone_tir");
	String phone_emergency_num = phone_emergency_num_fst + "-" + phone_emergency_num_sec + "-"
			+ phone_emergency_num_tir;

	employee_info.setEmergencyCallNum(phone_emergency_num);

	// 이메일 첫번째 + 두번째
	String email_fst = request.getParameter("input_email_fst");
	String email_sec = request.getParameter("input_email_sec");
	String email = email_fst + "@" + email_sec;

	employee_info.setEmail(email);

	employee_info.setBankCode(request.getParameter("input_bank_code"));
	employee_info.setAccountNum(request.getParameter("input_account_num"));
	employee_info.setAccountHolder(request.getParameter("input_account_holder"));

	String id = request.getParameter("input_id");
	ResultSet studentRS = dbController.chkStudentID(id);
	ResultSet employeeRS = dbController.chkEmployeeID(id);

	String testStudentID = "";
	String testEmployeeID = "";
	while (studentRS.next()) {
		testStudentID = studentRS.getString("id");
	}
	while (employeeRS.next()) {
		testEmployeeID = employeeRS.getString("id");
	}

	if (testStudentID == "" && testEmployeeID == "") {
		employee_management.regEmployee(employee_info);
		session.setAttribute("employee_info", employee_info);
		
		System.out.println("studentID : "+testStudentID);
		System.out.println("employeeID : "+testEmployeeID);
%>
<script type="text/javascript">
	alert("등록 되었습니다!");
	javascript: location.href = "../MainView/mainBackground.jsp"
</script>

<%
	} else {
		System.out.println("studentID : "+testStudentID);
		System.out.println("employeeID : "+testEmployeeID);
%>
<script type="text/javascript">
	alert("중복된 ID입니다.");
	javascript: location.href = "../EmployeeManagement/joinEmployeeView.html"
</script>
<%
	}
%>