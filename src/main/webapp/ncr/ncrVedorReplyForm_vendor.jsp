<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Vendor Reply</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<form id="vendorReplyForm" action="./ncrVendorReplySave_vendor"
						method="post" name="vendorReplyForm" enctype="multipart/form-data">

						<table class="table">
							<tr>
								<td>Vendor Reply</td>
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
								<td>file_upload</td>
								<td colspan="5"><input type="file" multiple id="reply_file"
									name="reply_file"></input></td>
									<td><button type="button" class="btn btn-default"
										onclick="vendorReplySave_vendor(${ncr_id })">Save</button></td>
								
							</tr>


						</table>

					</form>

				</div>
			</div>
		</div>
	</div>
</div>
