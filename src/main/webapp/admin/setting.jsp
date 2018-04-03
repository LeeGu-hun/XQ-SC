<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Setting</title>
      <link rel="stylesheet" href="./css/table.css" type="text/css">
      
	<style>
		#kind { background-color : green; height:100px;}
		#product{overflow:hidden;}
		#cate{float:left; width:50%; background-color:lime;}
		#prod{float:right; width:50%; background-color:orange;}
		
	</style>
      
</head>

<body>
    <blockquote> <br>
		<a href="<c:url value='/main'/>"> [ dddddd ]</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./admin/setting.jsp">다른 회원의 게시판보기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../logout">로그아웃</a>
	</blockquote>
	
	<div id = "kind">
		Audit 설정:
	</div>
	<div id = "product">
		<div id ="cate">
			<p>
				${cateCount} 개 
				<br>
				<input name="cateName" value="${cateName}">
				<input type="submit" value="등록">
			</p>
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
		</div>
		<div id ="prod">
			<p>
				${map.prodCount} 개 
				<br>
				
				<form name="deleteForm" method="post">
					<input name="cateName" value="${cateName}">
					<input type="submit" value="등록">
				</form>
			</p>
			<table width=50% border="0" cellpadding="0" cellspacing="0">
				<thead>
					<tr align="center" valign="middle">
						<th width="70%">
							<div align="center">제품</div>
						</th>
						<th width="15%">
							<div align="center">사용</div>
						</th>
						<th  width="15%">
							<div align="center">수정</div>
						</th>
					</tr>
				</thead>
				<c:forEach var="prod" items="${map.prodList}">
					<tr align="center" valign="middle">
						<td>
							<div align="center"><c:out value="${prod.CATEGORY_NAME}"/></div>
						</td>
						<td>
							<div align="center">${prod.PRODUCT_VALID}</div>
						</td>
						<td>
							<div align="center">수정</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>