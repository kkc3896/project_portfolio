<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- 댓글 작성-->

<c:url var="path" value="comentWrite" />
<form method="post" action="${path}">
	<div class="form-group">
		<input type="hidden" class="form-control" value='${coment_bno}' />
		<input type="hidden" class="form-control" value='${coment_date}' />
		<input type="hidden" class="form-control" value='${remote_addr}' />
	</div>
	<div class="form-group">
		<label for="coment_content"></label>
		<input type="text" class="form-control" name="coment_content" required="required" style="width:30%; float:left;"/>
		<button type="submit" class="btn btn-outline-primary me-2">등록</button>
	</div>
	<div class="form-group">글자가 잘려보이면 ","를 중간에 입력하면 줄바꿈이 되니 참고해 주세요</div>
</form>
<hr/>
