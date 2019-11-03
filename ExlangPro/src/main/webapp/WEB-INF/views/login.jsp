<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


// 정규표현식 사용
var regExp = /^[a-z]+[a-z0-9]{3,11}$/;	// 맨처음 1자리를 먹었으므로 뒤에 오는 {3~11}에 의해 실제로는 4~12자리를 의미



//공백 체크
function noSpace(fuc) { //input에서 사용한 태그에서 실행하는 함수
	var rspace = /\s/g; //정규표현식 (공백)	
	if(rspace.exec(fuc.value)) { //공백을 체크
		alert("Spaces Cannot Be Used");
		fuc.value = fuc.value.replace(' ',''); //공백제거
		return false;
	}
}

//회원가입 유효성 검사
$(function(){
	$('.submitBtn').click(function(event){
		event.preventDefault(); //이벤트 초기화
		
		var id = $("#mId").val();
		var pw = $("#mPw").val();
		
		if ($("#mId").val() == "") {
			alert("Please Write Your ID");
			return false;
		} else if ($("#mPw").val() == "") {
			alert("Please Write Your Password");
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
						alert("Success Login");
						location.href = "/";
					} else {
						alert("ID or Password are different");
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
	<div class="main">
	    <p class="sign" align="center">Sign in</p>
	    <form action="loginPost" method="post" onsubmit="return check();" id="form_id" class="form_id">
	      <input class="un " align="center" type="text" name="mId" id="mId" placeholder="UserID"  minlength="4"  onkeyup="noSpace(this);">
	      <input class="pass" align="center" type="password" name="mPw" id="mPw" placeholder="PassWord" maxlength="12" onkeyup="noSpace(this);">
	      <div>
	      <input type="submit" value="Login" class="submitBtn">
	      </div>
	    </form>
    </div>
</body>
</html>