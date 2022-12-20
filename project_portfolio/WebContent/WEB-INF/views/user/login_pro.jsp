<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url var="path1" value="/"/>
<c:url var="path2" value="User_Login_view"/>

<c:choose>
	<c:when test="${member != null}">
		<script>
			alert('로그인되었습니다')
			location.href = '${path1}'
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('로그인에 실패하였습니다 다시 입력해 주세요')
			location.href = '${path2}'
		</script>
	</c:otherwise>
</c:choose>

