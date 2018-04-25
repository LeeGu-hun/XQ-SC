<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<style>
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="bean.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/css/sb-admin-2.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css?ver=1.3">
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	href="${pageContext.request.contextPath}/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function ncrIncompList() {
	$('#ncrList').modal('show');
}
</script>

<title>Main</title>
</head>

<body>
<%@ include file="/include/header.jsp"%><br>
<a href="./logout">로그아웃</a>	
<a href="./ChangedPwd">비번변경</a>
<li><a href="./AuditManage">평가관리</a></li>
<div class="container">
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-comments fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${vendorcnts}</div>
								<div>Vendor to Register</div>
							</div>
						</div>
					</div>
					<a href="vendor/vendorRegister">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${auditPlanCnts}/${auditRinputCnts}</div>
								<div>Audit to Plan / Audit to Perform</div>
							</div>
						</div>
					</div>
					<a href="./AuditManage">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="panel panel-yellow">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-shopping-cart fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${ncrCnts}</div>
								<div>NCR to close!</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left" onclick="ncrIncompList()">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		
	
	<!--  detail 모달 시작 -->
		<div class="modal fade" id="ncrList">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">NCR Detail</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<div id="ncrListBox">
						<table class="table table-hover" border="1" >
							<thead>
								<tr>
									<th>NCR No.</th>
									<th>Audit ID</th>
									<th>Vendor Name</th>
									<th>Subject</th>
									<th>Description</th>
									<th>Issuer Name</th>
									
								</tr>
							</thead>
							<tbody >
										<c:forEach var="i" items="${ncrImcompList}">
											<tr >									
												<td>${i.ncr_id}</td>
												<td>${i.audit_id}</td>
												<td>${i.vendor_name}</td>
												<td>${i.ncr_title}</td>
												<td>${i.ncr_description}</td>
												<td>${i.issuer_name}</td>
											</tr>
										</c:forEach>
									
							</tbody>		
					</table>									
						
						</div>

					</div>
					<!-- Footer -->

				</div>
			</div>
		</div>

		<!--  모달 끝 -->
</body>
</html>