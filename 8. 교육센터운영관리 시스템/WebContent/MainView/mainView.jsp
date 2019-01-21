<%@page import="EmployeeInfoManagement.Employee"%>
<%@page import="StudentInfoManagement.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="mainStyle.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="mainScript.js"></script>
<script type="text/javascript" src="../MemberManagement/memberScript.js"></script>

<title>교육센터운영관리 시스템</title>
</head>
<body>

<!-- Header부분 ~ Nav부분까지 적용시켜 놓은것 Start-->
	<header>
	<div align="right">
		<%
			String member = (String)session.getAttribute("member");
			if(member == null)
				session.setAttribute("member", "null");
		
			String isLogin = (String) session.getAttribute("login");
			if (isLogin == null) 
			{
		%>
		<form action="login.jsp" >
			<table id="login_table" >
				<tr>
					<td id="id">아이디</td>
					<td
					><input type="text" name="input_id" class="input_id"></td>
					<td><input type="submit" value="LOGIN" name="login" class="login"></td>
				</tr>

				<tr>
					<td id="passwd">비밀번호</td>
					<td><input type="password" name="input_password" class="input_password"></td>
					<td><input type="button" onclick="join_member()" value="회원가입" name="join" class="join"></td>
				</tr>
			</table>
		</form>

		<nav>
		<div id="nav_div" align="left">GUEST</div>
		</nav>
		<%
			}

			else {
		%>
		<form action="logout.jsp" >
		<table id="logout_table">
			<tr>
				<td colspan="2" style="color: white;">
					<%
						member = (String) session.getAttribute("member");
						if (member.equals("STUDENT")) {
							Student student = (StudentInfoManagement.Student) session.getAttribute("student");
							out.print(student.getName());
						}
						
						else if(member.equals("EMPLOYEE"))
						{
							Employee employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
							out.print(employee.getKoreanName());
						}
					%>
					님 환영합니다.
				</td>
			</tr>
			<tr>
			<td width="80px"></td>
			<td><input type="submit" value="LOGOUT" name="logout"></td>
			</tr>
		</table>
		</form>

	</div>
	</header>


<!-- Nav 부분 적용시켜 놓은것 Start -->
	<nav>
	<div id="nav_div" align="left">
		<%
			member = (String) session.getAttribute("member");
				if (member.equals("STUDENT")) {
		%>
			업무선택 <select>
						<option selected="selected">수강생</option>
					</select> <input type="button" value="선택" onclick="change_asside()">
		<%
			}
		%>
		<%
			if (member.equals("EMPLOYEE")) {
		%>
		업무선택 <select id="select_job">
					<option>직원</option>
					<option >수강생</option>
				</select> <input type="button" value="선택" onclick="change_asside2()" id="bbb">
		<%
			}
		%>
	</div>
	</nav>
	<%
		} // 얘는 헤더부분에서 else끝날때 부분임. 착각하지말기.
	%>



<!-- Aside 부분 적용시켜 놓은것 Start -->
	<aside>
		<iframe src="optionNoMemberView.html"  id="aside_iframe" onload="autoResize(this)" scrolling="no">
		</iframe>
		<%
			member = (String) session.getAttribute("member");
			if (member.equals("STUDENT")) {		
		%>
			<script type="text/javascript">
				url = "optionStudendView.html";
				document.getElementById("aside_iframe").src = url;
			</script>
		<%
			}
			else if(member.equals("EMPLOYEE"))
			{	
		%>
			<script type="text/javascript">
				url = "optionEmployeeView.html";
				document.getElementById("aside_iframe").src = url;
			</script>
		<%
			}
			else if(member.equals("null"))
			{
		%>		
				<script type="text/javascript">
				url = "optionNoMemberView.html";
				document.getElementById("aside_iframe").src = url;
				</script>
		<%
			}
		%>
	</aside>

<!-- Section 부분 적용시켜 놓은것 Start -->
	<section>
	<iframe src="" id="section_iframe" onload="autoResize(this)" scrolling="no" > 	
	</iframe> 
	</section>
</body>

</html>