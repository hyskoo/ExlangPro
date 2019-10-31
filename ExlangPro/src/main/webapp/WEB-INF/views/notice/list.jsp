<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<!-- BootStrap Templet -->
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/resources/bootstrapCSS/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/bootstrapCSS/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!-- Bootstrap CSS, jQuery first, then Popper.js, then Bootstrap JS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
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
	<div>
		<table border="1">
			<thead>
				<tr>	
					<th>게시글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0}">
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.nId}</td>
								<td><a href="view?nId=${item.nId}">${item.nTitle}</a></td>
								<td>${item.mId}</td>
								<td>${item.nDate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						등록된 내용이 없습니다.
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!--  페이징처리 -->
		<div>${pager.paging}</div>
	</div>
	
<!-- 관리자 여부 확인용 C:when대신 C:if를 사용했다 -->
	<c:if test="${sessionScope.auth != null and sessionScope.auth != 0}">
		<div><a href="add">등록</a></div>
		<p>관리자입니다.</p>
		<p>${sessionScope.auth}</p>
		<p>${sessionScope.login}</p>
	</c:if>
	<c:if test="${sessionScope.auth eq null or sessionScope.auth eq 0}">
		<p>회원 또는 로그인X</p>
		<p>${sessionScope.auth}</p>
	</c:if>
	
</body>
</html>
