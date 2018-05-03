<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Audit Result</title>
</head>
<style>
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	height: 600px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

</style>

</script>

<link rel="stylesheet" type="text/css" href="/css/style.css?ver=2">

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<br>
<div style="max-height: 700px;">
		<table class="table table-hover" style="width: 100%">
			<div align="center" style="text-align: center;">
			<tr align="center" valign="middle" bordercolor="#333333" style="text-align: center;">
				
				<th style="text-align: center; width: 7% ">ID</th>
				<th style="text-align: center; width: 13%">Vendor</th>
				<th style="text-align: center; width: 13%">Product</th>
				<th style="text-align: center; width: 10%">Plan Date</th>
				<th style="text-align: center; width: 10%">Comp Date</th>
				<th style="text-align: center; width: 10%">Score Date</th>
				<th style="text-align: center; width: 7%">Type</th>
				<th style="text-align: center; width: 16%">Auditor</th>
				<th style="text-align: center; width: 7%">Result</th>
				<th style="text-align: center; width: 7%">View</th>
				</tr>
			</div>
			<c:forEach var="a" items="${arsList}">
				<tr align="center" valign="middle" bordercolor="#333333">
			
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_ID}
						<input type="hidden" value="${a.AUDIT_ID}" id="AUDIT_ID" name="AUDIT_ID">
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.VENDOR_NAME}(${a.VENDOR_ID})</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.PRODUCT_NAME}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_PLAN_DATE}
							<c:if test="${a.AUDIT_PLAN_DATE ==null}">
							-
							</c:if>
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_COMP_DATE}
							<c:if test="${a.AUDIT_COMP_DATE ==null}">
							-
							</c:if>
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_RSINPUT_DATE}
							<c:if test="${a.AUDIT_RSINPUT_DATE ==null}">
							-
							</c:if>
							
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_KIND_ID}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">
						<c:if test="${a.AUDIT_PLAN_DATE ==null}">
						-
						</c:if>
						<c:if test="${a.AUDIT_PLAN_DATE !=null}">
						${a.MEMBER_NAME}<br>(${a.MEMBER_ID})
						</c:if>
						<input type="hidden" value="${a.MEMBER_NAME}">
						</div>
					</td>
					
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div align="center">${a.AUDIT_RESULT}
							<c:if test="${a.AUDIT_RESULT ==null}">
							-
							</c:if>
						</div>
					</td>
		
					<td><a href="audit/auditVendorResult?id=${a.AUDIT_ID}
								&type=${a.AUDIT_KIND_ID}
								&score=${a.AUDIT_SCORE}
								&vendorid=${a.VENDOR_ID}
								&auditorId=${a.MEMBER_ID}
								&result=${a.AUDIT_RESULT}"
								data-toggle="modal"
								data-target="#myModal"
								style="text-decoration: underline;" >View</a></td>
				</tr>
			</c:forEach>
		</table>
		
			<!-- 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content" style="height:700px; overflow-y: scroll;"></div>
			</div>
		</div>
		
		
		</div>

