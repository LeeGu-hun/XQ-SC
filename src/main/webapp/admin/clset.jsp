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


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.css"></script>
<script src="${pageContext.request.contextPath}/css/sb-admin-2.min.css"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
		
	function insertForm() {
		$.ajax({
			type : "POST",
			url : "./CLSet/CkLInsertForm",
			success : ckLForm
		});
	}
	
	function updateForm(id) {
		$.ajax({
			type : "POST",
			url : "./CLSet/CkLUpdateForm",
			data : "id=" + id,
			success : ckLForm
		});				
	}
	
	function ckLForm(msg) {
		$("#ckLInUp").html(msg);
	}
	
	function ckLInsert() {
		var inds = document.getElementById('inDiscription'); 
		
		if(inds.value == ""){
			document.getElementById('ckDs').textContent= '내용을 입력해주세요';
			inds.focus();
			return;
		}
		document.getElementById('cif').submit();
	}
	
	function ckLUpdate() {
		var upds = document.getElementById('upDiscription');
		
		if(upds.value == ""){
			document.getElementById('ckDs').textContent= '내용을 입력해주세요';
			upds.focus();
			return;
		}
		document.getElementById('cuf').submit();
	}
	
	function list(curPage) {
		location.href = "./CLSet?curPage=" + curPage
				+ "&auditKindId=${map.auditKindId}"
				+ "&cklValid=${map.cklValid}"
				+ "&keyword=${map.keyword}";
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
<div class="container">  
	<br><br>
	<div align="center">
		<span id="ckLInUp">
			<%@include file="/admin/ckl_In.jsp" %>
		</span>	
	</div>
	<br>
	<div align="right">
		<%@include file="/admin/ckl_S.jsp" %>
	</div>
	<div align="right">
		Regular : <a href="./CLSet?auditKindId=RE&cklValid=Y">총 ${map.ckLSumRe} 점</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		New : <a href="./CLSet?auditKindId=NE&cklValid=Y">총 ${map.ckLSumNe} 점 </a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="./CLSet">전체보기</a>
	</div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr align="center" valign="middle">
				<th>
					<div align="center">KIND</div>
				</th>
				<th>
					<div align="center">DISCRIPTION</div>
				</th>
				<th>
					<div align="center">FULLSCORE</div>
				</th>
				<th>
					<div align="center">VALID</div>
				</th>
				<th style="font-size:9pt;" align="left">
					<div>${map.listCnt}개</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${map.getCkList}">
				<tr>
					<td>
						<div align="center">
							${c.AUDIT_KIND}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_DISCRIPTION}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_FULLSCORE}
						</div>
					</td>
					<td>
						<div align="center">
							${c.CHECKLIST_VALID}
						</div>
					</td>
					<td>
						<div align="center">
							<a href="javascript:updateForm('${c.CHECKLIST_ID}')">수정</a>
	    				</div>
					</td>
				</tr>
			</c:forEach>
			<tr align=center height=20>
				<td colspan=5 style="font-family: Tahoma; font-size: 10pt;">
					<jsp:include page="/admin/paging.jsp" flush="true">
						<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
						<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
						<jsp:param name="startPageNo" value="${paging.startPageNo}" />
						<jsp:param name="pageNo" value="${paging.pageNo}" />
						<jsp:param name="endPageNo" value="${paging.endPageNo}" />
						<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
						<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
					</jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>