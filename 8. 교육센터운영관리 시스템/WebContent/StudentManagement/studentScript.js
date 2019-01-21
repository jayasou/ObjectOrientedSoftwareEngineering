function on_submit() {
	var id = document.getElementsByName("input_id")[0];
	var psw = document.getElementsByName("input_password")[0];
	var name = document.getElementsByName("input_name")[0];
	var address = document.getElementsByName("input_address")[0];
	var email = document.getElementsByName("input_email")[0];
	var phone = document.getElementsByName("input_phone")[0];
	var company = document.getElementsByName("input_company")[0];
	var department = document.getElementsByName("input_department")[0];
	var position = document.getElementsByName("input_position")[0];
	var job = document.getElementsByName("input_job")[0];
	var msg;

	// false 인 경우
	if (isNull(id) || isNull(psw) || isNull(name) || isNull(address)
			|| isNull(email) || isNull(phone) || isNull(company)
			|| isNull(department) || isNull(position) || isNull(job)) {
		alert("빈칸을 채워주십시오.");
		return false;
	} else if (isShort(id, 6, 12) || isShort(psw, 6, 12)) {
		msg = "아이디와 패스워드는 6~12자리입니다.";
		alert(msg);
		return false;
	} else if (isEmail(email)) {
		msg = "이메일 : 20140566@kumoh.ac.kr양식입니다.";
		alert(msg);
		return false;
	} else if (isPhone(phone)) {
		msg = "휴대전화 : 010-4994-9337 혹은 054-951-1234 양식입니다.";
		alert(msg);
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

function isShort(obj, minLen, maxLen) {
	var str = obj.value;
	if (!(minLen < str.length && str.length < maxLen)) {
		return true;
	}
	return false;
}

function isPhone(obj) {
	var str = obj.value;
	if (str.indexOf("-") < 0) {

		return true;
	}
	return false;
}

function isEmail(obj) {
	var str = obj.value;
	if (str == "") {

		return true;
	}

	var i = str.indexOf("@");
	if (i < 0) {

		return true;
	}

	i = str.indexOf(".");
	if (i < 0) {

		return true;
	}

	return false;
}

function cancle() {
	alert("취소 되었습니다.");
	history.go(-1);
}