<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>
<title>Audit Result</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

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

<script language="javascript">

	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "audit/prodList",
			data : "selCate=" + selCate,
			//"&selProd="+selProdVal,
			success : result
		});

	}

	function result(msg) {
		$("#spProd").html(msg);

	}
</script>

<body>

	<div id="">
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

					<td nowrap>카테고리 :</td>
					<td><select name="selCate" id="selCate" onchange="prodList();">
							<option value="cate">카테고리</option>
							<c:forEach var="c" items="${map.cateList}">
								<option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</option>
							</c:forEach>
					</select>
					<td nowrap>품목:</td>
					<td><span id="spProd"> <select>
								<option value="" selected>상품을 선택하세요</option>
						</select>
					</span></td>
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
					<th>Score</th>
					<th>Submit Result</th>
				</tr>
				<c:forEach var="auditBeans" items="${auditBeans}">
					<c:if test="${auditBeans.AUDIT_PLAN_DATE!=null}">
						<tr align="center" valign="middle" bordercolor="#333333">
							<td style="font-family: Tahoma; font-size: 12pt;" height="">
								<div align="center">${auditBeans.RNUM}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;">
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
							<td style="font-family: Tahoma; font-size: 12pt;">
								<div align="center">${auditBeans.AUDIT_SCORE}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 12pt;"><a
								href='#'><span>Submit</span></a></td>
						</tr>
					</c:if>
				</c:forEach>

			</table>
		</form>
	</div>
</body>
</html>