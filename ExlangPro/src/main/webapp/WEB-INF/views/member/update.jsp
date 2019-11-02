<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/signup.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var jq = jQuery.noConflict();

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

//유효성 체크
function check(){	
	if(jq("#mPw").val() != jq("#mPwcheck").val()){
		alert("비밀번호가 다릅니다.");
		mPwcheck.focus();
		return false;
	} else if (jq('#mImg').val().substring(33,100).length > 19) {
		alert("파일명은 16글자 이하만 가능합니다");
		mImg.focus();
		return false;
	} else if (jq("#mId").val() == "") {
		alert("아이디를 입력해주세요");
		mId.focus();
		return false;
	} else if (jq("#mPw").val() == "") {
		alert("비밀번호를 입력해주세요");
		mPw.focus();
		return false;
	} else if (jq("#mPwcheck").val() == "") {
		alert("비밀번호 확인을 입력해주세요");
		mPwcheck.focus();
		return false;
	} else if (jq("#mName").val() == "") {
		alert("이름을 입력해주세요");
		mName.focus();
		return false;
	} else if (jq("#mAge").val() == "") {
		alert("나이를 입력해주세요");
		mAge.focus();
		return false;
	} else if (jq(':radio[name="mGender"]:checked').length < 1) {
		alert("성별을 선택해주세요");
		mGendar.focus();
		return false;
	} else if (jq("#mNl").val() == "") {
		alert("모국어를 입력해주세요");
		mNl.focus();
		return false;
	} else if (jq("#mPl").val() == "") {
		alert("배울언어를 입력해주세요");
		mPl.focus();
		return false;
	}  else if (jq("#mHobby").val() == "") {
		alert("취미를 입력해주세요");
		mHobby.focus();
		return false;
	}  else if (jq("#mIntro").val() == "") {
		alert("자기소개를 입력해주세요");
		mIntro.focus();
		return false;
	} else {
		alert("Update Your Profile");
	}
}

