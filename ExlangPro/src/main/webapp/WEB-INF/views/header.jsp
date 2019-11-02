<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body class="indexBody">
<div id="header-wrapper" class="container">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="../">Exlang</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/notice/list">공지사항</a></li>
				<li><a href="/board/list">프로필 게시판</a></li>
				<li><a href="/board/Info">이용안내</a></li>
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
</body>
</html>