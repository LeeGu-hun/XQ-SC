<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<title>Audit Report</title>
</head>


<style>
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	height: 600px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}
</style>

<link rel="stylesheet" type="text/css" href="/css/style.css?ver=2">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>


<script>
	function search() {
		var params = $('#formSearch').serialize();
		$.ajax({
			type : "POST",
			url : "./auditSearch",
			data : params,
			success : result,
		});
	}

	function result(auditBeans) {
		$("#listBox").html(auditBeans);
	}
</script>

<body>

	<%@ include file="/include/header.jsp"%><br>
	<div>&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-15">
				<div class="panel panel-default">
					<div class="panel-heading">Audit Result Input</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<p>
						<div class="container" style="font-family: Tahomsa;"
							align="center">
							<form action="./auditSearch" method="post" name="formSearch"
								id="formSearch">
								<table style="align-content: center;" class="table table-hover">
									<tr>
										<td>
										<label>Date: </label>
												<input id="from" name="from" type="date"
													style="height: 30px" /> ~ <input id="to" name="to"
													type="date" style="height: 30px" />
										</td>
										<td>
										<input type="text" class="form-control"
													style="height: 30px; width: 140px" id="vSearch"
													name="vSearch" placeholder="Vendor Search...">
										</td>
										<td>
										<input type="button" value="Search"
											class="btn btn-default" style="height: 30px"
											onclick="search()">
										</td>
									</tr>
								</table>
							</form>
							<div id="listBox" class="table-responsive"
								style="max-height: 600px">
								<table></table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
</body>
</html>