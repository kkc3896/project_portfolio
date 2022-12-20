<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url var="path1" value="/"/>
<c:url var="path2" value="User_Join_view"/>

<c:choose>
	<c:when test="${userBean != null}">
		<script>
			alert('회원가입을 축하드립니다. 로그인해 주세요')
			location.href = '${path1}'
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('회원가입에 실패하였습니다 다시 입력해 주세요')
			location.href = '${path2}'
		</script>
	</c:otherwise>
</c:choose>

