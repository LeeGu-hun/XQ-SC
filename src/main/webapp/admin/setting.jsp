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
<title>System Configuration</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.css"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.min.css"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2"></script>
      
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
	#auditSet { height:100px;}
	#aform{overflow:hidden;}
	#cform{float:left; width:50%; }
	#pform{float:right; width:50%; }
	#product{overflow:hidden;}
	#cate{float:left; width:50%; }
	#prod{float:right; width:50%; }
	label{
		font-weight : normal;
	}
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
			document.getElementById('ckCate').textContent= 'ENTER CONTENTS';
			name.focus();
			return;
		}
		document.getElementById('icf').submit();
	}
	
	function cateUpdate() {
		var name = document.getElementById('upCateName'); 
		if(name.value == "" ){
			document.getElementById('ckCate').textContent= 'ENTER CONTENTS';
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
			document.getElementById('ckProd').textContent= 'SELECT A CATEGORY OR ENTER CONTENT';
			name.focus();
			return;
		}
		document.getElementById('ipf').submit();
	}
	
	function prodUpdate() {
		var name = document.getElementById('upProdName'); 
		var cate = document.getElementById('prodCate').value;
		if(name.value == ""||cate == "cate"){
			document.getElementById('ckProd').textContent= 'SELECT A CATEGORY OR ENTER CONTENT';
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
	
	function aPeriodUpdate(){
		var period = document.getElementById('aPeriod');
		if(period.value == "" ){
			document.getElementById('aPeriodCk').textContent= 'ENTER CONTENTS';
			period.focus();
			return;
		}
		document.getElementById('periodForm').submit();
	}
	
	function scoreUpdate(){
		var score = document.getElementById('score');
		if(score.value == "" ){
			document.getElementById('scoreck').textContent= 'ENTER CONTENTS';
			score.focus();
			return;
		}
		document.getElementById('scoreForm').submit();
	}
</script>
</head>

<body>
	<%@ include file="/include/header.jsp"%><br>
<div class="container" >
		<br><br><br><br>
	<div id = "auditSet" align="center" style="overflow: hidden;">
		<div class="well well-sm" data-target="#aPeriodModal" data-toggle="modal" 
		style="float:left; height:80%; width:300px; margin: 0 30px">
			<h4><b>Audit Period</b></h4><p><b>${map.auditPeriod}</b> YEARS</p>
		</div>
		<div class="well well-sm" data-target="#scoreModal" data-toggle="modal" 
		style="float:right; height:80%; width:300px; margin: 0 30px">
			<h4><b>Audit Cut-off Score</b></h4><p><b>${map.score}</b> POINTS</p>
		</div>
	</div>
	<div id = "aform" align="center">
		<div id ="cform" align="center">
			<div>
				<span id ="cateInUp">
					<%@include file="/admin/set_cateIn.jsp" %>
				</span>
			</div>
		</div>
		<div id ="pform" align="center">
			<span id ="prodInUp">
				<%@include file="/admin/set_prodIn.jsp" %>
			</span>
		</div>
	</div>
	<div id = "product" align="center">
		<div id ="cate">
			<p align="right">
				A total of <b>${map.cateCount}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<table class="table table-striped table-bordered table-hover"
			style="border-collapse:collapse; width:95%">
				<thead style="float:left; width:100%;">
					<tr align="center" valign="middle" style="display:table; width:100%;">
						<th style="width:120px;">
							<div align="center">VALID</div>
						</th>
						<th>
							<div align="center">CATEGORY</div>
						</th>
					</tr>
				</thead>
				<tbody style="overflow-y:auto; overflow-x:hidden; float:left; width:100%; height:400px">
					<c:forEach var="cate" items="${cateList}">
						<tr onclick="cateUpdateForm('${cate.CATEGORY_ID}')" align="center" valign="middle" style="display:table; width:100%;">
							<td style="width:120px;">
								<div align="center">${cate.CATEGORY_VALID}</div>
							</td>
							<td>
								<div align="center">${cate.CATEGORY_NAME}</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id ="prod">
			<p align="right">
				A total of <b>${map.prodCount}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<table class="table table-striped table-bordered table-hover"
			style="border-collapse:collapse; width:95%">
				<thead style="float:left; width:100%;">
					<tr align="center" valign="middle" style="display:table; width:100%;">
						<th style="width:120px;">
							<div align="center">VALID</div>
						</th>
						<th>
							<div align="center">PRODUCT</div>
						</th>
					</tr>
				</thead>
				<tbody id = "prodList" style="overflow-y:auto; overflow-x:hidden; float:left; width:100%; height:400px">
					<%@include file="/admin/set_prodList.jsp" %>
				</tbody>
			</table>
		</div>
	</div>
</div>
	
	<div class="modal fade" id="aPeriodModal">
		<div class="modal-dialog" align="center">
			<div class="modal-content" style="width:350pt;">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">AUDIT PERIOD</h4>
				</div>
				<!-- body -->
				<div class="modal-body" align="center">
					<div>
						<form id="periodForm" action="Setting/SetPeriod" method="POST">
							<input type="text" id="aPeriod" name = "aPeriod" placeholder="${map.auditPeriod}"
							onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();" />
							YEARS
						</form>
					</div>
					<span id="aPeriodCk" style="font-size:9pt;color:red;"></span>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					<button type="button" class="btn btn-default" onclick="aPeriodUpdate()">UPDATE</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="scoreModal">
		<div class="modal-dialog" align="center">
			<div class="modal-content" style="width:350pt;">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">AUDIT CUT-OFF SCORE</h4>
				</div>
				<!-- body -->
				<div class="modal-body" align="center">
					<div>
						<form id="scoreForm" action="Setting/SetCutoffScore" method="POST">
							<input type="text" id ="score"  name = "score" placeholder="${map.score}"
							onKeyUp="onlyNum();" onKeyPress="onlyNum();" onKeyDown="onlyNum();" />
							POINTS
						</form>
					</div>
					<span id="scoreck" style="font-size:9pt;color:red;"></span>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					<button type="button" class="btn btn-default" onclick="scoreUpdate()">UPDATE</button>
				</div>
			</div>
		</div>
	</div>

</body>



</html>