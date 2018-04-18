<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<label>DEPART</label>
<input id = "mda" type = "radio" name="mDepart" value="ALL" onclick="ckdepart('ALL')"
<c:out value="${map.mDepart == 'ALL'?'checked':''}"/>	/>
<label for = "mda">ALL</label>
<input id = "admin" type = "radio" name="mDepart" value="ADMIN" onclick="ckdepart('ADMIN')"
<c:out value="${map.mDepart == 'ADMIN'?'checked':''}"/>	/>
<label for = "admin">ADMIN</label>
<input id = "purchase" type = "radio" name="mDepart" value="PURCHASE" onclick="ckdepart('PURCHASE')"
<c:out value="${map.mDepart == 'PURCHASE'?'checked':''}"/>	/>
<label for = "purchase">PURCHASE</label>
<input id = "quality" type = "radio" name="mDepart" value="QUALITY" onclick="ckdepart('QUALITY')" 
<c:out value="${map.mDepart == 'QUALITY'?'checked':''}"/>	/>
<label for = "quality">QUALITY</label>
<input id = "vendor" type = "radio" name="mDepart" value="VENDOR" onclick="ckdepart('VENDOR')"
<c:out value="${map.mDepart == 'VENDOR'?'checked':''}"/>	/>
<label for = "vendor">VENDOR</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<label>VALID</label>
<input id = "alv" type = "radio" name="mValid" value="A" onclick="ckvalid('A')"
<c:out value="${map.mValid == 'A'?'checked':''}"/>	/>
<label for = "alv">ALL</label>
<input id = "valid" type = "radio" name="mValid" value="Y"  onclick="ckvalid('Y')"
<c:out value="${map.mValid == 'Y'?'checked':''}"/>	/>
<label for = "valid">VALID</label>
<input id = "invalid" type = "radio" name="mValid" value="N" onclick="ckvalid('N')"
<c:out value="${map.mValid == 'N'?'checked':''}"/>	 />
<label for = "invalid">INVALID</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>