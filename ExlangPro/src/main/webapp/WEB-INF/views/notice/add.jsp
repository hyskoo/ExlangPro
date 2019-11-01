<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Add</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/notice/AddUpdate.css">
<!-- BootStrap Templet -->
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/resources/bootstrapCSS/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/bootstrapCSS/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!-- Bootstrap CSS, jQuery first, then Popper.js, then Bootstrap JS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- Summernote css, js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<!-- JavaScript -->
<script type="text/javascript">
$(function() {
	$('#summernote').summernote({
		width: 1000,
		minHeight: 300,             // set minimum height of editor
		maxHeight: 1000,
        placeholder: 'Write Contents',
        tabsize: 10,
        focus: true,
        callbacks: {
			onImageUpload: function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}	
			}
		},
        
      });
	$('.dropdown-toggle').dropdown()
});

//FileUpload
function sendFile(files, editor) {
	var data = new FormData();
	data.append("uploadFile", files);
	
	   	$.ajax({
			data : data,
			type : "POST",
			url : "/notice/upload",
			enctype : "multipart/form-data",
			contentType: false,
			processData: false,
			success : function(result){
				console.log(result);
				$(editor).summernote('editor.insertImage', result.url);
			},
			error : function(request,status,error){   
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
		});
}
	 
//유효성검사
function check() {
	var title = $('#nTitle').val();
	var contents = $('#summernote').val();
	
	if (title == '' || title == null || $.trim(title) == '') {
		alert("제목을 입력해주세요.");
		return false;
	}
	if (contents == '' || contents == null || $.trim(contents) == '<p><br></p>') {
		alert("내용을 입력해주세요.");
		return false;
	}
}
</script>
<body class="indexBody">
<div class="container">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="../">Exlang</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/notice/list">공지사항</a></li>
				<li><a href="/board/list">프로필 게시판</a></li>
				<li><a href="/board/InformationUse">이용안내</a></li>
				<c:choose>
					<c:when test="${sessionScope.login_id eq null}">
						<li><a href="/login">로그인</a></li>
						<li><a href="/signup">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/update?mId=${sessionScope.login_id}" >MyPage</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>


	<div class="container" id="Notice_addupdate">
		<form action="add" method="post" onsubmit="return check();">
			<div>
				<label>Title : </label>
				<input type="text" id="nTitle" name="nTitle"  placeholder="제목 : Title">
			</div>
			<div class="summernote_content">
				<label>Contents : </label>
				<textarea id="summernote" name="nContents" class="summernote"></textarea>
			</div>
			<div>
				<input type="hidden" name="mId" id="userid" value="${sessionScope.login}">
			</div>
			<div class="btn_div_notice">
				<input type="submit" class="btn_notice" value="등록" >
			</div>
		</form>
	</div>
	
	
<div id="footer" class="container">
	<h2>Copyright © 2018-2019 Exlang.com</h2>
	<p>Featuring 15 languages, including...</p>	
	<hr size="1" width="100%" align="center" noshade>
	<p> English Spanish French Italian German Japanese Swedish Greek Arabic <p>
	<p> Korean Chinese Russian Thai <p>
</div>
</body>
</html>