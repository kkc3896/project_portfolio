<%-- jsp 기본화면 템플릿 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<main class="container">
	<div class="p-4 p-md-5 mb-4 rounded text-bg-dark">
		<div class="col-md-6 px-0">
			<h1 class="display-4">김권철 포트폴리오</h1>
			<p class="lead my-3">웹개발 파트 지원합니다</p>
			<p class="lead my-0">코드는 하단 우측에 외부 자료 GitHub를 참고해 주세요.</p>
			<!-- 
			<p class="lead mb-0">
				<a href="#" class="text-white fw-bold">이력서로 이동</a>
			</p>
			 -->
		</div>
	</div>

	<div class="row mb-2">
		<div class="col-md-6">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-success">크롤링</strong>
					<h3 class="mb-0">지니 실시간 차트 순위</h3>
					<div class="mb-1 text-muted"></div>
					<p class="mb-auto">java jsoup을 이용하여 음원사이트의 실시간차트 순위를 알아보자</p>
					<c:url var="path" value="crawling_view" /> 
					<a href="${path }" class="stretched-link">크롤링 페이지로 이동</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
					</svg>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">공공데이터</strong>
					<h3 class="mb-0">전주 공중화장실 위치</h3>
					<div class="mb-1 text-muted"></div>
					<p class="card-text mb-auto">공공데이터를 이용한 지도?나 동별로 화장실 개수를 차트로 그리기?</p>
					<a href="#" class="stretched-link">이동</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">비어 있습니다.</text>
					</svg>
				</div>
			</div>
		</div>
	</div>

	<div class="row g-5">
		<div class="col-md-8">

			<article class="blog-post">
				<h3>현재 진행사항</h3>
				<li>...</li>
                <br/><br/><br/>
				<h3>추가 및 개선 사항</h3>
				<li>게시판 파일 업로드 다운로드 기능이 로컬에서만 가능하니 개선 필요</li>
				<li>이미지파일은 경로를 db에 저장하고 불러오게 하는식이니 바이너리 형태로 변환해서 업로드, 다운로드 구현하기</li> 
				<li>공공데이터를 이용한 차트 그리기 혹은 지도상에 표시하기</li>
			</article>
			
			
		</div>

		<div class="col-md-4">
			<div class="position-sticky">
				<div class="p-4 mb-3 bg-light rounded">
					<h4 class="fst-italic">프로젝트 개발환경 및 구성</h4>
					<p class="mb-0">OS : Windows 10</p>
					<p class="mb-0">Language : JAVA 1.8</p>
					<p class="mb-0">DB : MySQL 5.7</p>
					<p class="mb-0">WAS : Apache Tomcat 9.0</p>
					<p class="mb-0">tool : Eclipse, HeidiSQL</p>
					<p class="mb-0">Framework : mybatis 3.5.5, spring 5.2.2</p>
				</div>

				<div class="p-4">
					<h4 class="fst-italic">외부자료</h4>
					<ol class="list-unstyled">
						<li>
							<a href="https://github.com/kkc3896/project_portfolio">GitHub</a>
						</li>
						<li>
							<a href="http://kkc3896.dothome.co.kr/html5up-phantom/">웹디자인</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>

</main>