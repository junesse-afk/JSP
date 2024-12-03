<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function (){
	document.getElementById("btnCheckId").onclick = onpenCheckHTML;
    document.getElementById("id").onblur = checkIdLength;
    
// 	document.getElementById("passwd").onkeyup = checkPass;
// 	document.getElementById("passwd").onkeyup = checkSamePass;
	document.getElementById("passwd").onkeyup = function (){
		checkPass();
		checkSamePass();
	};
	document.getElementById("passwd2").onkeyup = checkSamePass;
	document.getElementById("jumin1").onkeyup = checkJumin1;
	document.getElementById("jumin2").onkeyup = checkJumin2;
	document.getElementById("btnSearchAddress").onclick = onpenAddr;
	document.getElementsByName('emailDomain')[0].onchange = changeEmail;
	document.getElementById("checkAllHobby").onchange = checkAll;

	document.getElementById("btnChangeImg").onclick = chageImg;

	document.joinForm.onsubmit = checkSubmit;
	
	// 11. 돌아가기 버튼 클릭 시 이벤트 처리를 통해 이전 페이지로 이동 처리
	document.querySelector("input[value=돌아가기]").onclick = () => history.back(); 
}

// ------ functions -------
function onpenCheckHTML () {
	// 1. ID 중복확인 버튼 클릭 시 새 창(check_id.html) 띄우기
	window.open("check_id.html", "", "width=300, height=200");
}	

function checkIdLength () {
	// 2. 아이디 입력란에서 커서가 빠져나갈 때 아이디 길이 체크하기
	// => 입력된 ID 텍스트의 길이가 4 ~ 8글자 사이일 경우 옆쪽 빈 공간(span 태그 영역)에 
    // "사용 가능" 초록색으로 표시
    // 아니면, "4~8글자만 사용 가능합니다" 빨간색으로 표시
    let inputId = document.getElementById("id");
    let span = document.getElementById("checkIdResult");

	if (inputId.value.length >= 4 && inputId.value.length <= 8) {
		span.innerText = '사용 가능';
		span.style.color = 'green';
	} else {
		span.innerText = '4~8글자만 사용 가능합니다';
		span.style.color = 'red';
	}
}

function checkPass () {
	// 3. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기
	// => 체크 결과를 비밀번호 입력창 옆쪽 빈 공간(span)에 표시하기
	// => 비밀번호 길이 체크를 통해 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
	//    아니면, "사용 불가능한 패스워드"(빨간색) 표시
	let inputPass = document.getElementById("passwd");
	let span = document.getElementById("checkPasswdResult");
	if (inputPass.value.length >= 8 && inputPass.value.length <= 16) {
		span.innerText = '사용 가능한 패스워드';
		span.style.color = 'blue';
	} else {
		span.innerText = '사용 불가능한 패스워드';
		span.style.color = 'red';
	}
}

function checkSamePass () {
	// 4. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기
	// => 체크 결과를 비밀번호확인 입력창 옆쪽 빈 공간(span)에 표시하기
	// => 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
	//    아니면, "비밀번호 불일치"(빨간색) 표시
	let inputPass = document.getElementById("passwd");
	let inputPass2 = document.getElementById("passwd2");
	let span = document.getElementById("checkPasswd2Result");
	
	if (inputPass.value == inputPass2.value) {
		span.innerText = '비밀번호 일치';
		span.style.color = 'blue';
	} else {
		span.innerText = '비밀번호 불일치';
		span.style.color = 'red';
	}
}

//5. 주민번호 숫자 입력할때마다 길이 체크하기
// => 주민번호 앞자리 입력란에 입력된 숫자가 6자리이면 뒷자리 입력란으로 커서 이동시키기
// => 주민번호 뒷자리 입력란에 입력된 숫자가 7자리이면 뒷자리 입력란에서 커서 제거하기
function checkJumin1 () {
	let jumin1 = document.getElementById("jumin1");
	if (jumin1.value.length == 6) {
		document.getElementById("jumin2").focus();	
	}
}
function checkJumin2 () {
	let jumin2 = document.getElementById("jumin2");
	if (jumin2.value.length == 7) {
		document.getElementById("jumin2").blur();
	}
}

function onpenAddr () {
	// 6. 주소검색 버튼 클릭 시 search_address.html 페이지를 새 창에 표시하기
	window.open("search_address.html", "", "width=500, height=500");
}

