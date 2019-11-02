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
				<li><a href="/notice/list">Notice</a></li>
				<li><a href="/board/list">Profile Board</a></li>
				<li><a href="/board/Info">Information Use</a></li>
				<c:choose>
					<c:when test="${sessionScope.login_id eq null}">
						<li><a href="/login">Login</a></li>
						<li><a href="/signup">Sign Up</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/update?mId=${sessionScope.login_id}" >MyPage</a></li>
						<li><a href="/logout">Logout</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
</body>
</html>