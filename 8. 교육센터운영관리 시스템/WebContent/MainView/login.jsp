<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="mainScript.js"></script>
<jsp:useBean id="login" class="Login.Login" />
<jsp:useBean id="login_management" class="Login.LoginManagement" />
<jsp:useBean id="student_info" class="StudentInfoManagement.Student" />
<jsp:useBean id="employee_info" class="EmployeeInfoManagement.Employee" />

<%
		String input_id = request.getParameter("input_id");
		String input_password = request.getParameter("input_password");
		
		request.setCharacterEncoding("UTF-8");
		login.setId(input_id);
		login.setPassword(input_password);
		
		if (!login_management.login(login))
		{
	%>
<script type="text/javascript">
		alert("아이디 또는 비밀번호가 틀렸습니다.");
	<%	
		session.setAttribute("login", null);
	%>
		location.href = "mainView.jsp";
</script>
<%
		}

		else 
		{
	%>
<script type="text/javascript">
		alert("로그인 되었습니다!");
</script>		
	<%
		session.setAttribute("login", "check");
		String isLogin = (String) session.getAttribute("login");
		out.println(isLogin);
		
		if(login_management.whoMember(login).equals("STUDENT"))
		{
			session.setAttribute("member", "STUDENT");
			session.setAttribute("student", student_info);
			student_info.setStudent(input_id);
			//Student student = (StudentInfoManagement.Student) session.getAttribute("student");
		}
		
		else if(login_management.whoMember(login).equals("EMPLOYEE"))
		{
			session.setAttribute("member", "EMPLOYEE");
			session.setAttribute("employee", employee_info);
			employee_info.setEmployee(input_id);
			//Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
		}
	%>
	<script type="text/javascript">
		location.href = "mainView.jsp";
	</script>
	<%}%>
		
