<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<table>
	<c:forEach var="d" items="${date}">
		<tr>
			<td nowrap>Audit ID :  ${id} <input type="hidden" value="${id}" name = "AUDIT_ID" id = "AUDIT_ID"> </td>
			<td nowrap>Audit Type : ${type}</td>
			<td nowrap>Vendor Name : ${vendorname} (${vendorid})
			<input type="hidden" value="${vendorid}" name = "VENDOR_ID" id = "VENDOR_ID">
			</td>
			<td nowrap>Product : ${prod}</td>
		</tr>
			<tr> 
				<td nowrap>Audit Date : ${d.AUDIT_COMP_DATE}</td>
				<td nowrap>Insert Date : ${d.AUDIT_RSINPUT_DATE}</td>
				<td nowrap>Auditor : ${auditor} (${auditorId })</td>
			</tr>
		<tr>
			<th nowrap>No</th>
			<th nowrap>Audit Description</th>
			<th nowrap>Score</th>
		</tr>
		
		</c:forEach>
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
			<td nowrap>Result : ${result }</td>
		</tr>
	</table>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
</body>
