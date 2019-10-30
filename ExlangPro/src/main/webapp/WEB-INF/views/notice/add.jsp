<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Add</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- Summernote css, js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>


<!-- NOT API CSS, JS -->
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script type="text/javascript">
$(function() {
	$('#summernote').summernote({
		width: 1000,
		minHeight: 300,             // set minimum height of editor
		maxHeight: 1000,
        placeholder: 'Hello bootstrap 4',
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
</head>
<body>
	<div>
		<form action="add" method="post" onsubmit="return check();">
			<p>작성자 : ${sessionScope.login_id}</p>
			
			<div>
				<label>Title : </label>
				<input type="text" id="nTitle" name="nTitle"  placeholder="제목 : Title">
			</div>
			<div>
				<label>Contents : </label>
				<textarea id="summernote" name="nContents"></textarea>
			</div>
			<div>
				<input type="hidden" name="mId" id="userid" value="${sessionScope.login}">
			</div>
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</div>
</body>
</html>