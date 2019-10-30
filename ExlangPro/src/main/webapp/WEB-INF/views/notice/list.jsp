<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<div><a href="../">돌아가기</a></div>
	
</body>
</html>
