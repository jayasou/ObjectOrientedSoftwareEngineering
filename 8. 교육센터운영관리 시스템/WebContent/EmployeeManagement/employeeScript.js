function on_submit() {
	/* 기본 정보 */
	var kor_name = document.getElementsByName("input_kor_name")[0]; // 한글 성명
	var eng_name = document.getElementsByName("input_eng_name")[0]; // 영문 성명

	var ssn_fst = document.getElementsByName("input_ssn_fst")[0]; // 주민번호 앞자리
	var ssn_sec = document.getElementsByName("input_ssn_sec")[0]; // 주민번호 뒷자리

	var employee_id = document.getElementsByName("input_employee_id")[0]; // 직원ID
	var id = document.getElementsByName("input_id")[0]; // ID
	var password = document.getElementsByName("input_password")[0]; // 비밀번호
	/* 기본 정보 */

	/* 연락처 정보 */
	var res_address = document.getElementsByName("input_res_address")[0]; // 거주지주소
	var address = document.getElementsByName("input_address")[0]; // 주민등록지주소

	var phoneHomefirst = document.getElementsByName("input_home_phone_fst")[0];
	var phoneHomeSec = document.getElementsByName("input_home_phone_sec")[0];
	var phoneHomeTir = document.getElementsByName("input_home_phone_tir")[0];

	var phoneNumfirst = document.getElementsByName("input_phone_fst")[0]; // 휴대폰
																			// 전화번호
	// 앞자리
	var phoneNumSecond = document.getElementsByName("input_phone_sec")[0]; // 휴대폰
	// 전화번호
	// 중간자리
	var phoneNumThird = document.getElementsByName("input_phone_tir")[0]; // 휴대폰
																			// 전화번호
	// 뒷자리
	var phoneEmergencyfirst = document
			.getElementsByName("input_emergency_phone_fst")[0]; // 휴대폰 전화번호
	// 앞자리
	var phoneEmergencySecond = document
			.getElementsByName("input_emergency_phone_sec")[0]; // 휴대폰
	// 전화번호
	// 중간자리
	var phoneEmergencyThird = document
			.getElementsByName("input_emergency_phone_tir")[0]; // 휴대폰 전화번호
	// 뒷자리
	var emailFirst = document.getElementsByName("input_email_fst"); // 이메일 앞자리
	var emailSecond = document.getElementsByName("input_email_sec"); // 이메일 뒷자리
	/* 연락처 정보 */

	/* 계좌 정보 */
	var bankCode = document.getElementsByName("input_bank_code"); // 은행 코드
	var accountNum = document.getElementsByName("input_account_num"); // 계좌번호
	var accountHolder = document.getElementsByName("input_account_holder"); // 예금주
	// 명
	/* 계좌 정보 */
	if (isShort(id, 6, 12) || isShort(password, 6, 12)) {
		msg = "아이디와 패스워드는 6~12자리입니다.";
		alert(msg);
		return false;
	} else if (isNull(kor_name) || isNull(eng_name) || isNull(ssn_fst)
			|| isNull(ssn_sec) || isNull(employee_id) || isNull(id)
			|| isNull(password) || isNull(res_address) || isNull(address)
			|| isNull(phoneHomefirst) || isNull(phoneHomeSec)
			|| isNull(phoneHomeTir) || isNull(phoneNumfirst)
			|| isNull(phoneNumSecond) || isNull(phoneNumThird) || isNull(phoneEmergencyfirst) || isNull(phoneEmergencySecond) || isNull(phoneEmergencyThird)
			|| isNull(emailFirst) || isNull(emailSecond) || isNull(bankCode)
			|| isNull(accountNum) || isNull(accountHolder)) {
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