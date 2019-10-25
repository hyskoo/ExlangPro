<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Add</title>
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var jq = jQuery.noConflict();
	jq(document).ready(function(){
		var id = jq("#nid").val();
		console.log(id);
	});		
</script>
</head>
<body>
	
	<div>
		<form action="update" method="post">
			<p>${sessionScope.login} ----- ${sessionScope.auth} ---- ${item.nId}</p>
			<div>
				<label>Title : </label>
				<input type="text" name="nTitle" id="nTitle" value="${item.nTitle}">
			</div>
			<div>
				<label>Contents : </label>
				<input type="text" name="nContents" id="nContents" value="${item.nContents}">
			</div>
			
				<input type="hidden" name="nId" id="nid" value="${item.nId}">
				
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</div>
</body>
</html>