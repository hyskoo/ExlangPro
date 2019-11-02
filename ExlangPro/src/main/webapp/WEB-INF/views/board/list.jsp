<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 이미지를 불러오기 위한 spring라이브러리 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Board</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/profileboard/Plist.css">
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
var jq = jQuery.noConflict();

function profile(){
	if(jq("#SearchAgeMin").val() == null || jq("#SearchAgeMin").val() == '') {
		jq("input[name=SearchAgeMin]").attr("value", 1);
	}
	if(jq("#SearchAgeMax").val() == null || jq("#SearchAgeMax").val() == '') {
		jq("input[name=SearchAgeMax]").attr("value", 150);
	}
}


</script>
<body class="indexBody">

<!-- Include Header.jsp -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- Main -->
	<div class="container" id="profile_main">
		<table class="table_profile">
			<thead>
				<tr>
					<th>프로필사진</th>
					<th>모국어</th>
					<th>연습언어</th>
					<th>취미</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0}">
						<c:forEach var="item" items="${list}">
							<tr>
								<c:if test="${item.mAuth == 0}">
									<td class="P_list_image">
										<c:if test="${item.mImg == '' or item.mImg == null}">
											<img src="/resources/image/ProfileDefault.jpg"  width="320px" height="180"  alt="기본이미지" >
										</c:if>
										<c:if test="${item.mImg != null}">
											<img src="<spring:url value='/upload/signup/${item.mImg}'/>"  width="320px" height="180"  alt="기본이미지" />
										</c:if>
										<h1>${item.mName}</h1>
										<p class="age_gender">Age:${item.mAge}  Gender:${item.mGender}</p>
									</td>
									<td class="P_list_Nl">${item.mNl}</td>
									<td class="P_list_Pl">${item.mPl}</td>
									<td class="P_list_Hobby">${item.mHobby}</td>
									<td class="P_list_Intro"><p>${item.mIntro}</p></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						등록된 내용이 없습니다.
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!-- Paging -->
		<div>${pager.paging}</div>
	</div>

<!-- 검색기능 -->
<!-- 쿼리문에 직접적으로 하는것이므로 카멜케이스 사용X  -->
	<div id="search">
		<form action="" method="get" onsubmit="return profile();">
			<table class="table_profile table_search">
				<th colspan="2"> Find New Friends!!!</th>
					<tr>
						<td class="Search_name">Native Language</td>
						<td class="Search_selecter">
							<select name="SearchNl">
								<option value="">- All -</option>
								<option value="English">English</option>
								<option value="Chinese">Chinese</option>
								<option value="Hindi">Hindi</option>
								<option value="Spanish">Spanish</option>
								<option value="French">French</option>
								<option value="Arabic">Arabic</option>
								<option value="Bengali">Bengali</option>
								<option value="Russain">Russain</option>
								<option value="Portuguese">Portuguese</option>
								<option value="German">German</option>
								<option value="Japanese">Japanese</option>
								<option value="Italian">Italian</option>
								<option value="Thai">Thai</option>
								<option value="Turkish">Turkish</option>
								<option value="Korean">Korean</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="Search_name">Practice Language</td>
						<td class="Search_selecter">
							<select name="SearchPl">
								<option value="">- All -</option>
								<option value="English">English</option>
								<option value="Chinese">Chinese</option>
								<option value="Hindi">Hindi</option>
								<option value="Spanish">Spanish</option>
								<option value="French">French</option>
								<option value="Arabic">Arabic</option>
								<option value="Bengali">Bengali</option>
								<option value="Russain">Russain</option>
								<option value="Portuguese">Portuguese</option>
								<option value="German">German</option>
								<option value="Japanese">Japanese</option>
								<option value="Italian">Italian</option>
								<option value="Thai">Thai</option>
								<option value="Turkish">Turkish</option>
								<option value="Korean">Korean</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="Search_name">Gender</td>
						<td class="Search_selecter">
							<select name="SearchGender">
								<option value="">- All -</option>
								<option value="♂">Male</option>
								<option value="♀">Female</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="Search_name">Age</td>
						<td>
							From : <input name="SearchAgeMin" type="number" min="0" placeholder="Optional">
							To : <input name="SearchAgeMax" type="number" min="0" placeholder="Optional">
						</td>
					</tr>
					<tr>
						<td class="Search_name">Hobby</td>
						<td class="Search_selecter">
							<input name="SearchHobby" type="text">
						</td>
					</tr>
					<tr>
						<td class="Search_name">User Name</td>
						<td class="Search_selecter">
							<input name="SearchUserName" type="text">
						</td>
					</tr>
					<tr class="submit_search">
						<td colspan="2"><input type="submit" value="검색"></td>
					</tr>
			</table>
		</form>
	</div>

<!-- Include Footer.jsp -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
