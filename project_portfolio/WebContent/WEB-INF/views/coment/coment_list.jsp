<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- 줄바꿈 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", ","); %>

<!-- 댓글모양 물풍선 형태로 css -->
<link href="<c:url value="/css/coment.css"/>" rel="stylesheet" />


<div style="text-align: center;">
	<c:forEach items="${ComentList }" var="comentList">
		<ul class="coment_list" style="list-style: none; width: 200px; height: auto;">
			<li>${comentList.coment_user}</li>
			<li>${comentList.remote_addr}</li>
			<!-- \n입력하면 엔터가 되는데 특수문자나 영문자는 줄바꿈이 안됨 문자 적당히 입력하고 스페이스바(공백) 입력해야 줄바꿈됨 -->
			<li>${fn:replace(comentList.coment_content, replaceChar, "<br/>")}</li>
			<!-- parseDate로 데이터를 불러와서 formatDate로 내가 원하는 형태로 바꿔서 보이게 해준다. -->
			<li>
				<fmt:parseDate value="${comentList.coment_date}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.SSS" /> 
				<fmt:formatDate value="${dateValue}" pattern="yy.MM.dd" />
			</li>
		</ul>

	</c:forEach>
</div>

