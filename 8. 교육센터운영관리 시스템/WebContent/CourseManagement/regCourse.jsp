<%@page import="java.sql.ResultSet"%>
<%@page import="StudentInfoManagement.Student"%>
<%@page import="EmployeeInfoManagement.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="course_info" class="CourseManagement.Course" />
<jsp:useBean id="course_management"
	class="CourseManagement.CourseManagement" />
<jsp:useBean id="dbController" class="DatabaseManagement.DBController" />
<%
	Student student = null;
	Employee employee = null;

	request.setCharacterEncoding("UTF-8");
	String curriculumName = request.getParameter("curriculumName");
	int curriculumNumber = course_info.curriculumNameOfNumber(curriculumName); //과정번호

	String member = (String) session.getAttribute("member"); //member = student Or employee 

	if (member == "STUDENT") {
		student = (StudentInfoManagement.Student) session.getAttribute("student");
		String student_id = student.getID(); //수강생 id
		ResultSet courseRS = dbController.chkCourseNumberOfID(student_id, curriculumNumber);
		
		
		int cn = 0;
		while(courseRS.next()) {
			cn = courseRS.getInt("courseNumber");
		}
		
		if (cn == 0) {
			course_info.setEstablishmentCurriculumNumber(curriculumNumber); //수강신청할 과정번호
			course_info.setId(student_id); //수강생 id
			System.out.println("studentID : " + student_id);
			course_management.regCourse(course_info);
%>

<script type="text/javascript">
	alert("등록 되었습니다.!");
	javascript: location.href = "../CourseManagement/inquireCourseView.jsp"
</script>


<%
	return;
		} else {
%>
<script type="text/javascript">
	alert("이미 신청한 과정입니다.");
	javascript: location.href = "../CourseManagement/regCourseView.jsp"
</script>
<%
	return;
		}

	} else if (member == "EMPLOYEE") {
		employee = (EmployeeInfoManagement.Employee) session.getAttribute("employee");
		String employee_id = employee.getId(); //직원 id
		ResultSet courseRS = dbController.chkCourseNumberOfID(employee_id, curriculumNumber);
		int cn = 0;
		while(courseRS.next()) {
			cn = courseRS.getInt("courseNumber");
		}
		
		if (cn == 0) {
			course_info.setEstablishmentCurriculumNumber(curriculumNumber); //수강신청할 과정번호
			course_info.setId(employee_id); // 직원 id		
			System.out.println("employeeID : " + employee_id);
			course_management.regCourse(course_info);
%>

<script type="text/javascript">
	alert("등록 되었습니다.!");
	javascript: location.href = "../CourseManagement/inquireCourseView.jsp"
</script>


<%
	return;
		} else {
%>
<script type="text/javascript">
	alert("이미 신청한 과정입니다.");
	javascript: location.href = "../CourseManagement/regCourseView.jsp"
</script>
<%
	return;
		}
	}
%>

