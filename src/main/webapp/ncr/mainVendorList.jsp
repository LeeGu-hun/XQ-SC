<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Vendor to registed</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive" style="max-height: 600px">
					<table class="table table-hover">
						<thead>
							<tr align="center" valign="middle">
								<th>회사ID</th>
								<th>회사회사명</th>
								<th>품목ID</th>
								<th>회사영업담당자이름</th>
								<th>영업담당자연락처</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="li" items="${list}">
								<tr align="center" valign="middle" bordercolor="#333333">
									<td>${li.VENDOR_ID}</td>
									<input type="hidden" id="VENDOR_ID" name="VENDOR_ID"
										value="${li.VENDOR_ID}"/ >
									<td>${li.VENDOR_NAME}</td>
									<input type="hidden" id="VENDOR_NAME" name="VENDOR_NAME"
										value="${li.VENDOR_NAME}"/ >
									<td>${li.PRODUCT_NAME}</td>
									<td>${li.VENDOR_S_NAME}</td>
									<input type="hidden" id="VENDOR_S_NAME" name="VENDOR_S_NAME"
										value="${li.VENDOR_S_NAME}"/ >
									<td>${li.VENDOR_S_TEL}</td>
									<input type="hidden" id="VENDOR_S_TEL" name="VENDOR_S_TEL"
										value="${li.VENDOR_S_TEL}"/ >
									<input type="hidden" id="VENDOR_S_EMAIL" name="VENDOR_S_EMAIL"
										value="${li.VENDOR_S_EMAIL}"/ >

								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>
</div>
