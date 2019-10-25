<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 이미지를 불러오기 위한 spring라이브러리 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<div>
		<table>
			<thead>
				<tr>
					<th>프로필사진</th>
					<th>회원명</th>
					<th>나이</th>
					<th>성별</th>
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
									<td><img src="<spring:url value='/upload/signup/${item.mImg}'/>" /></td>
									<td>${item.mName}</td>
									<td>${item.mAge}</td>
									<td>${item.mGender}</td>
									<td>${item.mNl}</td>
									<td>${item.mPl}</td>
									<td>${item.mHobby}</td>
									<td>${item.mIntro}</td>
									<td>${item.mAuth}</td>
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
<!--  페이징처리 -->
		<div>${pager.paging}</div>
	</div>

<!-- 검색기능 -->
<!-- 쿼리문에 직접적으로 하는것이므로 카멜케이스 사용X  -->
	<div>
		<form action="" method="get" onsubmit="return profile();">
			<table>
				<th> Find New Friends!!!</th>
					<tr>
						<td>Native Language</td>
						<td>
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
						<td>Practice Language</td>
						<td>
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
						<td>Gender</td>
						<td>
							<select name="SearchGender">
								<option value="">- All -</option>
								<option value="♂">Male</option>
								<option value="♀">Female</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Age</td>
						<td>
							From : <input name="SearchAgeMin" type="number" min="0" placeholder="Optional">
							To : <input name="SearchAgeMax" type="number" min="0" placeholder="Optional">
						</td>
					</tr>
					<tr>
						<td>Hobby</td>
						<td>
							<input name="SearchHobby" type="text">
						</td>
					</tr>
					<tr>
						<td>User Name</td>
						<td>
							<input name="SearchUserName" type="text">
						</td>
					</tr>

					<tr><td><input type="submit" value="검색"></td></tr>
			</table>
		</form>
	</div>

<div><a href="../">돌아가기</a></div>
</body>
</html>
