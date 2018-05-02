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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">



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

.td {
	width: 50px;
	height: 22px;
	display: inline-block;
	border: 1px solid #111;
	word-wrap: break-word;
}
</style>

</head>
<body>
	<%@ include file="/include/header.jsp"%><br>
	<div>&nbsp;</div>
	<div class="container" style="width: 1600px;">
		<div class="row">
			<div class="col-lg-15">
				<div class="panel panel-default">
					<div class="panel-heading">Audit Plan</div>
					<!-- /.panel-heading -->
					<div class="panel-body" style="width: 1400px;">
						<p>
						<div class="container" style="font-family: Tahomsa; width: 1200px">
							Total: <a href='./AuditManage'><span>${allCount}</span></a> </font> <br>
							<br> <span id="result">
								<div class="container" style="word-break: break-all;">
									<div class="table-responsive" style="height: 700px; width: 1400px">
			<table style="table-layout: fixed; word-break: break-all; 
			height: auto; align-content: center;"
				class="table table-hover" align="center">
					<th style="text-align: center; width: 7%">ID</th>
					<th style="text-align: center; width: 11%">Vendor</th>
					<th style="text-align: center; width: 5%">Type</th>
					<th style="text-align: center; width: 13%">Q-Manager</th>
					<th style="text-align: center; width: 18%">Product</th>
					<th style="text-align: center; width: 15%">Address</th>
					<th style="text-align: center; width: 10%">Auditor</th>
					<th style="text-align: center; width: 14%">Plan Date</th>
					<th style="text-align: center; width: 7%">Submit</th>
		<c:forEach var="audit" items="${listBean}" varStatus="status">
				<form:form commandName="loginCommand" style="height:100%;"
				action="./AuditManage" method="POST" name="form">
				
				<tr valign="middle" bordercolor="#333333">
				
					<td style="font-family: Tahoma; font-size: 12pt;" align="center" >
						<div align="center">${audit.AUDIT_ID}
							<input type="hidden" value="${audit.AUDIT_ID}"
								readonly="readonly" name="AUDIT_ID">
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt; word-break: break-all;">
						<div>${audit.VENDOR_NAME}<br>(${audit.VENDOR_ID})</div>
						<input type="hidden" value="${audit.VENDOR_ID}"
						readonly="readonly" name="VENDOR_ID">
					</td>
					<td style="font-family: Tahoma; font-size: 12pt; 
					word-break: break-all;">
						<div style="width: 30px; text-align: center;">
							<c:if test="${audit.AUDIT_NEXT_DATE == null }">
								NE
							<input type="hidden" value="NE" readonly="readonly" 
							name="AUDIT_KIND_ID" id="AUDIT_KIND_ID">
							</c:if>
							<c:if test="${audit.AUDIT_NEXT_DATE !=null }">
								RE
							<input type="hidden" value="RE" readonly="readonly" 
							name="AUDIT_KIND_ID" id="AUDIT_KIND_ID">
							</c:if>
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;
					 word-break: break-all; align-content: center; align="center" >
						${audit.VENDOR_Q_NAME}<br>
						(${audit.VENDOR_Q_EMAIL})
					</td>
					<td style="font-family: Tahoma; font-size: 12pt;">
						<div>${audit.PRODUCT_NAME}</div>
					</td>
					
					<td style="font-family: Tahoma; font-size: 12pt; word-break: break-all;">
						<div>${audit.VENDOR_ADDRESS}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt; word-break: break-all; width: auto;">
						<div align="center">
							<input type="text" name="AUDITOR_ID" id="AUDITOR_ID"
								data-toggle="modal"
								onclick="auditorSearch(${status.index})"
								path="id" style="height: 30px; width: 80px" class="form-control"/>
						</div> <span style="font-size: 9pt; color: red;"><form:errors
								path="id" /></span>
					</td>
					<td style="font-family: Tahoma; font-size: 12pt; word-break: break-all;">
							<input type="date" name="AUDIT_PLAN_DATE"
								id="AUDIT_PLAN_DATE"
								style="height: 30px">
					</td>
					&nbsp; 
					<td style="font-family: Tahoma; font-size: 12pt; word-break: break-all;" align="center" >
						<input type="submit" value="submit"
						class="btn btn-default" align="center" />
					</td>
				</tr>
			</form:form>
			
					</c:forEach>
				
			</table>

									</div>
								</div>
							</span>


		<!--  모달 시작 -->
		<div class="modal fade" id="auditorSearchModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- header title -->
						<h4 class="modal-title">Auditor Search</h4>
					</div>
					<!-- body -->
					<div class="modal-body"
						style="height: 500px; overflow-y: scroll;">
						<div>
							<form id="formSearchauditor" name="formSearchAuditor"
								method="post">
								<table class="table">
									<tr>
										<td>Auditor Name: 
										<input type="text" name="auditor_name" id="auditor_name" class="form-control" /></td>
										<input type="hidden" name="index" id="index" width="140px"/>
										<td><input class="button" type="button"
											value="Search" id="btnsearch"
											onclick="searchAuditorId(index.value)"
											class="btn btn-default"></td>
									</tr>
								</table>
							</form>
						</div>
						<div id="auditorList"></div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div>

		<!--  모달 끝 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content"
					style="height: 700px; overflow-y: scroll;"></div>
			</div>
		</div>
		<!--  모달 끝 -->		
		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



