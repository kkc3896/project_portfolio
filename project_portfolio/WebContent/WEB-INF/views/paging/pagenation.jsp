<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- pagination start -->
<div id="paginationBox" class="pagination1">
	<ul class="pagination" style="justify-content: center;">

		<c:if test="${pagination.prev}">
			<li class="page-item">
			<%--
				<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.searchType}', '${search.keyword}')">이전 </a>
			 --%>
				<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${pagination.searchType}', '${pagination.keyword}')">이전 </a>
			</li>
		</c:if>

		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="testId">
			<li class="page-item <c:out value="${pagination.page == testId ? 'active' : ''}"/> ">
			<%--
				<a class="page-link" href="#" onClick="fn_pagination('${testId}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}', '${search.searchType}', '${search.keyword}')">${testId} </a>
			 --%>	
				<a class="page-link" href="#" onClick="fn_pagination('${testId}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}', '${pagination.searchType}', '${pagination.keyword}')">${testId} </a>
			</li>
		</c:forEach>

		<c:if test="${pagination.next}">
			<li class="page-item">
			<%--
				<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.searchType}', '${search.keyword}')">다음 </a>
			--%>	
				<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${pagination.searchType}', '${pagination.keyword}')">다음 </a>
			</li>
		</c:if>
	</ul>
</div>
<!-- pagination end -->


<script type="text/javascript">
	//이전 버튼 이벤트
	//5개의 인자값을 가지고 이동 testList.do
	//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "Job_List";
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&listSize=" + listSize;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, listSize, searchType,
			keyword) {
		var url = "Job_List";
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&listSize=" + listSize;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;

		location.href = url;
	}

	//다음 버튼 이벤트
	//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "Job_List";
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&listSize=" + listSize;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		location.href = url;
	}


</script>
