
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script>
	function scoreCal() {
		total = 0;
		var scores = document.querySelectorAll('#score');
		for (var i = 0; i < scores.length; i++) {
			if (scores[i].value == "") {
				total = total + 0;
			} else if (scores[i].value > 20) {
				scores[i].value = 0;
				scores[i].focus();
			} else {
				total = total + parseInt(scores[i].value);
			}
		}
		document.getElementById('total').value = total;

	}

	function onlyNum() {
		var keycode = window.event.keyCode;
		if (keycode == 8 || (keycode >= 35 && keycode <= 40)
				|| (keycode >= 46 && keycode <= 57)
				|| (keycode >= 96 && keycode <= 105) || keycode == 110
				|| keycode == 190) {
			window.event.returnValue = true;
			scoreCal();
			return;
		} else {
			window.event.returnValue = false;
			return;
		}

	}
</script>


<table>
	<tr>
		<th nowrap>No</th>
		<th nowrap>Audit Description</th>
		<th nowrap>Audit</th>
		<th nowrap>Score</th>
	</tr>

	<c:forEach var="c" items="${checkList}">
		<tr>
			<td>
				<div>${c.RNUM}</div>
			</td>
			<td>
				<div>${c.CHECKLIST_DISCRIPTION}
					<input type="hidden" value="${c.CHECKLIST_DISCRIPTION}" />
				</div>
			</td>

			<td><input type="text" class='score' maxlength="2" name='score'
				id='score' onKeyUp="onlyNum();" onKeyPress="onlyNum();"
				onKeyDown="onlyNum();" name="AUDIT_SCORE"></td>
			<td><div>/${c.CHECKLIST_FULLSCORE}</div></td>
		</tr>
	</c:forEach>
	<tr>
		<td nowrap>총 합계: <input type='text' name='total' id='total'>

		</td>

	</tr>
</table>



<c:set var="sum" value="0" />

