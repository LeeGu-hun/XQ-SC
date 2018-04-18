<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="auditorReplyForm" action="./ncrAuditorReplySave" method="post"
	name="auditorReplyForm" enctype="multipart/form-data">

	<table class="table">
		<tr>
			<td>Auditor Reply</td>
		</tr>
		<tr>
			<td>Reply From</td>
			<td>${issuer_id }</td>
			<td>${issuer_name }</td>
			<input type="hidden" name="ncr_id" value=${ncr_id }>

		</tr>
		<tr>
			<td>Comment</td>
			<td colspan="4"><input type="textarea"
				class="form-control col-sm-5" id="reply_description"
				name="reply_description"></td>
		<tr>
			<td><input class="button" type="button" value="Save"
				id="btnReplySavea" onclick="auditorReplySave(${ncr_id })"></td>
	</table>

</form>