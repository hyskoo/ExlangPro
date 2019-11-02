<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="/resources/css/signup.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var jq = jQuery.noConflict();

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
function check(){	
	if(jq("#mPw").val() != jq("#mPwcheck").val()){
		alert("Password is different");
		mPwcheck.focus();
		return false;
	} else if (jq('#mImg').val().substring(33,100).length > 19) {
		alert("File name can only Below 16 words");
		mImg.focus();
		return false;
	} else if (jq("#mId").val() == "") {
		alert("Please Write Your ID");
		mId.focus();
		return false;
	} else if (jq("#mPw").val() == "") {
		alert("Please Write Your Password");
		mPw.focus();
		return false;
	} else if (jq("#mPwcheck").val() == "") {
		alert("Please Check Your Password");
		mPwcheck.focus();
		return false;
	} else if (jq("#mName").val() == "") {
		alert("Please Write Your Name");
		mName.focus();
		return false;
	} else if (jq("#mAge").val() == "") {
		alert("Please Write Your Age");
		mAge.focus();
		return false;
	} else if (jq(':radio[name="mGender"]:checked').length < 1) {
		alert("Please Chooice Your Gender");
		mGendar.focus();
		return false;
	} else if (jq("#mNl").val() == "") {
		alert("Please Write Your Native Language");
		mNl.focus();
		return false;
	} else if (jq("#mPl").val() == "") {
		alert("Please Write Your Practice Language");
		mPl.focus();
		return false;
	}  else if (jq("#mHobby").val() == "") {
		alert("Please Write Your Hobby");
		mHobby.focus();
		return false;
	}  else if (jq("#mIntro").val() == "") {
		alert("Please Write Your Introduce");
		mIntro.focus();
		return false;
	} else {
		alert("Sign Up!");
	}
}


jq(function() {

	
	// 아이디 중복체크 확인
	jq("#mId").blur(function(event){	
		event.preventDefault();  // 이벤트 초기화
		
		var id = jq('#mId').val();
		//input태그에서 id에 해당하는 변수명
		
		if(id == ""){
			jq("#id_check").css("color", "black");
			jq("#id_check").text("Please Write Your ID");
			return false;
		} else if(!regExp.test(id)) {
			jq("#id_check").css("color", "red");
			jq("#id_check").text("ID can only 4~12 words");
			return false;
		} else if(regExp.test(id)) {
			jq("#id_check").css("color", "black");
			jq("#id_check").text("Available ID");
		} 


		jq.ajax({
			type : "POST",
			url : "/ajax/idch",
			data : {
				mId : id
				// mId는 member.java파일안에 있는 mId.
			},
			success : function(result){
				console.log(result)
				if(result == 1) {
					jq("#id_check").text("Used ID");
					jq("#id_check").css("color", "red");
				}
			}, 
			error : function(xhr, status, error){
				alert(error);
			} 
		});
	}); //아이디 중복체크 End
	
	
	//파일 업로드
	jq("#upload").change(function(){
		var data = new FormData();
		data.append("uploadFile", jq("#upload").prop("files")[0]);
		
		console.log(jq("#upload").val());
		console.log(jq("#upload").prop("files")[0]);
		
		var fileNm = jq("#upload").val();
		if (fileNm != "") {
		    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
		    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
		        alert("Only ImageFile (.jpg, .png, .gif )");
		        jq("#upload").val("");
// 		        jq("#mImg").val("");
		    }
		    else {
		    	jq.ajax({
					type : "POST",
					url : "/upload",
					contentType: false,
					processData: false,
					enctype : "multipart/form-data",
					data : data,
					dataType : 'json',
					success : function(result){
						var enc = result.filename;
// 						console.log(enc.substring(33,100));  // uuid 자르기
						jq("input[name=mImg]").attr("value",enc);  //input태그에 ajax성공값추가
						
					}	
				});
		    }
		}
	}); //파일업로드 End

	//파일 업로드 미리보기
	jq("#upload").on("change", PreviewFile);
}); //document.readyfuction End


