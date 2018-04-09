<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="bean.*"%>
<title>Insert title here</title>

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>

<link rel="stylesheet" type="text/css" href="/css/style.css?ver=1">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>



<script>

$(function(){
	
	
}

function prodList() {
	var selCate = document.getElementById("selCate").value;
	var selProdVal = $("#selProd option:selected").val();
	<c:if test = "${requestScope.selProd!=null}">
		var selProdVal = "${requestScope.selProd}";
	</c:if>
	if (selCate == "" || selCate == "All") {
		document.getElementById('selProd').options.length = 0;
		return;
	}
	$.ajax({
		type : "GET",
		
		data : "selCate=" + selCate + "&All=y&selProd=" + selProdVal,
		success : result
	});
}

</script>

</head>
<body>
	<form>
		<div id=''>
			<ul>
				<li><a href='#'><span>Vendor 등록관리</span></a></li>
				<li class='active has-sub'><a href='#'><span>평가관리</span></a>
					<ul>
						<li class='has-sub'><a href='./AuditManage'><span>평가계획</span></a></li>
						<li class='has-sub'><a href='./AuditReport'><span>평가결과입력</span></a></li>
						<li class='has-sub'><a href='./AuditResult'><span>평가현황</span></a></li>
					</ul></li>
				<li><a href='#'><span>부적합관리</span></a></li>
				<li class='last'><a href='#'><span>시스템 관리</span></a></li>
			</ul>
		</div>
		<table>
			<tr>
				<td colspan="2">&nbsp; Date : <span><input type="date"></span>
					~<span><input type="date"></span> <input type="hidden"
					id="seq" value="0"> <input type="hidden" id="frh"
					value="300">
				</td>
				<td colspan="2">Manager &nbsp; <select id="1234" width="300px">
						<option value="All" selected>All</option>
						<c:forEach var="selCate" items="${selCate}">
							<option value="">${selCate.CATEGORY_NAME}</option>
						</c:forEach>
				</select></td>
				<td colspan="2">Category &nbsp; <select id="1234" width="300px">
						<option value="All" selected>All</option>
						<c:forEach var="selCate" items="${selCate}">
							<option value="">${selCate.CATEGORY_NAME}</option>
						</c:forEach>
				</select></td>
				<td colspan="2">Product &nbsp; <select id="selProd"
					width="300px">
						<option value="All" selected>All</option>
						<c:forEach var="selProd" items="${selProd}">
							<option value="">${selProd.PRODUCT_NAME}</option>
						</c:forEach>
				</select><input type="hidden" id="selProdW" name="selProdW"
					value="${requestScope.selProd==null?'All':requestScope.selProd}" /></td>
				<td colspan="2"><input type="button" value="View"></td>
			</tr>
		</table>
		<br> <br>
		<table border="1" id="auditTable">
			<tr>
				<th>No</th>
				<th>Audit ID</th>
				<th>Vendor (ID)</th>
				<th>Product (ID)</th>
				<th>Date</th>
				<th>Audit Type</th>
				<th>Manager(ID)</th>
				<th>Manager H.P</th>
				
				<th>Submit Result</th>
			</tr>
			<c:forEach var="auditBeans" items="${auditBeans}">
				<c:if test="${auditBeans.AUDIT_PLAN_DATE!=null}">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td style="font-family: Tahoma; font-size: 12pt;" height="">
							<div align="center">${auditBeans.RNUM}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;" height="">
							<div align="center">${auditBeans.AUDIT_ID}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.VENDOR_NAME}(${auditBeans.VENDOR_ID})</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.PRODUCT_NAME}(${auditBeans.PRODUCT_ID})</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.AUDIT_PLAN_DATE}</div>
						</td>

						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.AUDIT_KIND_ID}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.MEMBER_NAME}(${auditBeans.MEMBER_ID})</div>
						</td>
						<td style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${auditBeans.MEMBER_TEL}</div>
						</td>
					
						<td style="font-family: Tahoma; font-size: 12pt;"><a href='#'><span>Submit</span></a>
						</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
	</form>




</body>
</html>