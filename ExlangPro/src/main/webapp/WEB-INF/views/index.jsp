<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
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
<jsp:include page="header.jsp"></jsp:include>
	
	
<!-- Main -->	
<div id="page" class="container">
	<div class="title">
		<h2>Maecenas luctus lectus</h2>
	</div>
	<c:choose>
		<c:when test="${list.size() > 0 }">
			<c:forEach var="item" items="${list}">
				<div class="box">
					<c:if test="${item.mAuth == 0}">	
						<c:if test="${item.mImg == '' or item.mImg == null}">
							<img src="/resources/image/ProfileDefault.jpg" width="320" height="180" alt="기본이미지" >
						</c:if>
						<c:if test="${item.mImg != null}">
							<img src="<spring:url value='/upload/signup/${item.mImg}'/>" width="320" height="180" alt="기본이미지" />
						</c:if>
						<h3>${item.mName}</h3>
						<p id="indexIntro">${item.mIntro}</p>
<!-- 						<a href="../" class="button">Read More</a> -->
					</c:if>
				</div>				
			</c:forEach>
		</c:when>
	</c:choose>
</div>

<!-- Include Footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>