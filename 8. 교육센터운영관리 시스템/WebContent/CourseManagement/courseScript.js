function chkerror() {

}

function isNull(obj) {
	if (obj.value == "") {
		return true;
	}

	return false;
}

function isShort(obj, minLen, maxLen) {
	var str = obj.value;
	if (!(minLen < str.length && str.length < maxLen)) {
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
	var curriculum = document.getElementsByName("curriculumName")[0];
	var table = document.getElementById("courseList");
	var row = table.insertRow(table.rows.length);
	var cell1 = row.insertCell(0);
	cell1.innerHTML="<input type='checkbox' value='빼액'>";
	var cell2 = row.insertCell(1);
	cell2.innerHTML="<input type='text' value=" + curriculum.value + ">";
}
