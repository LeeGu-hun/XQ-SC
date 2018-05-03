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
			<td >Audit ID :  ${id}
			<input type="hidden" value="${id}" name = "AUDIT_ID" id = "AUDIT_ID"> </td>
			<td >Audit Type : ${type}</td>
			<td >Vendor Name : ${d.VENDOR_NAME} (${vendorid})
			<input type="hidden" value="${vendorid}" name = "VENDOR_ID" id = "VENDOR_ID">
			
		</tr>
		<tr> 
				<td >Audit Date : ${d.AUDIT_COMP_DATE}</td>
				<td >Insert Date : ${d.AUDIT_RSINPUT_DATE}</td>
				<td >Auditor : ${d.MEMBER_NAME }</td>
				<td >NCR Progress : ${ncrCountComp} / ${ncrCount}</td>
		</tr>
		</c:forEach>
		</table>
		
		<table class="table table-hover">
		<tr>
			<th  style="max-width: 50px">No</th>
			<th >Audit Description</th>
			<th >Score</th>
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
			<td >Total Score : ${score }</td>
			<td >Audit Result : ${result }</td>
		</tr>
		
	</table>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
</div>
	

	
</body>
