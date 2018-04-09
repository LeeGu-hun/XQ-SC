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
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script language="javascript">


	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "vendor/prodList",
			data : "selCate=" + selCate,
			//"&selProd="+selProdVal,
			success : result
		});

	}

	function result(msg) {
		$("#spProd").html(msg);

	}
	
	$(function() {
		$("#saleDate").datepicker(
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
		getDate();

	});

	function getDate() {
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth() + 1;
		if (mm < 10) {
			mm = "0" + mm;
		}
		var dd = newDate.getDate();
		if (dd < 10) {
			dd = "0" + dd;
		}
		var toDay = yyyy + "-" + mm + "-" + dd;
		<c:if test="${requestScope.date1 eq null }">
		document.getElementById("saleDate").value = toDay;
		</c:if>
	}
	
</script>

</head>
<body>
	<div class="modal-header">
		<h2>신규등록</h2>
	</div>
	<div class="modal-body"">
		<form:form method="POST" commandName="vendorCommand"
			enctype="multipart/form-data" name="Vendorform"
			data-target="#myModal">
			<table>
				<tr>
					<td nowrap>회사ID :</td>
					<td><input type="text" value="${cnt}" readonly></td>
					<td nowrap>회사명 :</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td nowrap>사원수 :</td>
					<td><input type="text"></td>
				</tr>

				<tr>
					<td nowrap>회사주소 :</td>
					<td colspan="2"><input type="text"></td>
				</tr>
				<tr>

					<td nowrap>카테고리 :</td>
					<td><select name="selCate" id="selCate" onchange="prodList();">
							<option value="cate">카테고리</option>
							<c:forEach var="c" items="${map.cateList}">
								<option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</option>
							</c:forEach>
					</select>
					<td nowrap>품목:</td>
					<td><span id="spProd"> 
						<select>
							<option value="" selected>상품을 선택하세요</option>
						</select>
					</span></td>
					</td>
				<tr>
					<td nowrap>요청일자 :</td>
					<td><input type="text" name="saleDate" id="saleDate"></td>
				</tr>
				<tr>
					<td nowrap>품질담당자이름 :</td>
					<td><input type="text"></td>
					<td nowrap>품질 담당자 전화번호 :</td>
					<td><input type="text"></td>
					<td nowrap>품질담당자연락처 :</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td nowrap>구매담당자이름 :</td>
					<td><input type="text"></td>
					<td nowrap>구매담당자전화번호 :</td>
					<td><input type="text"></td>
					<td nowrap>구매담당자연락처 :</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td nowrap>품질보증서 :</td>
					<td><input type="file"></td>
				</tr>
				<tr>
					<td nowrap>사업자등록증 :</td>
					<td><input type="file"></td>
				</tr>

			</table>
	</div>
	</form:form>
	<div class="modal-footer">
		<a href="javascript:addvendor()">[등록]</a>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>

</body>
</html>