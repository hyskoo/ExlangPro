<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/resources/signup.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


// 정규표현식 사용
var regExp = /^[a-z]+[a-z0-9]{3,11}$/;	// 맨처음 1자리를 먹었으므로 뒤에 오는 {3~11}에 의해 실제로는 4~12자리를 의미



//공백 체크
function noSpace(fuc) { //input에서 사용한 태그에서 실행하는 함수
	var rspace = /\s/g; //정규표현식 (공백)	
	if(rspace.exec(fuc.value)) { //공백을 체크
		alert("공백을 사용할 수 없습니다.");
		fuc.value = fuc.value.replace(' ',''); //공백제거
		return false;
	}
}

//회원가입 유효성 검사

$(function(){
	$('#submitBtn').click(function(event){
		event.preventDefault(); //이벤트 초기화
		
		var id = $("#mId").val();
		var pw = $("#mPw").val();
		
		if ($("#mId").val() == "") {
			alert("아이디를 입력해주세요");
			return false;
		} else if ($("#mPw").val() == "") {
			alert("비밀번호를 입력해주세요");
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "/loginPost",
				data : {
					mId : id,
					mPw : pw
				},
				success : function(result){
					if(result == 1){
						alert("성공적으로 로그인 되었습니다.");
						location.href = "/";
					} else {
						alert("아이디 또는 비밀번호가 틀렸습니다.");
						$("#mId").val("");
						$("#mPw").val("");
						$('#mId').focus();
					}
				},
				error : function(error){
					alert(error);
				}
			});
		}
	});
});
</script>
</head>
<body>
	<form action="loginPost" method="post" onsubmit="return check();" id="form_id">
		<div>
			<label>아이디:</label>
			<input type="text" name="mId" id="mId" placeholder="ID"  minlength="4"  onkeyup="noSpace(this);">
		</div>
		<div>
			<label>비밀번호:</label>
			<input type="text" name="mPw" id="mPw" placeholder="PassWord" maxlength="12" onkeyup="noSpace(this);">
		</div>

		<div>
			<input type="submit" value="로그인" id="submitBtn">
<!-- 			<button type="button" id="submitBtn">로그인</button> -->
		</div>
	</form>
</body>
</html>