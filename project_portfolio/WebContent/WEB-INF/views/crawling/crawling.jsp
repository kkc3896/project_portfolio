<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형제작시 이용-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>포트폴리오</title>

<!-- css폴더 분리
<link href="<c:url value="/css/style.css"/>" rel="stylesheet"/>-->

<!-- 부트스트랩 - css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 - js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:url var="path" value="/css/headers.css" />
<link href="${path}" rel="stylesheet">

<!-- 제이쿼리 최신으로 사용하는 코드 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- js폴더 분리
<script src="<c:url value="/js/script.js"/>"></script>-->
</head>
<body>
	<!-- 부트스트랩(bootstrap_header)헤더 -->
	<c:import url="/WEB-INF/views/header/header.jsp"/>
	<br />
	
	<main class="container">		
		<h3>웹크롤링 - 구직사이트</h3>
		<p>특정 구직사이트에서 지역, 분야를 가져오자</p>
		<button type="button">크롤링</button>
		<table class="table">
			<thead>
				<tr>
					<th>지역</th>
					<th>지원분야</th>
					<th>지원분야</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>회사이름이 홍길동이면 홍**처럼-db에는 온전히 이름이 보이는데 이곳에는 저런처리를 하기</td>
					<td>전북</td>
					<td>웹개발</td>
				</tr>
				<tr>
					<td>Bob</td>
					<td>4</td>
					<td>3</td>
				</tr>
				<tr>
					<td>Charlie</td>
					<td>7</td>
					<td>9</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>Totals</td>
					<td>21</td>
					<td>23</td>
				</tr>
			</tfoot>
		</table>
	</main>
	<!-- 부트스트랩(bootstrap_footer)푸터 -->
	<c:import url="/WEB-INF/views/footer/footer.jsp" />
</body>
</html>