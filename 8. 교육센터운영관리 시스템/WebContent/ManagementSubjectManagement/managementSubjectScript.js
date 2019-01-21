function on_submit() {
	var subjectDescription = document.getElementsByName("subjectDescription")[0];	//과목 설명
	var goal = document.getElementsByName("goal")[0];	//학습 목표
	var target = document.getElementsByName("target")[0];	//수강 대상
	var benefits = document.getElementsByName("benefits")[0];	//과목의 특장점
	var totalDuration = document.getElementsByName("totalDuration")[0];	//총 강의 일수
	var hours = document.getElementsByName("hours")[0];	//총 강의 시간
	var capacity = document.getElementsByName("capacity")[0];	//모집인원
	var tuition = document.getElementsByName("tuition")[0];	//수강료
	var lectureContents = document.getElementsByName("lectureContents")[0];	//강의내용
	
	var msg;

	// false 인 경우
	if (isNull(subjectDescription) || isNull(goal) || isNull(target) || isNull(benefits)
			|| isNull(totalDuration) || isNull(hours) || isNull(capacity)
			|| isNull(tuition) || isNull(lectureContents)) {
		alert("빈칸을 채워주십시오.");
		return false;
	}
	
	return true;
}

function isNull(obj) {
	if (obj.value == "") {
		return true;
	}

	return false;
}

function cancle() {
	alert("취소 되었습니다.");
	history.go(-1);
}

function back() {
	history.go(-1);
}

function go(path) {
	var form = document.getElementById("su");
	form.action = path;
	form.submit();
}