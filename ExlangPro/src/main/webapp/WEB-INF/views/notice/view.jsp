<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Page</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
<body>
	
<p>${sessionScope.login} ----- ${sessionScope.auth} ---- ${item.nId}</p>
	<div>
		제목 : ${item.nTitle}
	</div>
	<div>
		내용 : ${item.nContents}
	</div>
	<div>
		nId : ${item.nId}
		nId : ${item.nId}
		nId : ${item.nId}
	
	</div>
	<c:if test="${sessionScope.auth != null and sessionScope.auth != 0}">
		<div><a href="update?nId=${item.nId}">수정</a></div>
		<div><a href="delete?nId=${item.nId}">삭제</a></div>
	</c:if>
	
	<a href="../notice/list">돌아가기</a>
</body>
</html>