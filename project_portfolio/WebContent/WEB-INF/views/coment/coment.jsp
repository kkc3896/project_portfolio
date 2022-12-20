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
	<div style="text-align: center;">
		<h3>지금은 메모장처럼 사용 추후 - 회원/비회원 작성시 이름까지 보이게 하자.</h3>
		<br/>
	</div>
	<hr/>
	
	<!-- 댓글 작성 -->
	<c:import url="/WEB-INF/views/coment/coment_write.jsp"/>
	
	<!-- 댓글 목록 -->
	<c:import url="/WEB-INF/views/coment/coment_list.jsp"/>
	
</main>
 

<!-- 부트스트랩(bootstrap_footer)푸터 -->
<c:import url="/WEB-INF/views/footer/footer.jsp" />

<script>
	
</script>
