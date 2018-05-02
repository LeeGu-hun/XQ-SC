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
<title>Audit Result</title>
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

<script type="text/javascript">

function searchVendorId() {
var params = $('#formSearch').serialize();
	$.ajax({
		type : "POST",
		url : "./audit/resultSearch",
		data : params,
		success : result,
	});
}

function result(msg) {
	$("#vendorList").html(msg);
}


</script>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">

<body>
	<%@ include file="/include/header.jsp"%><br>
	<div>&nbsp;</div>
	<div class="container" style="width: 1400px">
		<div class="row">
			<div class="col-lg-15">
				<div class="panel panel-default">
					<div class="panel-heading">Audit Status</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<p>
						<div class="container" style="font-family: Tahomsa;">
		<form action="./audit/resultSearch" method="POST" name="formSearch"
									id="formSearch">
			
			<table style="align-content: center; width: 1200px">
				<tr align="center">
				<td>
				<input type="radio" id="plandate" name="plandate" value="all"> 
				<label>All</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<input type="radio" id="plandate" name="plandate" value="incomplete" checked="checked"> 
				<label>Incomplete</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<input type="radio" id="plandate" name="plandate" value="passed" > 
				<label>Passed</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<input type="radio" id="plandate" name="plandate" value="notPassed" > 
				<label>Failed</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<input type="radio" id="plandate" name="plandate" value="notPlanVendor" > 
				<label>Not Planed</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<label>Plan Date :</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="from" name="from" type="date" style="height: 30px" placeholder="avc"/> 
				~ 
				<input id="to" name="to" type="date" style="height: 30px" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
				<input type="text" id="vSearch" name="vSearch" placeholder="Vendor Search..."
				style="height: 30px ; width: 140px" class="form-control">
				</td>
				<td>
				<input type="button" value="Search" class="btn btn-default" 
				style="height: 30px;" onclick="searchVendorId()">
				</td>
				</tr>
			</table>
		
		</form>
		<br> <br>
		
		</form>
		
		<div id="vendorList" class="table-responsive" style="max-height:600px"></div>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	

</body>
</html>