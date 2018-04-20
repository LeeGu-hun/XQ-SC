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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="javascript">

	
	function prodList() {
		var selCate = document.getElementById("selCate").value;

		$.ajax({
			type : "GET",
			url : "vendor/prodList",
			data : "selCate=" + selCate,
			success : result
		});

	}

	function result(msg){
		$("#spProd").html(msg);
	
	}
	
/*	$("#")$(function() {
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
		$(this).datepicker("show");
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
*/
function addvendor() {
	vendorform.submit();
}


</script>


</head>
<body><div class="modal-header">
	<h2>신규등록</h2>
	</div>
	<div class="modal-body" >
	<form action="./vendor/newVendor" method="POST" enctype="multipart/form-data"  name="vendorform" >
		<table class="table">
			<tr>
				<td >회사ID :</td>
				<td><input type="text" name="VENDOR_ID" value="${cnt}" readonly></td>
				<td>회사명 :</td>
				<td><input type="text" name="VENDOR_NAME"></td>
			</tr>
			<tr>
				<td >사원수 :</td>
				<td><input type="text" name="VENDOR_EMP_NO"></td>
			</tr>
			
			<tr>
				<td>회사주소 :</td>
				<td><input type="text" name="VENDOR_ADDRESS"></td>
			</tr>
			<tr>

				<td>카테고리 :</td>
				<td><select name="selCate" id="selCate" onchange="prodList();">
						<option value="cate">카테고리</option>
						<c:forEach var="c" items="${map.cateList}">
							<option value="${c.CATEGORY_ID}">${c.CATEGORY_NAME}</option>
						</c:forEach>
				</select>
				<td>품목:</td>
				<td><span id="spProd"><select name="PRODUCT_ID" id="PRODUCT_ID">
				<option value="" >상품을 선택하세요</option>
					   </select>
					   </span>
					   </td>
				</td>
			
			<tr>
				<td>품질담당자이름 :</td>
				<td><input type="text" name="VENDOR_Q_NAME"></td>
				<td>품질 담당자 이메일 :</td>
				<td><input type="text" name="VENDOR_Q_EMAIL"></td>
				<td>품질담당자연락처 :</td>
				<td><input type="text" name="VENDOR_Q_TEL"></td>
			</tr>
			
			<tr>
				<td >영업담당자이름 :</td>
				<td><input type="text" name="VENDOR_S_NAME"></td>
				<td >영업담당자이메일 :</td>
				<td><input type="text" name="VENDOR_S_EMAIL"></td>
				<td >영업담당자연락처 :</td>
				<td><input type="text" name="VENDOR_S_TEL"></td>
			</tr>
			
			<tr>
				<td>품질보증서 :</td>
				<td><input type="file" name="VENDOR_ISO_FILE"></td>
			</tr>
			
			<tr>
				<td >사업자등록증 :</td>
				<td><input type="file" name="VENDOR_CERT_FILE"></td>
			</tr>

		</table>
		</div>
		</form>
		<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="addvendor()">등록</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	
</body>
</html>