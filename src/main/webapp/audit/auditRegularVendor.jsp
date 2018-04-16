
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form>

	<table border="1" id="auditTable">
		<tr>
			<th>No</th>
			<th>Audit ID</th>
			<th>Vendor Name (ID)</th>
			<th>Audit Type</th>
			<th>Audit Plan Date</th>
			<th>Audit Outcall Date</th>
			<th>Auditor(ID)</th>
			<th>Auditor Phone</th>
			<th>Vendor Quality Manager(Tel)</th>
			<th>Vendor Sales Manager(Tel)</th>
			<th>Vendor Address</th>
			<th>Audit Score</th>
			<th>Submit</th>
		</tr>
		<c:forEach var="audit" items="${listBean}">

			<tr align="center" valign="middle" bordercolor="#333333">
				<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
					<div align="center">${audit.RNUM}</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;" height="">
					<div align="center">
						<input type="text">
					</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.VENDOR_NAME}(${audit.VENDOR_ID})</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.AUDIT_KIND_ID}</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.AUDIT_PLAN_DATE}
						<c:if test="${audit.AUDIT_PLAN_DATE==null}">
							<input type="date">
						</c:if>
					</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.AUDIT_COMP_DATE}
						<c:if test="${audit.AUDIT_COMP_DATE==null}">
							<input type="date">
						</c:if>
					</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.MEMBER_NAME}(${audit.MEMBER_ID})</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;">
					<div align="center">${audit.MEMBER_TEL}</div>
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
					<div align="center">${audit.AUDIT_SCORE}</div>
				</td>
				<td nowrap style="font-family: Tahoma; font-size: 12pt;"><a
					href='#'><span>Submit</span></a></td>
			</tr>

		</c:forEach>

	</table>
</form:form>

