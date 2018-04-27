<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Auditor Reply</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<form id="auditorReplyForm" action="./ncrAuditorReplySave"
						method="post" name="auditorReplyForm"
						enctype="multipart/form-data">

						<table class="table">
							<tr>
								<td colspan="3">Reply From Vendor : ${issuer_name }</td>
								<input type="hidden" name="ncr_id" value=${ncr_id }>

							</tr>
							<tr>
								<td>Comment</td>
								<td><textarea class="form-control col-sm-5" rows="5"
										id="reply_description" name="reply_description"></textarea></td>
								<td style="vertical-align: bottom"><button type="button" class="btn btn-default" 
										id="btnReplySavea" onclick="auditorReplySave(${ncr_id })">Save</button></td>

							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>




