<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
	#hover_style:hover{
		color:red;
		
	}
</style>

<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="/WEB-INF/views/header/header.jsp" />
<br />

<main class="container">
	<h3>게시판 - 구직활동내역</h3>
	<hr/>
	<form>
		<div class="form-group">
			<label for="job_name">글번호</label> <input type="text"
				class="form-control" name="job_idx" value='${Job_Read.job_idx }'
				readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="job_name">회사명</label> <input type="text"
				class="form-control" name="job_name" value='${Job_Read.job_name }'
				readonly="readonly">
		</div>
		<div class="form-group">
			<label>내용</label> 
			<input type="text" class="form-control"	name="job_content" value='${Job_Read.job_content }'	readonly="readonly">
		</div>
		<div class="form-group">
			<label>회사위치</label> 
			<input type="text" class="form-control" name="job_place" value='${Job_Read.job_place }' readonly="readonly">
		</div>
		<div class="form-group">
			<label>지원분야</label> 
			<input type="text" class="form-control" name="job_field" value='${Job_Read.job_field }' readonly="readonly">
		</div>
		<div class="form-group">
			<label>지원날짜</label> 
			<input type="text" class="form-control" name="job_date" value='${Job_Read.job_date }' readonly="readonly">
		</div>
		<div class="form-group">
			<label>조회수</label> 
			<input type="text" class="form-control"  name="job_count" value='${Job_Read.job_count }' readonly="readonly">
		</div>
		<div class="form-group">
			<label>첨부파일</label>
			<c:url var="path" value="fileDownload?fileName=${Job_Read.fileName}" />
			<a href="${path }" style="text-decoration: none;"> 
				<input type="text" name="fileName" value="${Job_Read.fileName}" class="form-control" readonly="readonly" id="hover_style">
			</a>
			 <%--
			<c:set var="fileName" value="${Job_Read.fileName}" />
			<c:out value="${fileName}" />
			<c:url var="path" value="fileDownload"/>
			<a href="${path }" style="text-decoration: none;"> 
				<input type="text" name="fileName" value="${Job_Read.fileName}" class="form-control" readonly="readonly" id="hover_style">
				<input type="text" name="fileName" value="<c:out value="${fileName}" />" class="form-control" readonly="readonly" id="hover_style">
			</a>
			--%>
		</div>
		<br />
		<div class="form-group">
			<button type="submit" formaction="Job_Update" formmethod="get" class="btn btn-outline-dark me-2">수정하기</button> 
			<button type="button" class="btn btn-outline-warning me-2" onclick="history.back(-1)">뒤로가기</button>
			<button type="submit" class="btn btn-outline-danger me-2" formaction="Job_Delete" formmethod="post" onclick="job_delete()">삭제하기</button>
		</div>
	</form>
</main>

<script type="text/javascript">
	var job_delete = (function(){
		alert('삭제되었습니다')
	})

</script>

<!-- 부트스트랩(bootstrap_footer)푸터 -->
<c:import url="/WEB-INF/views/footer/footer.jsp" />
