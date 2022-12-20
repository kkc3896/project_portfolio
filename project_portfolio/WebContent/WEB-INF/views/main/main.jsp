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
			<h1 class="display-4 fst-italic">김권철 포트폴리오</h1>
			<p class="lead my-3">웹개발 파트 지원합니다</p>
			<p class="lead mb-0">
				<a href="#" class="text-white fw-bold">이력서로 이동</a>
			</p>
		</div>
	</div>

	<div class="row mb-2">
		<div class="col-md-6">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">공공데이터</strong>
					<h3 class="mb-0">전라북도 일자리 창출 현황을 차트로 표현</h3>
					<div class="mb-1 text-muted">10월 00일</div>
					<p class="card-text mb-auto">공공데이터를 이용한 자바스크립트(예시-ajax)차트</p>
					<a href="#" class="stretched-link">차트로 이동</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">차트그림 캡쳐해서 올리기</text></svg>

				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-success">크롤링</strong>
					<h3 class="mb-0">지역별 웹개발 구직내용</h3>
					<div class="mb-1 text-muted">10월 00일</div>
					<p class="mb-auto">java jsoup으로 HTML을 파싱하여 구직활동에 도움이 되어보자</p>
					<a href="#" class="stretched-link">크롤링 페이지로 이동</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">참고한사이트 포토샵 모아서 </text></svg>

				</div>
			</div>
		</div>
	</div>

	<div class="row g-5">
		<div class="col-md-8">

			<article class="blog-post">
				<h3>추가사항</h3>
				<p>추가하고 싶은 기능 및 세부적인 것들 작성</p>
				<p>무한 댓글 - 레이아웃은 메이플 어플과 같이 최신글이 위로 오고 아이디,내용,작성시간(형태는 정하기 작성시간을보이게할지 작성하고 몇분이 흘렀는지..) 참고</p>
				<p>관리자페이지만들어서 회원 및 비회원이 작성한 글을 볼 수 있게 하자 이 페이지는 관리자만 보이게...</p>
				<p>자바스크립트(공공데이터api) - 전라북도 일자리 현황 데이터 받아와서 차트로 보여주기 JSON+XML</p>
				<p>자바_웹크롤링 - 내가 이력서 제출한 사이트, 북마크해둔 사이트를 크롤링할 수 있는지 확인해보고 안되면 아래의 허용가능한 한도에서 크롤링을 하자</p>
				<p></p>
			</article>
			<!-- 페이지네이션 부분 나중에 변경해도됨 
			<nav class="blog-pagination" aria-label="Pagination">
				<a class="btn btn-outline-primary rounded-pill" href="#">이전</a> 
				<a class="btn btn-outline-secondary rounded-pill disabled" href="#">다음</a>
			</nav>
			-->
			
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