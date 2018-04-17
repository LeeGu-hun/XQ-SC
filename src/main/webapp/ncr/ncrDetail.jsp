<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

</script>
	<table class="table"> 
		<c:forEach var="b" items="${ncrBean}">
			
			<tr>
				<td>NCR No.</td>
				<td>${b.ncr_id}</td>
				<td>Audit No.</td>
				<td>${b.audit_id}</td>
				<td>Vendor Name</td>
				<td>${b.vendor_name}</td>
			</tr>
			<tr>
				
				<td>Issuer</td>
				<td>${b.issuer_name }</td>
				<td>Kind of Audit</td>
				<td>${b.audit_kind }</td>
				
			</tr>
			<tr>
				<td>Audit Result</td>
				<td>${b.audit_result}</td>
				<td>Grade</td>
				<td>${b.ncr_grade_id }</td>				
			</tr>

			<tr>
				<td>Subject</td>
				<td colsapn="7">${b.ncr_title }</td>
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
			
	</table>
	
	<div id="vendorReplyPop"></div>
	
		<div class="modal-footer">
      	 <button type="button" class="btn btn-default"  onclick="vendorReply(${b.ncr_id})">vendor reply</button>
      	 <button type="button" class="btn btn-default">auditor reply</button>
      	 <button type="button" class="btn btn-default"  onclick="complete(${b.ncr_id})">complete</button>
         <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
         
      </div>
		</c:forEach>	
	