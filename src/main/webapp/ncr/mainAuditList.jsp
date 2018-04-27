<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Audit to be planed</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive" style="max-height: 300px">
					<table class="table table-hover ">
						<thead>
							<tr>
								<th>No</th>
								<th>Vendor Name</th>
								<th>Audit ID</th>
								<th>Audit Type</th>
								<th>Product</th>
								<th>Vendor Address</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach var="audit" items="${listBean}" varStatus="status">

								<tr>
									<td>${audit.RNUM}</td>
									<td>${audit.VENDOR_NAME}</td>
									<td>${audit.AUDIT_ID}</td>

									<td><c:if test="${audit.AUDIT_NEXT_DATE == null }">
									New
									</c:if> <c:if test="${audit.AUDIT_NEXT_DATE !=null }">
									Regular
									</c:if></td>
									<td>${audit.PRODUCT_NAME }</td>									
									<td>${audit.VENDOR_ADDRESS}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="max-height: 250px">
			<div class="panel-heading">Audit to be performed</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive" style="max-height: 250px">

					<table class="table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>Audit ID</th>
								<th>Plan Date</th>
								<th>Vendor(ID)</th>
								<th>Category</th>
								<th>Product(ID)</th>
								<th>Audit Type</th>
								<th>Auditor(ID)</th>
								<th>Vendor Address</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${auditBeans}">

								<tr>
									<td>${a.RNUM}</td>
									<td>${a.AUDIT_ID}</td>
									<td>${a.AUDIT_PLAN_DATE}</td>
									<td>${a.VENDOR_NAME}(${a.VENDOR_ID})</td>
									<td>${a.CATEGORY_NAME}</td>
									<td>${a.PRODUCT_NAME}(${a.PRODUCT_ID})</td>
									<td>${a.AUDIT_KIND_ID}</td>
									<td>${a.MEMBER_NAME}(${a.MEMBER_ID})</td>
									<td>${a.VENDOR_ADDRESS}</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


