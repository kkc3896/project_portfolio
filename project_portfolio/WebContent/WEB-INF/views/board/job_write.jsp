<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="/WEB-INF/views/header/header.jsp" />
<br />

<main class="container">
	<h3>게시판 - 구직활동내역</h3>
	<hr />

	<c:url var="path" value="Job_Write_pro" />
	<!-- 글 작성후 따로 확인페이지 없이 목록_리스트페이지로 넘어간다 -->
	<form method="post" action="${path}" encType="multipart/form-data">
		<!-- encType="multipart/form-data" 는 파일업로드를 위해 작성함  -->
		<div class="form-group">
			<input type="hidden" class="form-control" value='${job_idx }' />
		</div>
		<div class="form-group">
			<label for="job_name">제목</label>
			<!-- 
			<input type="text" class="form-control" name="job_name">  
			 -->
			<!-- 한글,숫자,영문만 입력가능 공백x 특수문자x       -->
			<input type="text" class="form-control" name="job_name" title="한글,숫자,영문자를 이용한 완성된 문자로 입력해주세요. 공백은 입력이 불가능합니다." pattern="^[가-힣a-zA-Z0-9]*$" required="required"/>  
		</div>
		<div class="form-group">
			<label for="job_content">내용1</label>
			<input type="text" class="form-control" name="job_content">
		</div>
		<div class="form-group">
			<label for="job_place">내용2</label>
			<input type="text" class="form-control" name="job_place">
		</div>
		<div class="form-group">
			<label for="job_field">내용3</label>
			<input type="text" class="form-control" name="job_field">
		</div>
		<div class="form-group">
			<label for="fileName">첨부파일</label>
			<input type="file" class="form-control" name=uploadFile multiple="multiple">
		</div>
		<br />
		<div class="form-group">
			<button type="submit" class="btn btn-outline-dark me-2">등록하기</button>
			<button type="button" class="btn btn-outline-warning me-2" onclick="history.back(-1)">뒤로가기</button>
		</div>
	</form>
	<br>

</main>
<!-- 부트스트랩(bootstrap_footer)푸터 -->
<c:import url="/WEB-INF/views/footer/footer.jsp" />
