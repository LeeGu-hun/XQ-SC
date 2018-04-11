<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Setting</title>
      <link rel="stylesheet" href="./css/table.css" type="text/css">
      
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<style>
		#kind { background-color : green; height:100px;}
		#product{overflow:hidden;}
		#cate{float:left; width:50%; background-color:lime;}
		#prod{float:right; width:50%; background-color:orange;}
		
	</style>
	<script  language="javascript">
		function prodTable(){
			location.href = "./Setting?selCate="+selCate.value;		
			selCateTrue();
		}
		
		function cateUpdate(cateId) {
			document.getElementById("test").value = "dkdkdkdk";
			$.ajax({
				type : "POST",
				url : "./Setting/Update",
				data : "cateId=" + cateId,
				success : result
			});
		}
		
		function result(msg) {
			$("#cateInUp").html(msg);
		}
		
		function cateInsert() {
			$("#cateInUp").html(<%@include file="/admin/set_cateIn.jsp" %>);
		}
	</script>
      
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
				${cateCount} 개....
				<input id="test" value="test" />
			<br>
			<div>
			<span id ="cateInUp">
				<%@include file="/admin/set_cateIn.jsp" %>
			</span>
			</div>
			<br>
			<table>
				<thead>
					<tr align="center" valign="middle">
						<th>
							<div align="center">VALID</div>
						</th>
						<th>
							<div align="center">CATEGORY</div>
						</th>
						<th>
						</th>
					</tr>
				</thead>
				<c:forEach var="cate" items="${map.cateList}">
					<tr align="center" valign="middle">
						<td>
							<div align="center">${cate.CATEGORY_VALID}</div>
						</td>
						<td>
							<div align="center">
								<a href="javascript:cateUpdate(${cate.CATEGORY_ID})">${cate.CATEGORY_NAME}</a>
							</div>
						</td>
						<td>
							<div align="center">
								<input type="button" value="ㅇ" onclick="cateUpdate(${cate.CATEGORY_ID})" />
								<button type="button" onclick="cateUpdate(${cate.CATEGORY_ID})" >a</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id ="prod">
			<p>
				${map.prodCount} 개
				<br>
				<form name = "selCateForm" action ="Setting" method="post">
					<select name = "selCate" id = "selCate" onchange = "prodTable();">
						<option value = "cate">카테고리</option>
							<c:forEach var = "c" items ="${map.cateList}">
								<option value = "${c.CATEGORY_ID}" 
									<c:out value="${map.selCate == c.CATEGORY_ID?'selected':''}"/>
								>
									${c.CATEGORY_NAME}
								</option>
							</c:forEach>
					</select>
				</form>
				<form method="post">
					<input name="prodName" value="${prodName}">
					<input type="checkbox" name="useProd" id="useProd" value="${useProd}" />
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
							<div align="center"><c:out value="${prod.PRODUCT_NAME}"/></div>
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