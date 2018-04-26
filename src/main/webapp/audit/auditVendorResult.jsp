<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<body>
<br><br>
<div class="container" style="font-family: Tahoma;">
		<div class="modal-header">
			<h1>Audit Vendor Result</h1>
		</div>
	<table class="table table-hover">
	<c:forEach var="d" items="${date}">
		<tr>
			<td nowrap>Audit ID :  
			<a href="audit/auditNcr?=${id}&id=${id}"
						data-toggle="modal"
						data-target="#myModal2">${id}</a>
			
			<input type="hidden" value="${id}" name = "AUDIT_ID" id = "AUDIT_ID"> </td>
			<td nowrap>Audit Type : ${type}</td>
			<td nowrap>Vendor Name : ${vendorname} (${vendorid})
			<input type="hidden" value="${vendorid}" name = "VENDOR_ID" id = "VENDOR_ID">
			<td nowrap>Product : ${prod}</td>
		</tr>
		<tr> 
				<td nowrap>Audit Date : ${d.AUDIT_COMP_DATE}</td>
				<td nowrap>Insert Date : ${d.AUDIT_RSINPUT_DATE}</td>
				<td nowrap>Auditor : ${auditor} (${auditorId })</td>
				<td nowrap>NCR Progress : ${ncrCountComp} / ${ncrCount}</td>
		</tr>
		</c:forEach>
		</table>
		
		<table class="table table-hover">
		<tr>
			<th nowrap>No</th>
			<th nowrap>Audit Description</th>
			<th nowrap>Score</th>
		</tr>
		
		
		<c:forEach var="c" items="${checkResult}">
			<tr>
				<td>
					<div>${c.RNUM}</div>
				</td>
				<td>
					<div>${c.CHECKLIST_DISCRIPTION}</div>
				</td>
				<td><div>${c.AUDIT_SCORE} / ${c.CHECKLIST_FULLSCORE}</div></td>
			</tr>
		</c:forEach>
		<tr>
			<td nowrap>Total Score : ${score }</td>
			<td nowrap>Audit Result : ${result }</td>
		</tr>
		
	</table>
	
		<!-- 2th Modal -->
	 <div id="myModal2" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width: 70%">
				<div class="modal-content"></div>
			</div>
		</div>
	
	
	
	</div>
	

	
</body>
