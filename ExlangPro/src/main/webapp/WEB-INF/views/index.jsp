<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
<body>
	<div>
		<a href="/notice/list">공지사항</a>
		<a href="/board/list">프로필 게시판</a>
		<a href="/board/InformationUse">이용안내</a>
		<c:choose>
			<c:when test="${sessionScope.login_id eq null}">
				<a href="/login">로그인</a>
				<a href="/signup">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="/member/update?mId=${sessionScope.login_id}">MyPage</a>
				<a href="/logout">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>