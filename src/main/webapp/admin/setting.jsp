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
<script>
	function cateInsertForm() {
		$.ajax({
			type : "POST",
			url : "./Setting/InsertCateForm",
			success : cateForm
		});
	}
		
	function cateUpdateForm(cateId) {
		
		$.ajax({
			type : "POST",
			url : "./Setting/CateUpdate",
			data : "cateId=" + cateId,
			success : cateForm
		});				
	}
	
	function cateForm(msg) {
		$("#cateInUp").html(msg);
	}
	
	function cateInsert() {
		var name = document.getElementById('inCateName'); 
		if(name.value == "" ){
			document.getElementById('ckCate').textContent= '내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('icf').submit();
	}
	
	function cateUpdate() {
		var name = document.getElementById('upCateName'); 
		if(name.value == "" ){
			document.getElementById('ckCate').textContent= '내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('ucf').submit();
	}

	function prodInsertForm() {
		$.ajax({
			type : "POST",
			url : "./Setting/InsertProdForm",
			success : prodForm
		});
	}
		
	function prodUpdateForm(prodId) {
		
		$.ajax({
			type : "POST",
			url : "./Setting/ProdUpdate",
			data : "prodId=" + prodId,
			success : prodForm
		});				
	}
	
	function prodForm(msg) {
		$("#prodInUp").html(msg);
	}
	
	
	function prodInsert() {
		var name = document.getElementById('inProdName'); 
		if(name.value == "" ){
			document.getElementById('ckProd').textContent= '내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('ipf').submit();
	}
	
	function prodUpdate() {
		var name = document.getElementById('upProdName'); 
		if(name.value == "" ){
			document.getElementById('ckProd').textContent= '내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('upf').submit();
	}
	
	function prodTable() {
		var id = document.getElementById('prodCate');
		$.ajax({
			type : "POST",
			url : "./Setting/ProdCate",
			data : "id=" + id,
			success : prodCateForm
		});	
	}

	function prodCateForm(msg) {
		$("#prodList").html(msg);
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
		Audit 설정:dsdfffffffffss
	</div>
	<div id = "product">
		<div id ="cate">
			<p>
				${map.cateCount} 개
			<br>
			<div>
			<span id ="cateInUp">
				<%@include file="/admin/set_cateIn.jsp" %>
			</span>
			</div>
			<br>
			<span id="ckCate" style="font-size:9pt;color:red;"></span>
			<table>
				<thead>
					<tr align="center" valign="middle">
						<th>
							<div align="center">VALID</div>
						</th>
						<th>
							<div align="center">CATEGORY</div>
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
								<a href="javascript:cateUpdateForm('${cate.CATEGORY_ID}')">
								${cate.CATEGORY_NAME}
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id ="prod">
			<p>
				${map.prodCount} 개
			</p>
			<br>
			<select name = "prodCate" id = "prodCate" onchange = "prodTable();">
				<option value = "cate">카테고리</option>
					<c:forEach var = "c" items ="${map.cateList}">
						<option value = "${c.CATEGORY_ID}" 
							<c:out value="${map.selCate == c.CATEGORY_ID?'selected':''}"/>
						>
							${c.CATEGORY_NAME}
						</option>
					</c:forEach>
			</select>
			<span id ="prodInUp">
				<%@include file="/admin/set_prodIn.jsp" %>
			</span>
			<br>
			<span id="ckProd" style="font-size:9pt;color:red;"></span>
			<table width=50% border="0" cellpadding="0" cellspacing="0">
				<thead>
					<tr align="center" valign="middle">
						<th>
							<div align="center">VALID</div>
						</th>
						<th>
							<div align="center">PRODUCT</div>
						</th>
					</tr>
				</thead>
				<span id ="prodList">
					<%@include file="/admin/set_prodList.jsp" %>
				</span>
			</table>
		</div>
	</div>
</body>
</html>