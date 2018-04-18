<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

function searchAudit(){
	var vendorName = document.getElementById("vendorName").value;
	$.ajax({
		type : "POST",
		url : "./searchAudit",
		data : "vendorName="+ vendorName,
		success : result,
	});
}
 
function result(msg){
	$("#auditListbody").html(msg);
}


function rowselect(audit_id,vendor_name,audit_comp_date,audit_kind,audit_result,member_name){
	$("#audit_id").val(audit_id);
	$("#vendor_name").val(vendor_name);
	$("#audit_date").val(audit_comp_date);
	$("#audit_kind").val(audit_kind);
	$("#audit_result").val(audit_result);
	$("#auditor_name").val(member_name);
	$('#layerpop').modal('hide');
   
} 

function ncrIssue(){
	  formNcrIssue.submit();	
}



</script>
<title>NCR Register</title>
</head>
<body>
<div id=mainBox class="container">
	<div>
<<<<<<< HEAD
=======
		<form  action="./ncrIssue" method="post" name="formNcrIssue" enctype="multipart/form-data">
>>>>>>> refs/remotes/origin/master
		<table class="table"> 
			<tr>
				<td>Audit No.</td>
<<<<<<< HEAD
				<td><input type="text" id="audit_id"/>
					<image src="${pageContext.request.contextPath}/images/icon_search.gif" data-target="#layerpop" data-toggle="modal" onclick="searchAudit()"></image></td>
=======
				<td><input type="text" id="audit_id" name="audit_id"/>
					<image src="${pageContext.request.contextPath}/images/icon_search.gif" data-target="#layerpop" data-toggle="modal" ></image></td>
>>>>>>> refs/remotes/origin/master
				<td>Vendor Name</td>
<<<<<<< HEAD
				<td><input type="text" id="vendor_name" readonly></td>
=======
				<td><input type="text" id="vendor_name"  name="vendor_name" readonly></td>
>>>>>>> refs/remotes/origin/master
				<td>Audit date</td>
<<<<<<< HEAD
				<td><input type="text" id="audit_date" maxlength="5" readonly></td>
=======
				<td><input type="text" id="audit_date"  name="audit_date" readonly></td>
>>>>>>> refs/remotes/origin/master
			<tr>
			<tr>
				<td>Kind of Audit</td>
				<td><input type="text" id="audit_kind" readonly></td>
				<td>Audit Result</td>
				<td><input type="text"  id="audit_result" readonly></td>
				<td>Auditor</td>
				<td><input type="text"  id="auditor_name" readonly></td>
			<tr>		
	
	
<<<<<<< HEAD
	
		<form  action="./ncrIssue" method="post" name="formNcrIssue" enctype="multipart/form-data">
		<input type="hidden" id="audit_id"  name="audit_id"/ >
		
		
				<tr>
					<td>Subject</td>
					<td ><input type="text" name="ncr_title"></td>
					<td>Issuer</td>
					<td><input type="text" value="${issuer_name }" ></td>
					<td>Grade</td>
					<td><select id="ncr_grade_id" name="ncr_grade_id">
							<option value="N">N</option>
							<option value="M">M</option>
						</select></td>
				</tr>
				<tr>
					<td>Description</td>
					<td colspan = "7">
					<textarea style="width :100%; height:500px;" id="ncr_description" name="ncr_description"></textarea>
					</td>
				</tr>
				<tr>
					<td>file_upload</td>
					<td colspan = "5">
						<input type="file" multiple id="ncr_file" name="ncr_file"></input></td>
					<td><input type="button" value="Issue" onclick="ncrIssue()"></td>
					</table>
		</form>
	</div>
	
 
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Audit Search</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
    <div >
	<form id="formSearchAudit" name="formSearchAudit" method="post" >
	<table class="table"> 
			<tr>
				<td>Vendor Name: <input type="text" name="vendorName" id="vendorName"/></td>
				<td> <input class="button" type="button" value= "Search" id="btnsearch" onclick="searchAudit()"></td>
			</tr>	
			
	</table>
	</form>
</div>
<div id= "auditListbody">
	
</div>	
      </div>
      <!-- Footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
      </div>
    </div>
  </div>
</div>
=======
>>>>>>> refs/remotes/origin/master

				<tr>
					<td>Subject</td>
					<td ><input type="text" name="ncr_title"></td>
					<td>Issuer</td>
					<td><input type="text" value="${issuer_name }" ></td>
					<td>Grade</td>
					<td><select id="ncr_grade_id" name="ncr_grade_id">
							<option value="N">N</option>
							<option value="M">M</option>
						</select></td>
				</tr>
				<tr>
					<td>Description</td>
					<td colspan = "7">
					<textarea style="width :100%; height:500px;" id="ncr_description" name="ncr_description"></textarea>
					</td>
				</tr>
				<tr>
					<td>file_upload</td>
					<td colspan = "5">
						<input type="file" multiple id="ncr_file" name="ncr_file"></input></td>
					<td><input type="button" value="Issue" onclick="ncrIssue()"></td>
					</table>
		</form>
	</div>
	
<!--  모달 시작 --> 

<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Audit Search</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
    <div >
	<form id="formSearchAudit" name="formSearchAudit" method="post" >
	<table class="table"> 
			<tr>
				<td>Vendor Name: <input type="text" name="vendorName" id="vendorName"/></td>
				<td> <input class="button" type="button" value= "Search" id="btnsearch" onclick="searchAudit()"></td>
			</tr>	
			
	</table>
	</form>
</div>
<div id= "auditListbody">
	
</div>	
      </div>
      <!-- Footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
      </div>
    </div>
  </div>
</div>

<!--  모달 끝 --> 

</div>
</body>
</html>