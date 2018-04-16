<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<table class="table"> 
		<c:forEach var="b" items="${ncrBean}">
			<tr>
				<td>Audit No.</td>
				<td>${b.audit_id}</td>
				<td>Vendor Name</td>
				<td>${b.vendor_name}</td>
				<td>Issuer</td>
				<td>${b.issuer_name }</td>
				
			</tr>
			<tr>
				<td>Kind of Audit</td>
				<td>${b.audit_kind }</td>
				<td>Audit Result</td>
				<td>${b.audit_result}</td>
				<td>Grade</td>
				<td>${b.ncr_grade_id }</td>				
			</tr>

			<tr>
				<td>Subject</td>
				<td >${b.ncr_title }</td>
			</tr>
			
			<tr>
				<td>Description</td>
				<td colspan = "7">
				<textarea class="form-control col-sm-5" rows="5">${b.ncr_description }</textarea>
				</td>
			</tr>
			
			<tr>
				<td>File</td>
				<td>
				<c:forEach var="uploadFile" items="${uploadFileList}">
               	 <a href="../upload/${uploadFile.file_name}">${uploadFile.o_name}</a> &nbsp;&nbsp;
               	 </c:forEach>
				</td>
			</tr>
			
		</c:forEach>	
	</table>