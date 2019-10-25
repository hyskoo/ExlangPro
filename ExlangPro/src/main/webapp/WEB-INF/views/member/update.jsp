<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var jq = jQuery.noConflict();

function check(){	
	if(jq("#mPw").val() != jq("#mPwcheck").val()){
		alert("비밀번호가 다릅니다.");
		mPwcheck.focus();
		return false;
	} else if (jq('#mImg').val().substring(33,100).length > 19) {
		alert("파일명은 16글자 이하만 가능합니다");
		return false;
	} else if (jq("#mId").val() == "") {
		alert("아이디를 입력해주세요");
		return false;
	} else if (jq("#mPw").val() == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	} else if (jq("#mPwcheck").val() == "") {
		alert("비밀번호 확인을 입력해주세요");
		return false;
	} else if (jq("#mName").val() == "") {
		alert("이름을 입력해주세요");
		return false;
	} else if (jq("#mAge").val() == "") {
		alert("나이를 입력해주세요");
		return false;
	} else if (jq(':radio[name="mGender"]:checked').length < 1) {
		alert("성별을 선택해주세요");
		return false;
	} else if (jq("#mNl").val() == "") {
		alert(jq("#mGender").val());
		alert("모국어를 입력해주세요");
		return false;
	} else if (jq("#mPl").val() == "") {
		alert("배울언어를 입력해주세요");
		return false;
	}  else if (jq("#mHobby").val() == "") {
		alert("취미를 입력해주세요");
		return false;
	}  else if (jq("#mIntro").val() == "") {
		alert("자기소개를 입력해주세요");
		return false;
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
						jq("#imgdiv").css("display","none");
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
			jq("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
	
}
</script>
</head>
<body>
	<div>
		<div>
			<label>ProfilePhoto : </label>
					<div><img id="imgdiv" src="<spring:url value='/upload/signup/${list.mImg}'/>" /></div>
			<img id = "img" />
		</div>
		<div>
			<input type="file" id="upload">
		</div>
		<form action="update" method="post" onsubmit="return check();">
			<div>
				<input type="text" name="mImg" id="mImg" value="${list.mImg}" readonly>
			</div>
			<div>
				<label>ID : </label>
				<input type="text" name="mId" value="${list.mId}" readonly>
			</div>
			<div>
				<label>Password : </label>
				<input type="password" name="mPw" value="${list.mPw}">
			</div>
			<div>
				<label>Name : </label>
				<input type="text" name="mName" value="${list.mName}">
			</div>
			<div>
				<label>Age : </label>
				<input type="number" name="mAge" value="${list.mAge}">
			</div>
			<div>
				<label>Gender : </label>
				<input type="radio" name="mGender" value="♂" id="mGender" ${list.mGender eq '♂' ? 'checked=checked' : ' '}> 
				<label for="gender_man"><span>Man</span></label>
				<input type="radio" name="mGender" value="♀" id="mGender" ${list.mGender eq '♀' ? 'checked=checked' : ' '} >
				<label for="gender_woman"><span>Woman</span></label>
			</div>
			<div>
				<label>Native Language : </label>
				<input type="text" name="mNl" value="${list.mNl}">
			</div>
			<div>
				<label>Practice Language : </label>
				<input type="text" name="mPl" value="${list.mPl}">
			</div>
			<div>
				<label>Hobby : </label>
				<input type="text" name="mHobby" value="${list.mHobby}">
			</div>
			<div>
				<label>Introduce : </label>
				<input type="text" name="mIntro" value="${list.mIntro}">
			</div>
			<div>
				<input type="submit" value="변경">
			</div>
		</form>
	</div>
</body>
</html>