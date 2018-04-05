<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Setting</title>
      <link rel="stylesheet" href="./css/table.css" type="text/css">

</head>

<body>
    <blockquote> <br>
		<a href="<c:url value='/main'/>"> [ dddddd ]</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./admin/setting.jsp">다른 회원의 게시판보기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../logout">로그아웃</a>
	</blockquote>

	<div>
	</div>	

	<table width=50% border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr align="center" valign="middle">
				<th width="70%">
					<div align="center">카테고리</div>
				</th>
				<th width="15%">
					<div align="center">사용</div>
				</th>
				<th  width="15%">
					<div align="center">수정</div>
				</th>
			</tr>
		</thead>
		<c:forEach var="cate" items="${map.cateList}">
			<tr align="center" valign="middle">
				<td>
					<div align="center"><c:out value="${cate.CATEGORY_NAME}"/></div>
				</td>
				<td>
					<div align="center">${cate.PRODUCT_VALID}</div>
				</td>
				<td>
					<div align="center">수정</div>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>