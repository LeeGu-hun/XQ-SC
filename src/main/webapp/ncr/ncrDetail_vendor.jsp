<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<table class="table">
	<c:forEach var="b" items="${ncrBean}">

		<tr>
			<td>NCR No. : ${b.ncr_id}</td>
			<td>Audit No.: ${b.audit_id}</td>
			<td colspan="2">Vendor Name: ${b.vendor_name}</td>
		</tr>
		<tr>

			<td>Issuer :${b.issuer_name }</td>
			<td colspan="2">Kind of Audit:${b.audit_kind }</td>


		</tr>
		<tr>
			<td>Audit Result:${b.audit_result}</td>
			<td colspan="2">Grade:${b.ncr_grade_id }</td>
		</tr>

		<tr>
			<td>Subject</td>
			<td colspan="2">${b.ncr_title }</td>
		</tr>

		<tr>
			<td>Description</td>
			<td colspan="2"><textarea class="form-control col-sm-5" rows="5">${b.ncr_description }</textarea></td>
		</tr>

		<tr>
			<td>File</td>
			<td colspan="2"><c:forEach var="uploadFile"
					items="${uploadFileList}">
					<a href="./upload/${uploadFile.file_name}">${uploadFile.o_name}</a> &nbsp;&nbsp;
               	 </c:forEach></td>
		</tr>
</table>


<c:if test="${ncrReplyBean ne null}">
	<c:forEach var="r" items="${ncrReplyBean}">

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Reply from :${r.reply_from }</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">

								<tr>
									<td>Replier Name :${r.replier_name }</td>
									<td>Reply Date :${r.reply_date }</td>
								</tr>
								<tr>
									<td>Comment</td>
									<td><textarea class="form-control col-sm-5" rows="5">${r.reply_description }</textarea>
									</td>
								<tr>
									<td>File</td>
									<td colspan=> <c:forEach var="f"
										items="${uploadReplyFileList}">
										<c:if test="${r.reply_id == f.reply_id}">
											<a href="./upload2/${f.file_name}">${f.o_name}</a> &nbsp;&nbsp;
             		  	 </c:if>
									</c:forEach>
									</td>
									</td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>
</c:if>
<div id="vendorReplyPop"></div>
<div id="auditorReplyPop"></div>

<div class="modal-footer">

	<button type="button" class="btn btn-default"
		onclick="vendorReply_vendor(${b.ncr_id})">vendor reply</button>
	
	<button type="button" class="btn btn-default" data-dismiss="modal">close</button>

</div>
</c:forEach>