//파일 업로드 미리보기

function PreviewFile(e) {
	var sel_file;
	var files = e.target.files;
	
	//files 값을 Array형식으로 변환
	var filesArr = Array.prototype.slice.call(files);
	
	
	filesArr.forEach(function(f){
// 		if(!f.type.match("image.*")){
// 			alert("이미지 확장자만 가능합니다");
// 			return ;
// 		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			jq("#profileimg").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
	
}


</script>
</head>
<body>
	<div class="main">
	    <p class="sign" align="center">Sign Up</p>
	    
	    <form action="signup" method="post" onsubmit="return check();" id="form_id" class="form_id">

		    	<input class="signInput" align="center" type="text" name="mId" id="mId" minlength="4" maxlength="10" onkeyup="noSpace(this);" placeholder="UserID">
				<div id="id_check" align="center"></div>
			
				<input class="signInput" align="center" type="password" name =mPw id="mPw" minlength="4" maxlength="12" onkeyup="noSpace(this);" placeholder="PassWord" >
			
				<input class="signInput" align="center" type="password" name =mPwcheck id="mPwcheck" maxlength="12" onkeyup="noSpace(this);" placeholder="PassWordCheck" >						
	      	
	      		<input class="signInput" align="center" type="text" name="mName" id="mName" placeholder="Name">
			
				<input class="signInput" align="center" type="number" name="mAge" min="0" max="150" id="mAge" placeholder="Age">
				<div class="radio">
					<input type="radio" name="mGender" value="♂" id="mGender" checked="checked"> 
					<label for="gender_man"><span>Man</span></label>
					<input type="radio" name="mGender" value="♀" id="mGender">
					<label for="gender_woman"><span>Woman</span></label>		
				</div>
				
				<h3 align="center" style="margin-bottom: 10px">Native Language</h3>
				<select name="mNl" id="mNl" class="signInput">
					<option value="English">English</option>
					<option value="Chinese">Chinese</option>
					<option value="Hindi">Hindi</option>
					<option value="Spanish">Spanish</option>
					<option value="French">French</option>
					<option value="Arabic">Arabic</option>
					<option value="Bengali">Bengali</option>
					<option value="Russain">Russain</option>
					<option value="Portuguese">Portuguese</option>
					<option value="German">German</option>
					<option value="Japanese">Japanese</option>
					<option value="Italian">Italian</option>
					<option value="Thai">Thai</option>
					<option value="Turkish">Turkish</option>
					<option value="Korean">Korean</option>
				</select>
			
				<h3 align="center" style="margin-bottom: 10px">Practice Language</h3>
				<select name="mPl" id="mPl" class="signInput">
					<option value="English">English</option>
					<option value="Chinese">Chinese</option>
					<option value="Hindi">Hindi</option>
					<option value="Spanish">Spanish</option>
					<option value="French">French</option>
					<option value="Arabic">Arabic</option>
					<option value="Bengali">Bengali</option>
					<option value="Russain">Russain</option>
					<option value="Portuguese">Portuguese</option>
					<option value="German">German</option>
					<option value="Japanese">Japanese</option>
					<option value="Italian">Italian</option>
					<option value="Thai">Thai</option>
					<option value="Turkish">Turkish</option>
					<option value="Korean">Korean</option>
				</select>
				
				<input class="signInput" align="center" type="text" name="mHobby" id="mHobby"  placeholder="Hobby">
				
				<textarea class="signInput" align="center" type="text" name="mIntro" id="mIntro" placeholder="Plase Write Your Introduce" rows="" cols="" ></textarea>
			<div>
				<div class="imageupload">
					<input id="upload" type="file">
					<input type="hidden" name="mImg" id="mImg" readonly>
					<img id = "profileimg" class="profileimg"/>
				</div>
			</div>
	      <div>
	      	<input type="submit" value="Sign Up" class="submitBtn">
	      </div>
<!-- 	      <p class="forgot" align="center"><a href="#">Forgot Password?</p> -->
	    </form>
    </div>
</body>
</html>