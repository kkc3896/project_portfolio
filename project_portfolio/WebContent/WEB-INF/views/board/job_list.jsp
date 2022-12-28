<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
	#hover_style:hover{
		color:red;
		
	}
</style>

<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="/WEB-INF/views/header/header.jsp" />
<br />

<main class="container">
	<h3>게시판</h3>
	<p>파일 업로드, 다운로드는 로컬에서만 가능</p>
	<hr/>

	<!-- 목록_리스트 -->
	<form action="Job_Write" method="get" name="form1">		<!-- 글쓰기 버튼을 누르면 글쓰기(입력화면)으로 넘어간다 액션에는 컨트롤러-입력매핑을 입력하자 -->
		<button type="submit" class="btn btn-outline-primary me-2">글쓰기</button>
		<br/><br/>
			
		<table class="table">
			<thead>
				<tr>
					<th class="col-md-1">번호</th>
					<th class="col-md-2">제목</th>
					<th class="col-md-1">내용1</th>
					<th class="col-md-4">내용2</th>
					<th class="col-md-1">내용3</th>
					<th class="col-md-1">작성일</th>
					<th class="col-md-1">조회수</th>
					<th class="col-md-1">첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Job_List}" var="job_List">
					<tr>
						<td>${job_List.job_idx}</td> 
						<!-- 회사명과 회사위치는 이름이 길어지면 레이아웃이 이상하게 변하므로 일정 글자수를 자르자 -->
						<td>
							<c:url var="path" value="Job_Read">
								<c:param name="job_idx" value='${job_List.job_idx }'/>
							</c:url>
							<a href="${path }" id="hover_style" style="text-decoration: none;">${job_List.getShortString_jobName(10)}</a>
						</td> 
						<td>${job_List.job_content}</td>
						<!-- 회사명과 회사위치는 이름이 길어지면 레이아웃이 이상하게 변하므로 일정 글자수를 자르자  -->
						<td>${job_List.getShortString_jobPlace(50)}</td>
						<td>${job_List.job_field}</td>
						<td>
							<!-- parseDate로 데이터를 불러와서 formatDate로 내가 원하는 형태로 바꿔서 보이게 해준다. -->
							<fmt:parseDate value="${job_List.job_date}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.SSS"/>
							<fmt:formatDate value="${dateValue}" pattern="yy.MM.dd"/>
						</td>
						<td>${job_List.job_count}</td>
						<%--
							파일이름이 길어지면 테이블모양이 흐트러져 이상하게 보여서 아래처럼 하였음
						 --%>
						 <c:choose>
						 	<c:when test="${job_List.fileName eq null}">
						 		<td>X</td>	
						 	</c:when>
						 	<c:otherwise>
						 		<td>O</td>	
						 	</c:otherwise>
						 </c:choose>
					</tr>
				</c:forEach>
			</tbody>
			
			
		</table>
		
	</form>
	
	<!-- 페이지네이션 -->
	<c:import url="/WEB-INF/views/paging/pagenation.jsp" /> 	

	<!-- 검색 -->
	<c:import url="/WEB-INF/views/search/search.jsp"/>

</main>

<!-- 부트스트랩(bootstrap_footer)푸터 -->
<c:import url="/WEB-INF/views/footer/footer.jsp" />
