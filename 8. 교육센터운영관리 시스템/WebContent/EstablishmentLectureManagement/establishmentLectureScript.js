function on_submit() {
	var lectureName = document.getElementsByName("lectureName")[0]; // 강의명
	var lecturerName = document.getElementsByName("lecturerName")[0]; // 강사명
	var classRoom = document.getElementsByName("classRoom")[0]; // 강의실

	if (isNull(lectureName) || isNull(lecturerName) || isNull(classRoom)) {
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