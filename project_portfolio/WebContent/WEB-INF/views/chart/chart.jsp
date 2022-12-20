<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<!-- 부트스트랩(bootstrap_header)헤더 -->
	<c:import url="/WEB-INF/views/header/header.jsp"/>
	<br />
	
	<main class="container">		
		<h3>차트 - 공공데이터</h3>
		<p>전라북도 일자리 창출 현황을 공공데이터에서 받아와 보여준다</p>
		<hr/>
		
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>직접 일자리창출</th>
					<th>직업능력개발훈련</th>
					<th>고용서비스</th>
					<th>고용장려금</th>
					<th>창업지원</th>
					<th>기타</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>상용 일자리_계획</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>상용 일자리_실적</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>임시 일자리_계획</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>임시 일자리_실적</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		 
		 <!-- 차트 -->
		 서로다른 모양의 차트 모양을 선택하여 이부분에 작게? 구현하고,<br/>
		 클릭하면 새로운창에 큰 모양으로 나올 수 있게 해보자.
	</main>
	<!-- 부트스트랩(bootstrap_footer)푸터 -->
	<c:import url="/WEB-INF/views/footer/footer.jsp" />
