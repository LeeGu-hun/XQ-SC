<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" >
			<div class="panel-heading">Ncr to be closed</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive" style="max-height:600px">
				<table class="table table-hover ">
					<thead>
						<tr>
							<th>NCR No.</th>
							<th>Audit ID</th>
							<th>Vendor Name</th>
							<th>Subject</th>
							<th>Description</th>
							<th>Issuer Name</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${ncrImcompList}">
							<tr>
								<td>${i.ncr_id}</td>
								<td>${i.audit_id}</td>
								<td>${i.vendor_name}</td>
								<td>${i.ncr_title}</td>
								<td style="max-width:300px">${i.ncr_description}</td>
								<td>${i.issuer_name}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>

