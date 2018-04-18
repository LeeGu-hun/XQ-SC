<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form id="vendorReplyForm" action="./ncrVendorReplySave/${ncr_id }" method="post" name="vendorReplyForm"  enctype="multipart/form-data">
<table class="table">
	<tr>
		<td>Vendor Reply</td>
	</tr>
	<tr>
		<td>Reply From </td>
		<td>${issuer_id }</td>
		<td>${issuer_name }</td>
		<td><input type="hidden" name="ncr_id"></td>
		
		
	</tr>
	<tr>
		<td>Comment</td>
		<td colspan="4"><input type="textarea" class="form-control col-sm-5" id="reply_description" name="reply_description">
	</td>	
	
	<tr>
	<td>file_upload</td>
	<td colspan = "5">	<input type="file" multiple id="reply_file" name="reply_file"></input></td>
	<td>
	<input class="button" type="button" value= "Save" id="btnReplySave" onclick="vendorReplySave(${ncr_id })">
	</td>
	</tr>
	 			

</table>

</form>