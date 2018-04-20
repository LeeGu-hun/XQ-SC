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
<title>Audit Insert</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 




<script>
	function auditConfirm() {
		$.ajax({
			type : "GET",
			url : "audit/auditConfirm",
			success : result
		});
	}

	function newVendorAudit() {
		$.ajax({
			type : "GET",
			url : "audit/newVendorAudit",
			success : result
		});
	}

	function regularVendorAudit() {
		$.ajax({
			type : "GET",
			url : "audit/regularVendorAudit",
			success : result
		});
	}
	
	function add() {
		form.submit();
	}
	
	function auditorSearch(index){		
		$('#auditorSearchModal').modal('show');
		$('#index').val(index);		
	}
	
	function result(msg) {
		$("#result").html(msg);
	}
	
	function rowselect1(auditor_name, auditor_id, index) {	
		var audiIds = document.querySelectorAll("#AUDITOR_ID");
		for(var i=0;i<audiIds.length;i++){
			var audiId = audiIds[i];
			if (i == index)  audiId.value = auditor_id ;				
 		}		
		$('#auditorSearchModal').modal('hide');
	}
	
	function searchAuditorId(index){			
		var auditor_name = document.getElementById("auditor_name").value;		
		$.ajax({
			type : "POST",
			url : "audit/searchAuditorId",
			data : "auditor_name="+ auditor_name+"&index="+index,
			success : result1,
		});		
	}

	function result1(msg1){
		$("#auditorList").html(msg1);		
	}

	
	
</script>

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

</head>
<body>

	<div id='cssmenu'>
		<ul>
			<li><a href='#'><span>Vendor 등록관리</span></a></li>
			<li class='active has-sub'><a href='#'><span>평가관리</span></a>
				<ul>
					<li class='has-sub'><a href='./AuditManage'><span>평가계획조회</span></a></li>
					<li class='has-sub'><a href='./AuditReport'><span>평가결과입력</span></a></li>
					<li class='has-sub'><a href='./AuditResult'><span>평가현황</span></a></li>
				</ul></li>
			<li><a href='#'><span>부적합관리</span></a></li>
			<li class='last'><a href='#'><span>시스템 관리</span></a></li>
		</ul>
	</div>

	<p>
		Total : <a href='./AuditManage'><span>${allCount}</span></a>
	</p>
	<p>
		Regular Vendor Audit : <a href='#'
			onclick="javascript:regularVendorAudit()">${regularVencorCount}</a>
	</p>
	<p>
		New Vendor Audit : <a href='#' onclick="javascript:newVendorAudit()">${newVendorCount}</a>
	</p>

	<span id="result">
		<table border="1" id="auditTable">
			<tr>
				<th>No</th>
				<th>Vendor Name</th>
				<th>Vendor ID</th>
				<th>Audit Type</th>
				<th>Vendor Quality Manager(Tel)</th>
				<th>Vendor Sales Manager (Tel)</th>
				<th>Vendor Address</th>
				<th>Auditor(ID)</th>
				<th>Audit Plan Date</th>
				<th>Audit Outcall Date</th>
				<th>Submit</th>
			</tr>
			</span>
			<c:forEach var="audit" items="${listBean}"  varStatus="status" >
				<form action="./audit/auditManage" method="POST" name="form">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
							<div align="center">${audit.RNUM}</div>
						</td>

						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_NAME}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">
								<input type="text" value="${audit.VENDOR_ID}"
									readonly="readonly" name="VENDOR_ID">
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">
								<c:if test="${audit.AUDIT_NEXT_DATE ==null }">
									<input type="text" value="NE" readonly="readonly"
										name="AUDIT_KIND_ID" id="AUDIT_KIND_ID">
								</c:if>
								<c:if test="${audit.AUDIT_NEXT_DATE !=null }">
									<input type="text" value="RE" readonly="readonly"
										name="AUDIT_KIND_ID">
								</c:if>
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_Q_NAME}(${audit.VENDOR_Q_TEL})</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_S_NAME}(${audit.VENDOR_S_TEL})</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">${audit.VENDOR_ADDRESS}</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
						<script>
						
						</script>
							<div align="center">
								<input type="text" name="AUDITOR_ID" id="AUDITOR_ID" />
									<image src="${pageContext.request.contextPath}/images/icon_search.gif" 
									
									data-toggle="modal" onclick="auditorSearch(${status.index })"></image>
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">
								<input type="date" name="AUDIT_PLAN_DATE">
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;">
							<div align="center">
								<input type="date" name="AUDIT_COMP_DATE">
							</div>
						</td>
						<td nowrap style="font-family: Tahoma; font-size: 12pt;"><input
							type="submit" value="Submit" /></td>
					</tr>
				</form>
			</c:forEach>
		</table> 

	
		
		<!--  모달 시작 -->
		<div class="modal fade" id="auditorSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">Auditor Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div>
							<form id="formSearchauditor" name="formSearchAuditor" method="post">
								<table class="table">
									<tr>
										<td>Auditor Name: <input type="text" name="auditor_name"
											id="auditor_name" /></td>
										<input type="hidden" name="index" id="index" value=""/>
											
										<td><input class="button" type="button" value="Search"
											id="btnsearch" onclick="searchAuditorId(index.value)"></td>
									</tr>

								</table>
							</form>
						</div>
						
						<div id="auditorList"></div>
						
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div> <!--  모달 끝 -->
</body>
</html>



