<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 - js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- 제이쿼리 최신으로 사용하는 코드 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- js폴더 분리
<script src="<c:url value="/js/script.js"/>"></script>-->
</head>
<body>
	<!-- 부트스트랩(bootstrap_header)헤더 -->
	<c:import url="/WEB-INF/views/header/header.jsp" />
	<br />

	<!-- 로그인 -->
	<main class="container">
		<c:url var="path" value="User_Login_pro" />
		<form method="POST" action="${path}">
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<div>
						<div class="jumbotron" style="padding-top: 20px;">
							<h3 style="text-align: center;">로그인 화면</h3>

							<div class="form-group" style="padding-bottom: 10px;">
								<input type="text" class="form-control" placeholder="아이디" name="user_id" maxlength="20">
							</div>
							<div class="form-group" style="padding-bottom: 10px;">
								<input type="password" class="form-control" placeholder="비밀번호" name="user_pw" maxlength="20">
							</div>
							<button type="submit" class="btn btn-outline-dark me-2">로그인</button>

							<c:url var="path" value="User_Join_view" />
							<a href="${path }" class="btn btn-outline-warning">회원가입</a>
						</div>
					</div>
				</div>

				<div class="col"></div>
			</div>
		</form>
	</main>

	<!-- 부트스트랩(bootstrap_footer)푸터 -->
	<c:import url="/WEB-INF/views/footer/footer.jsp" />

</body>
</html>