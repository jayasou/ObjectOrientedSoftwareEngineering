<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="employee_info" class="EmployeeInfoManagement.Employee" />
<jsp:useBean id="employee_management" class="EmployeeInfoManagement.EmployeeManagement" />

<%
	request.setCharacterEncoding("UTF-8");
	Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
	
	String del_id = employee.getId();
	employee_management.delEmployee(del_id);
	session.setAttribute("employee_info", null);
	session.setAttribute("member", null);
	session.setAttribute("login", null);
%>

<script type="text/javascript">

	var retVal = confirm("정말 탈퇴 하시겠습니까?");
	if (retVal == true) {
		alert("탈퇴 되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
	parent.location.href = "../MainView/mainView.jsp"
</script>

