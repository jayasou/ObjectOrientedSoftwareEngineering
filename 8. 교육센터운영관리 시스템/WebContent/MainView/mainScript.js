window.onload = function() {
	var input_id = document.getElementsByName("input_id")[0];
	var input_password = document.getElementsByName("input_password")[0];
	
	input_id.focus();
	input_id.onblur = function() {
		input_password.focus();
	}
}

function join_member() {
	
	var url = "../MemberManagement/joinView.html";
	document.getElementById("section_iframe").src = url;
}

function login() {
	var id = document.getElementsByName("input_id")[0].value;
	var passwd = document.getElementsByName("input_passwd")[0].value;
}

function change_asside() {
	var value = document.getElementById("select_job").options[document.getElementById("select_job").selectedIndex].text;

	if(value == "수강생")
 	{
		url = "optionStudendView.html";
		document.getElementById("aside_iframe").src = url;
	}
	
	else if(value == "직원")
 	{
		url = "optionEmployeeView.html";
		document.getElementById("aside_iframe").src = url;
	}
	
}

function change_asside2() {
	var value = document.getElementById("select_job").options[document.getElementById("select_job").selectedIndex].text;

	if(value == "수강생")
 	{
		url = "optionEmployeeToStudentView.html";
		document.getElementById("aside_iframe").src = url;
	}
	
	else if(value == "직원")
 	{
		url = "optionEmployeeView.html";
		document.getElementById("aside_iframe").src = url;
	}
	
}

function autoResize(i) {
	var iframeHeight = (i).contentWindow.document.body.scrollHeight;
	(i).height = iframeHeight + 20;
}

function goUrl() {
	var url = "../StudentManagement/inquireStudentInfoView.jsp";
	parent.document.getElementById("section_iframe").src = url;
}

function goUrl1(index) {
	if(index == 1) //직원정보 조회
	{
		var url = "../EmployeeManagement/inquireEmployeeInfoView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 2) //수강신청 조회
	{
		var url = "../CourseManagement/inquireCourseView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if (index == 30) {//직원이 수강생관리
		var url = "../EmployeeManagement/inquireAllStudentInfoView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if (index == 66) {//직원이 수강신청관리
		var url = "../CourseManagement/inquireCourseOfStudentView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 6) //운영과목조회
	{
		var url = "../ManagementSubjectManagement/inquireManagementSubjectView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 7) //개설강의조회
	{
		var url = "../EstablishmentLectureManagement/inquireEstablishmentLectureView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 8) //개설과정조회
	{
		var url = "../EstablishmentCurriculumManagement/inquireEstablishmentCurriculumView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 99) //비회원 운영과목 조회
	{
		var url = "../ManagementSubjectManagement/inquireManagementSubjectNoMemberView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 98) //비회원 개설강의조회
	{
		var url = "../EstablishmentLectureManagement/inquireEstablishmentLectureNomemberView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
	
	if(index == 97) //비회원 개설과정 조회
	{
		var url = "../EstablishmentCurriculumManagement/inquireEstablishmentCurriculumNoMemberView.jsp";
		parent.document.getElementById("section_iframe").src = url;
	}
}