<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Page</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/notice/Nview.css">
<link rel="stylesheet" type="text/css" href="/resources/css/notice/Nlist.css">
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

<!-- Include Header.jsp -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- Main -->
	<div class="container" id="page_notice_view">
		<c:if test="${sessionScope.auth != null and sessionScope.auth != 0}">
			<div class="btn_div_notice">
				<a href="add" class="btn_notice">Writing</a>
				<a href="update?nId=${item.nId}" class="btn_notice">Update</a>
				<a href="delete?nId=${item.nId}" class="btn_notice">Delete</a>
			</div>	
		</c:if>
		
		<div class="container" id="Notice_view">
			<div class="view_head">
				<h1><span>${item.nTitle}</span></h1>
				<div>
				<span class="view_mId">${item.mId}</span>
				<span><fmt:formatDate value="${item.nDate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
				</div>
			</div>
			<div>
				<label>${item.nContents}</label>
			</div>
		</div>
		<!-- 타 게시물 확인 및 Paging 처리 -->
		<div id="page_notice_list">
		<table class="table_notice" >
			<thead>
				<tr>	
					<th>No.</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0}">
						<c:forEach var="item" items="${list}">
							<tr>
								<td class="number_notice_list">${item.nId}</td>
								<td class="title_notice_list" onclick="location.href='view?nId=${item.nId}'">${item.nTitle}</td>
								<td class="writer_notice_list">${item.mId}</td>
								<td class="date_notice_list"><fmt:formatDate value="${item.nDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						None Contents
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!-- Paging -->
			<div>${pager.paging}</div>
		</div>
	</div> <!-- Main END class="container" id="page_notice_view" -->
 

<!-- Include Footer.jsp -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>