function changeEmail () {
	// 7. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 
	//    선택된 셀렉트 박스 값을 이메일 두번째 항목(@ 기호 뒤)에 표시하기
	//    단, "직접입력" 선택 시 표시된 도메인 삭제하기
	//    또한, "직접입력" 항목 외의 도메인 선택 시 도메인 입력창을 잠금처리 및 회색으로 변경하고,
	//    "직접입력" 항목 선택 시 도메인 입력창에 커서 요청 및 잠금 해제  
	let selectedEmail = document.getElementsByName('emailDomain')[0].value;
	let email2 = document.joinForm.email2;
	email2.value = selectedEmail;
	
	if (selectedEmail == "") { // 직접입력 선택
		email2.focus();	
		email2.readOnly = false;
		email2.style.background = "";
	} else {
		email2.readOnly = true;
		email2.style.background = "#e5e5e5";
	}
}

function checkAll () {
	// 8. 취미의 "전체선택" 체크박스 체크 시 취미 항목 모두 체크, 
	//    "전체선택" 해제 시 취미 항목 모두 체크 해제하기
	let cbAll = document.getElementById("checkAllHobby");
	let checked = cbAll.checked;
	let hobbyArr = document.getElementsByName('hobby');
	for (let hobby of hobbyArr) {
		hobby.checked = checked;	
	}
}

function chageImg () {
	// 9. 이미지변경 버튼 클릭 시 사진 교체하기
	document.getElementsByTagName("img")[0].src = '../images/rabbit.png'
}

function checkSubmit () {
	// 10. 가입(submit) 클릭 시 이벤트 처리를 통해
	//    이름, 아이디, 비밀번호, 비밀번호확인, 주민번호, 주소, Email, 직업, 성별, 취미, 가입동기 항목을
	//    모두 입력했는지 체크하고 모든 항목이 입력되었을 경우에만 submit 동작이 수행되도록 처리
	//    입력되지 않은 항목이 있을 경우 해당 항목을 입력하도록 경고창 출력 및 해당 항목에 포커스 요청
	var table = document.getElementsByTagName("table")[0];
	let trs = table.children[0].children;
	
	for (let tr of trs) {
		let msg = tr.children[0].innerText;
		let input = tr.children[1].children[0];
		if (input.value == "") {
			alert(msg + " 입력 필수!");
			return false;
		}
	}
	return true;
}
// ------------------------
	
</script>
</head>
<body>	
	<div align="center">
		<h1>회원 가입</h1>
		<form action="request2_pro.jsp" name="joinForm">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name"></td>
					<td rowspan="3" align="center">
						<img src="profile_img/pengsu.jpg" width="80" height="80"><br>
						<input type="button" value="이미지변경" id="btnChangeImg">
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="id" placeholder="4 ~ 8글자 사이 입력">
						<input type="button" value="ID중복확인" id="btnCheckId">
						<span id="checkIdResult"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="passwd" id="passwd" placeholder="8 ~ 16글자 사이 입력">
						<span id="checkPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td colspan="2">
						<input type="password" name="passwd2" id="passwd2">
						<span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td colspan="2">
						<input type="text" name="jumin1" id="jumin1" size="8"> -
						<input type="text" name="jumin2" id="jumin2" size="8">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2">
						<input type="text" name="postCode" id="postCode" size="6">
						<input type="button" value="주소검색" id="btnSearchAddress">
						<br>
						<input type="text" name="address1" id="address1" size="30" placeholder="기본주소">
						<br>
						<input type="text" name="address2" id="address2" size="30" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td colspan="2">
						<input type="text" name="email1" size="10"> @
						<input type="text" name="email2" size="10">
						<select name="emailDomain">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직업</th>
					<td colspan="2">
						<select name="job">
							<option value="">항목을 선택하세요</option>
							<option value="개발자">개발자</option>
							<option value="DB엔지니어">DB엔지니어</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="2">
						<input type="radio" name="gender" value="M">남
						<input type="radio" name="gender" value="F">여
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td colspan="2">
						<input type="checkbox" name="hobby" value="여행">여행
						<input type="checkbox" name="hobby" value="독서">독서
						<input type="checkbox" name="hobby" value="게임">게임
						<input type="checkbox" id="checkAllHobby">전체선택
					</td>
				</tr>
				<tr>
					<th>가입동기</th>
					<td colspan="2">
						<textarea rows="5" cols="40" name="motivation"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="가입">
						<input type="reset" value="초기화">
						<input type="button" value="돌아가기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>