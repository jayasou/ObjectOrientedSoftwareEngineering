<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="establishmentCurriculumInfo" class="EstablishmentCurriculumManagement.EstablishmentCurriculum" />
<jsp:useBean id="establishmentCurriculumManagement" class="EstablishmentCurriculumManagement.EstablishmentCurriculumManagement" />

<script type="text/javascript">


</script>

<%
	String curriculumName = request.getParameter("curriculumName");
	ArrayList<String> curriculum_list = new ArrayList<String>();
	
	String curriculum = request.getParameter("hidden");
	int index_num = Integer.parseInt(request.getParameter("index"));
	String[] curriculum_split = curriculum.split("/");
	
	String inset_subject_name = ""; 
	String inset_subject_number = ""; 
	String inset_lecture_number = ""; 
	
	String inset_db_lecture_name = ""; // 디비에 넣을 강의이름 정보
	String inset_db_subject_name = ""; // 디비에 넣을 과목이름 정보
	String inset_db_subject_number = ""; // 디비에 넣을 과목번호 정보
	String inset_db_lecture_number = ""; // 디비에 넣을 강의번호 정보
	
	for(int i = 1 ; i <= index_num; i++)
	{
		curriculum_list.add(curriculum_split[i]); // 리스트에 각 강의 이름 넣음
		String subjectName = establishmentCurriculumManagement.subjectOfLectureName(curriculum_split[i], 0); // 해당 강의의 과목명 반환
		String subjectNumber = establishmentCurriculumManagement.subjectOfLectureName(curriculum_split[i], 1); // 해당 강의의 과목번호 반환
		String lectureNumber = establishmentCurriculumManagement.subjectOfLectureName(curriculum_split[i], 2); // 해당 강의의 강의번호 반환
		
		inset_subject_name = inset_subject_name + "/" + subjectName;
		inset_subject_number = inset_subject_number + "/" + subjectNumber;
		inset_lecture_number = inset_lecture_number + "/" + lectureNumber;
	}
	
	for(int i = 1 ; i < curriculum.length(); i++)
	{
		inset_db_lecture_name = inset_db_lecture_name + curriculum.charAt(i); // inset_lecture_name 앞에 슬러쉬 빼는작업
	}
	
	for(int i = 1 ; i < inset_subject_name.length(); i++)
	{
		inset_db_subject_name = inset_db_subject_name + inset_subject_name.charAt(i); // inset_lecture_name 앞에 슬러쉬 빼는작업
	}
	
	for(int i = 1 ; i < inset_subject_number.length(); i++)
	{
		inset_db_subject_number = inset_db_subject_number + inset_subject_number.charAt(i); // inset_lecture_name 앞에 슬러쉬 빼는작업
	}
	
	for(int i = 1 ; i < inset_lecture_number.length(); i++)
	{
		inset_db_lecture_number = inset_db_lecture_number + inset_lecture_number.charAt(i); // inset_lecture_name 앞에 슬러쉬 빼는작업
	}
	
	establishmentCurriculumInfo.setCurriculumName(curriculumName);
	establishmentCurriculumInfo.setManagementSubNumber(inset_db_subject_number);
	establishmentCurriculumInfo.setSubjectNamer(inset_db_subject_name);
	establishmentCurriculumInfo.setLectureNumber(inset_db_lecture_number);
	establishmentCurriculumInfo.setLectureName(inset_db_lecture_name);
	
	establishmentCurriculumManagement.regEstablishmentCurriculum(establishmentCurriculumInfo);
%>

<script type="text/javascript">
	alert("등록 되었습니다!");
	javascript: location.href = "../EstablishmentCurriculumManagement/inquireEstablishmentCurriculumView.jsp"
</script>
