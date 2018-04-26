<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paginate">
	<button type="button" class="btn btn-link" onclick="list(${param.firstPageNo})">First</button>
	<button type="button" class="btn btn-link" onclick="list(${param.prevPageNo})">Previous</button>
	<span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}">
					<button type="button" class="btn btn-default" onclick="list(${i})">${i}</button>
                </c:when>
                <c:otherwise>
					<button type="button" class="btn btn-link" onclick="list(${i})">${i}</button>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
	<button type="button" class="btn btn-link" onclick="list(${param.nextPageNo})">Next</button>
	<button type="button" class="btn btn-link" onclick="list(${param.finalPageNo})">Last</button>
</div>
