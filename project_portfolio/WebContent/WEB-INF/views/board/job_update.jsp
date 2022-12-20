<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="/WEB-INF/views/header/header.jsp" />
<br />

<main class="container">
	<h3>게시판 - 구직활동내역</h3>
	<hr/>
	
	<c:url var="path" value="Job_Update_pro"/>
	<form action="${path }" method="post" encType="multipart/form-data">
	  <div class="form-group">
	    <input type="hidden" class="form-control" name="job_idx" value='${Job_Update.job_idx}' readonly="readonly"/>
	  </div>
	  <div class="form-group">
	    <label for="job_name">회사명</label>
	    <!-- 한글,숫자,영문만 입력가능 공백x 특수문자x       -->
	    <input type="text" class="form-control" name="job_name" value='${Job_Update.job_name }' title="한글,숫자,영문자를 이용한 완성된 문자로 입력해주세요. 공백은 입력이 불가능합니다." pattern="^[가-힣a-zA-Z0-9]*$" required="required">
	  </div>
	   <div class="form-group">
	    <label for="job_content">내용</label>
	    <input type="text" class="form-control" name="job_content" value='${Job_Update.job_content }'>
	  </div>
	   <div class="form-group">
	    <label for="job_place">회사위치</label>
	    <input type="text" class="form-control" name="job_place" value='${Job_Update.job_place }'>
	  </div>
	   <div class="form-group">
	    <label for="job_field">지원분야</label>
	    <input type="text" class="form-control" name="job_field" value='${Job_Update.job_field }'>
	  </div>
	   <div class="form-group">
	    <label for="job_date">지원날짜</label>
	    <input type="hidden" class="form-control" name="job_date" value='${Job_Update.job_date }' readonly="readonly">
	  </div>
	   <div class="form-group">
	    <label>파일</label>
	    <input type="hidden" class="form-control" name="fileName" value='${Job_Update.fileName }'> 
	    <input type="file" class="form-control" name="uploadFile" value='${Job_Update.uploadFile }' readonly="readonly">
	  </div>
	  <br/>
	  <div class="form-group">
	  	<button type="submit" class="btn btn-outline-dark me-2">완료</button>
	  	<button type="button" class="btn btn-outline-warning me-2" onclick="history.back(-1)">뒤로가기</button>
	  	<button type="submit" class="btn btn-outline-danger me-2" formaction="Job_Delete" formmethod="post">삭제하기</button>
	  </div>
	</form>
	
</main>
<!-- 부트스트랩(bootstrap_footer)푸터 -->
<c:import url="/WEB-INF/views/footer/footer.jsp" />
