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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 - js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:url var="path" value="/css/headers.css"/>
<link href="${path}" rel="stylesheet">

<!-- 제이쿼리 최신으로 사용하는 코드 -->  
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- js폴더 분리
<script src="<c:url value="/js/script.js"/>"></script>-->
</head>
<body>
<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="header/header.jsp"/>
<br/>

<!-- 부트스트랩(bootstrap_main)메인 -->
<c:import url="main/main.jsp"/>

<!-- 부트스트랩(bootstrap_footer)푸터 -->  
<c:import url="footer/footer.jsp"/> 
</body>
</html>