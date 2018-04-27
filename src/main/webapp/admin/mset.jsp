<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Management</title>


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
	label{
				font-weight : normal;
			}
</style>
<script>
	function inMemForm() {
		$.ajax({
			type : "POST",
			url : "./MSet/MInsertForm",
			success : mForm
		});
	}
	
	function upMemForm(id) {
		$.ajax({
			type : "POST",
			url : "./MSet/MUpdateForm",
			data : "id=" + id,
			success : mForm
		});				
	}
	
	function mForm(msg) {
		$("#mInUpForm").html(msg);
	}
	
	function mInsert() {
		var name = document.getElementById('MEMBER_NAME').value; 
		var email = document.getElementById('MEMBER_EMAIL').value;
		var pass = document.getElementById('MEMBER_PASS').value;
		var tel = document.getElementById('MEMBER_TEL').value;
		
		var pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

		if(name == "" || email == "" ||pass == "" ||tel == "" ){
			document.getElementById('mInUp').textContent= 'ENTER CONTENTS';
			return;
		}
		if(!pattern.test(email)){
			document.getElementById('mInUp').textContent= 'INVALID EMAIL FORM';
			document.getElementById('MEMBER_EMAIL').focus();
			return;
		}
		document.getElementById('MemberCommand').submit();
	}
	
	function mUpdate() {

		var name = document.getElementById('MEMBER_NAME').value; 
		var email = document.getElementById('MEMBER_EMAIL').value;
		var pass = document.getElementById('MEMBER_PASS').value;
		var tel = document.getElementById('MEMBER_TEL').value;

		var pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		
		if(name == "" || email == "" ||pass == "" ||tel == "" ){
			document.getElementById('mInUp').textContent= 'ENTER CONTENTS';
			return;
		}
		if(!pattern.test(email)){
			document.getElementById('mInUp').textContent= 'INVALID EMAIL FORM';
			document.getElementById('MEMBER_EMAIL').focus();
			return;
		}
		document.getElementById('MemberCommand').submit();
	}
	
	
	function ckdepart(md) {
		location.href = "./MSet?mDepart=" + md
		+ "&curPage=${map.curPage}"
		+ "&mValid=${map.mValid}";
	}
	
	function ckvalid(mv) {
		location.href = "./MSet?mValid=" + mv
		+ "&curPage=${map.curPage}"
		+ "&mDepart=${map.mDepart}";
	}
	

	function list(curPage) {
		location.href = "./MSet?curPage=" + curPage
				+ "&mDepart=${map.mDepart}"
				+ "&mValid=${map.mValid}";
	}
	
</script>
</head>

<body>
    
	<%@ include file="/include/header.jsp"%><br>
<div class="container" >
	<br><br>
	<div align="right">UNREGISTERED VENDOR : <b>${map.ingmem}</b>&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<table class="table table-striped table-bordered table-hover"
	style="border-collapse:collapse; width:100%">
		<thead style="float:left; width:98.74%;">
			<tr align="center" valign="middle" style="display:table; width:100%;">
				<th style="width:15%;">
					<div align="center">DEPART</div>
				</th>
				<th style="width:10%;">
					<div align="center">NAME</div>
				</th>
				<th style="width:27%;">
					<div align="center">EMAIL</div>
				</th>
				<th style="width:25%;">
					<div align="center">TEL</div>
				</th>
				<th style="width:8%;">
					<div align="center">VALID</div>
				</th>
				<th style="width:15%;">
					<div align="center">ID</div>
				</th>
			</tr>
		</thead>
		<tbody style="overflow-y:auto; overflow-x:hidden; float:left; width:100%; height:90px">	
			<c:forEach var="m" items="${map.ingMemberList}">
				<tr onclick="upMemForm('${m.MEMBER_ID}')" style="display:table; width:100%;">
					<td style="width:15%;">
						<div align="center">
							${m.MEMBER_DEPART}
						</div>
					</td>
					<td style="width:10%;">
						<div align="center">
							${m.MEMBER_NAME}
						</div>
					</td>
					<td style="width:27%;">
						<div align="center">
							${m.MEMBER_EMAIL}
						</div>
					</td>
					<td style="width:25%;">
						<div align="center">
							${m.MEMBER_TEL}
						</div>
					</td>
					<td style="width:8%;">
						<div align="center">
							${m.MEMBER_VALID}
						</div>
					</td>
					<td style="width:15%;">
						<div align="center">
							${m.MEMBER_ID}
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="mInUpForm"><%@include file="/admin/m_In.jsp" %></div>
	<div align="center" style="background-color:#c3c6cc">
		<br>
		<%@include file="/admin/m_S.jsp" %><b><a href="./MSet">VIEW ALL</a></b>
		<br>
		<br>
	</div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr align="center" valign="middle">
				<th>
					<div align="center">DEPART</div>
				</th>
				<th>
					<div align="center">NAME</div>
				</th>
				<th>
					<div align="center">EMAIL</div>
				</th>
				<th>
					<div align="center">TEL</div>
				</th>
				<th>
					<div align="center">PASSWORD</div>
				</th>
				<th>
					<div align="center">VALID</div>
				</th>
				<th>
					<div align="center">ID</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${map.getMemList}">
				<tr onclick="upMemForm('${m.MEMBER_ID}')">
					<td>
						<div align="center">
							${m.MEMBER_DEPART}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_NAME}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_EMAIL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_TEL}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_PASS}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_VALID}
						</div>
					</td>
					<td>
						<div align="center">
							${m.MEMBER_ID}
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr align=center height=20>
				<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
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