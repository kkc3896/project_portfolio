<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- search start -->
<div class="row">

	<div class="col-2">
		<select class="form-control form-control-sm" name="searchType" id="searchType">
			<!-- 아래의 c:if코드는 검색이후에 분류된 값을 유지하기위해 작성한 것이다. -->
			<option value="job_name" <c:if test="${searchBean.searchType eq 'job_name'}">selected</c:if>>회사명</option>
			<option value="job_place" <c:if test="${searchBean.searchType eq 'job_place'}">selected</c:if>>회사위치</option>
		</select>
	</div>

	<div class="col-8">
		<%--
		<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" value="${searchBean.keyword}">
		 --%>
		<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" value="${pagination.keyword}">
	</div>

	<div class="col">
		<button class="btn btn-outline-primary me-2" name="btnSearch" id="btnSearch">검색</button>
	</div>

</div>
<!-- search end -->

<script>
	// 검색
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "Job_List";
		url += "?searchType=" + $('#searchType').val();
		url += "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);

	});
</script>