jq(function(){
	//파일 업로드
	jq("#upload").change(function(){
		var data = new FormData();
		data.append("uploadFile", jq("#upload").prop("files")[0]);
		var fileNm = jq("#upload").val();
		if (fileNm != "") {
		    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
		    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
		        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
		        jq("#upload").val("");
//			        jq("#mImg").val("");
		        console.log("1");
		    }
		    else {
		    	jq.ajax("/upload", {
					method : "post",
					contentType: false,
					processData: false,
					enctype : "multipart/form-data",
					data : data,
					dataType : 'json',
					success : function(result){
						var enc = result.filename;
						jq("input[type=text][name=mImg]").val(enc);
						var m_img = jq("#mImg").val();
						console.log(m_img);
					}
				});
		    }
		}
	}); //파일업로드 End

	//파일 업로드 미리보기
	jq("#upload").on("change", PreviewFile);
});

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
	    <p class="sign" align="center">My Page</p>
	    <div class="signout"><a href="/member/delete?mId=${sessionScope.login_id}">Sign Out</a></div>
	    <form action="update" method="post" onsubmit="return check();" id="form_id" class="form_id">

		    	<input class="signInput" align="center" type="text" name="mId" id="mId" minlength="4" maxlength="10" onkeyup="noSpace(this);" placeholder="UserID" value="${list.mId}" readonly>
				<div id="id_check" align="center"></div>
			
				<input class="signInput" align="center" type="password" name =mPw id="mPw" minlength="4" maxlength="12" onkeyup="noSpace(this);" placeholder="PassWord" >
			
				<input class="signInput" align="center" type="password" name =mPwcheck id="mPwcheck" maxlength="12" onkeyup="noSpace(this);" placeholder="PassWordCheck" >						
	      	
	      		<input class="signInput" align="center" type="text" name="mName" id="mName" placeholder="Name" value="${list.mName}">
			
				<input class="signInput" align="center" type="number" name="mAge" id="mAge" placeholder="Age" value="${list.mAge}">
				<div class="radio">
					<input type="radio" name="mGender" value="♂" id="mGender" ${list.mGender eq '♂' ? 'checked=checked' : ' '}> 
					<label for="gender_man"><span>Man</span></label>
					<input type="radio" name="mGender" value="♀" id="mGender" ${list.mGender eq '♀' ? 'checked=checked' : ' '}>
					<label for="gender_woman"><span>Woman</span></label>		
				</div>

				<h3 align="center" style="margin-bottom: 10px">Native Language</h3>
				<select name="mNl" id="mNl" class="signInput">
					<option value="English" <c:if test="${list.mNl == 'English'}">selected='selected'</c:if>>English</option>
					<option value="Chinese" <c:if test="${list.mNl == 'Chinese'}">selected='selected'</c:if>>Chinese</option>
					<option value="Hindi" <c:if test="${list.mNl == 'Hindi'}">selected='selected'</c:if>>Hindi</option>
					<option value="Spanish" <c:if test="${list.mNl == 'Spanish'}">selected='selected'</c:if>>Spanish</option>
					<option value="French" <c:if test="${list.mNl == 'French'}">selected='selected'</c:if>>French</option>
					<option value="Arabic" <c:if test="${list.mNl == 'Arabic'}">selected='selected'</c:if>>Arabic</option>
					<option value="Bengali" <c:if test="${list.mNl == 'Bengali'}">selected='selected'</c:if>>Bengali</option>
					<option value="Russain" <c:if test="${list.mNl == 'Russain'}">selected='selected'</c:if>>Russain</option>
					<option value="Portuguese" <c:if test="${list.mNl == 'Portuguese'}">selected='selected'</c:if>>Portuguese</option>
					<option value="German" <c:if test="${list.mNl == 'German'}">selected='selected'</c:if>>German</option>
					<option value="Japanese" <c:if test="${list.mNl == 'Japanese'}">selected='selected'</c:if>>Japanese</option>
					<option value="Italian" <c:if test="${list.mNl == 'Italian'}">selected='selected'</c:if>>Italian</option>
					<option value="Thai" <c:if test="${list.mNl == 'Thai'}">selected='selected'</c:if>>Thai</option>
					<option value="Turkish" <c:if test="${list.mNl == 'Turkish'}">selected='selected'</c:if>>Turkish</option>
					<option value="Korean" <c:if test="${list.mNl == 'Korean'}">selected='selected'</c:if>>Korean</option>
				</select>
				
				<h3 align="center" style="margin-bottom: 10px">Practice Language</h3>
				<select name="mPl" id="mPl" class="signInput">
					<option value="English" <c:if test="${list.mPl == 'English'}">selected='selected'</c:if>>English</option>
					<option value="Chinese" <c:if test="${list.mPl == 'Chinese'}">selected='selected'</c:if>>Chinese</option>
					<option value="Hindi" <c:if test="${list.mPl == 'Hindi'}">selected='selected'</c:if>>Hindi</option>
					<option value="Spanish" <c:if test="${list.mPl == 'Spanish'}">selected='selected'</c:if>>Spanish</option>
					<option value="French" <c:if test="${list.mPl == 'French'}">selected='selected'</c:if>>French</option>
					<option value="Arabic" <c:if test="${list.mPl == 'Arabic'}">selected='selected'</c:if>>Arabic</option>
					<option value="Bengali" <c:if test="${list.mPl == 'Bengali'}">selected='selected'</c:if>>Bengali</option>
					<option value="Russain" <c:if test="${list.mPl == 'Russain'}">selected='selected'</c:if>>Russain</option>
					<option value="Portuguese" <c:if test="${list.mPl == 'Portuguese'}">selected='selected'</c:if>>Portuguese</option>
					<option value="German" <c:if test="${list.mPl == 'German'}">selected='selected'</c:if>>German</option>
					<option value="Japanese" <c:if test="${list.mPl == 'Japanese'}">selected='selected'</c:if>>Japanese</option>
					<option value="Italian" <c:if test="${list.mPl == 'Italian'}">selected='selected'</c:if>>Italian</option>
					<option value="Thai" <c:if test="${list.mPl == 'Thai'}">selected='selected'</c:if>>Thai</option>
					<option value="Turkish" <c:if test="${list.mPl == 'Turkish'}">selected='selected'</c:if>>Turkish</option>
					<option value="Korean" <c:if test="${list.mPl == 'Korean'}">selected='selected'</c:if>>Korean</option>
				</select>
				
				<input class="signInput" align="center" type="text" name="mHobby" id="mHobby"  placeholder="Hobby" value="${list.mHobby}">
				
				<textarea class="signInput" align="center" type="text" name="mIntro" id="mIntro" placeholder="Plase Write Your Introduce" rows="" cols="" >${list.mIntro}</textarea>
			<div>
				<div class="imageupload">
					<input id="upload" type="file">
					<img id="profileimg" class="profileimg" src="<spring:url value='/upload/signup/${list.mImg}'/>" />
					
					<!-- type="hidden"사용시 value값을 변하게 하지 못함-->
					<div style="display:none">
						<input type="text" name="mImg" id="mImg" value="${list.mImg}" readonly>
					</div>
				</div>
			</div>
	      <div>
	      	<input type="submit" value="Sign Up" class="submitBtn">
	      </div>
	    </form>
    </div>
    
</body>
</html>