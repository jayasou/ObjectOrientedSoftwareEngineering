
function on_submit() {
	var curriculumName = document.getElementsByName("curriculumName")[0]; //개설과정명	
	
	if (isNull(curriculumName)) {
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

function add_row() {
	val = document.getElementsByName("index")[0].value;
	val++;
	document.getElementById("index").value = val;

	lecture_name = document.getElementById("lecture_name");
	lecture_name_value = lecture_name.options[lecture_name.selectedIndex].text;

	curriculum_table = document.getElementById('curriculum_table');
	row = curriculum_table.insertRow(curriculum_table.rows.length);

	hidden_value = document.getElementById("hidden").value;
	document.getElementById("hidden").value = hidden_value + "/"
			+ lecture_name_value;

	cell1 = row.insertCell(0);
	cell2 = row.insertCell(1);

	cell1.innerHTML = val;
	cell2.innerHTML = lecture_name_value;
}
