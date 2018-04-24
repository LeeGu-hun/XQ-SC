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

		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		
      <link rel="stylesheet" href="./css/table.css" type="text/css">
      
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
		#period { height:100px;}
		#product{overflow:hidden;}
		#cate{float:left; width:50%; }
		#prod{float:right; width:50%; }
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
			url : "./Setting/CateUpdateForm",
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
			url : "./Setting/ProdUpdateForm",
			data : "prodId=" + prodId,
			success : prodForm,
			complete : selectCate
		});				
	}
	
	function prodForm(msg) {
		$("#prodInUp").html(msg);
	}
	
	function selectCate()	{
		var cateid = document.getElementById("cateid").value;
		$("#prodCate > option[value ="+cateid+"]").attr("selected", "ture");
	}
	
	function prodInsert() {
		var name = document.getElementById('inProdName'); 
		var cate = document.getElementById('prodCate').value;
		
		if(name.value == ""||cate == "cate"){
			document.getElementById('ckProd').textContent= '카테고리를 선택하거나 내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('ipf').submit();
	}
	
	function prodUpdate() {
		var name = document.getElementById('upProdName'); 
		var cate = document.getElementById('prodCate').value;
		if(name.value == ""||cate == "cate"){
			document.getElementById('ckProd').textContent= '카테고리를 선택하거나 내용을 입력해주세요';
			name.focus();
			return;
		}
		document.getElementById('upf').submit();
	}
	
	function prodTable() {
		var id = document.getElementById('prodCate').value;
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
	
	

	function onlyNum(){
		var keycode = window.event.keyCode;
		if (keycode == 8
				|| (keycode >= 35 && keycode <= 40)
				|| (keycode >= 46 && keycode <= 57)
				|| (keycode >= 96 && keycode <= 105)
				|| keycode == 110
				|| keycode == 190) {
			window.event.returnValue = true;
			calcHap();
			return;
		} else {
			window.event.returnValue = false;
			return;
		}
	}
	
</script>
</head>

<body>

	<%@ include file="/include/header.jsp"%><br>
	
	<div id = "period">
		Audit period : 
		<a href="#" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">${map.auditPeriod} YEARS</a>
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
				<c:forEach var="cate" items="${cateList}">
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
				<tbody id = "prodList">
					<%@include file="/admin/set_prodList.jsp" %>
				</tbody>
			</table>
		</div>
	</div>
</body>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
   		<form action="Setting/SetPeriod" method="POST">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">AUDIT PERIOD</h4>
		      </div>
		      <div class="modal-body">
					<input type="text" name = "aPeriod" onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();" />
		      </div>
		      <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
		      </div>
   		</form>
    </div>
  </div>
</div>







</html>