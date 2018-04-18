<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="javascript">
	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "./prodList",
			data : "selCate=" + selCate,
			success : result
		});

	}

	function result(msg) {
		$("#spProd").html(msg);

	}

	/*	$(function() {
	 $("#from, #to").datepicker(
	 {
	 dateFormat : 'yy-mm-dd',
	 prevText : '이전 달',
	 nextText : '다음 달',
	 monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
	 '8월', '9월', '10월', '11월', '12월' ],
	 monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	 '7월', '8월', '9월', '10월', '11월', '12월' ],
	 dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	 dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	 dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	 showMonthAfterYear : true,
	 yearSuffix : '년'
	 });

	 });
	 */
	 function searchvendor() {
		 vendorform.submit();
		}
	 
</script>
<body>
	<div class="container">
	<legend style="font-family: Tahoma; font-size: 20pt;">Vendor Status</legend>
		<form action="./vendorStatus" method="POST" commandName="cmd"enctype="multipart/form-data" name="vendorform">
			<table class="table" width="100%">
				<tr>
					<th>기간 : <input type="date" id="from" name="from" />~
					</th>
					<th><input type="date" id="to" name="to"/></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>회사명:<select style="width: 150px;">
							<option value="vendor">All</option>
							<c:forEach var="v" items="${vendorList}">
								<option value="${v.VENDOR_ID}">${v.VENDOR_NAME}</option>
							</c:forEach>
					</select></th>
					<th>카테고리:<select name="selCate" id="selCate"
						onchange="prodList();" style="width: 150px;">
							<option value="cate">All</option>
							<c:forEach var="c" items="${map.cateList}">
								<option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</option>
							</c:forEach>
					</select>
					</th>
					<th>품목: <span id="spProd"> <select
							style="width: 150px;" name="PRODUCT_ID" id="PRODUCT_ID">
								<option value="">상품을 선택하세요</option>
						</select>
					</span>
					</th>
					<th>유효성:<select style="width: 150px;">
							<option>Y</option>
							<option>N</option>
					</select></th>
					<th><input onclick="searchvendor()" type="submit" value="조회"></th>
				</tr>
			</table>
		</form>
	</div>
	<c:if test="${! empty vendors}">
		<div class="container">
			<table class="table table-striped">
				<tr align="center" valign="middle" bordercolor="#333333">
					<td>No.</td>
					<td>회사ID</td>
					<td>회사명</td>
					<td>카테고리</td>
					<td>품목</td>
					<td>Audit Date</td>
					<td>담당자</td>
					<td>담당자 이메일</td>
					<td>유효성</td>
					<td>NCR</td>
				</tr>
				<c:forEach var="v" items="${vendors}">
					<tr align="center" valign="middle" bordercolor="#333333">
					<td>${v.RNUM}</td>
					<td>${v.VENDOR_ID}</td>
					<td>${v.VENDOR_NAME}</td>
					<td>${v.CATEGORY_NAME}</td>
					<td>${v.PRODUCT_NAME}</td>
					<td>${v.AUDIT_RSINPUI_DATE}</td>
					<td>${v.VENDOR_Q_NAME}</td>
					<td>${v.VENDOR_Q_EMAIL}</td>
					
		</tr>
		</c:forEach>
			</table>
		</div>
		</c:if>
</body>
</html>