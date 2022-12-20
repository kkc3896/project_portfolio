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

<!-- 제이쿼리 최신으로 사용하는 코드 -->  
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- js폴더 분리
<script src="<c:url value="/js/script.js"/>"></script>-->

<style>
	/* 섹션 크기 */
	.bg-light{
		height: 1053px;
		padding-top:55px;
		padding-bottom:75px;
	}
	.flex-fill.mx-xl-5.mb-2{
		margin: 0 auto;
		width : 700px;
		padding-right: 7rem;
		padding-left: 7rem;
	}
    /* 입력창 */ 
	.container.py-4{
		margin: 0 auto;
		width : 503px;
	}
	/* 가입하기 */
	.d-grid.gap-2{
		padding-top: 30px;
	}
    /* 생년월일 */
	.bir_yy,.bir_mm,.bir_dd{
		width:160px;
		display:table-cell;
	}
	.bir_mm+.bir_dd, .bir_yy+.bir_mm{
		padding-left:10px;
	}
</style>
<script>
	function user_Delete(){
		alert("아이디가 삭제되었습니다.");
	}	
	
</script>
</head>
<body>
<!-- 부트스트랩(bootstrap_header)헤더 -->
<c:import url="/WEB-INF/views/header/header.jsp" />
<br/>

<!-- 회원정보수정 -->
	<main class="container">
		<section class="bg-light">
			<div class="container py-4">
				<div class="row align-items-center justify-content-between">
					<a class="navbar-brand h1 text-center"> 
						<span class="text-primary h4">회원정보</span>
						<span class="text-primary h4">수정</span>
					</a>
				</div>
				<c:url var="path" value="Join_Update_Pro"/>
				<form method="post" action="${path}">
					<div class="form-group">
						<input type="hidden" class="form-control" name="user_idx" value='${member.user_idx}'>
					</div>
					<div class="form-group">
						<label for="user_id" class="form-label mt-4">아이디</label>
						<input type="text" class="form-control" name="user_id" value='${member.user_id}' readonly="readonly">
					</div>
					<div class="form-group has-success">
						<label class="form-label mt-4" for="user_pw">비밀번호</label>
						<input type="password" class="form-control" id="user_pw" name="user_pw" pattern="^[0-9]*$" title="숫자만 입력 가능합니다." required="required">
					</div>

					<div class="form-group has-danger">
						<label class="form-label mt-4" for="user_pw_check">비밀번호 확인</label>
						<input type="password" class="form-control" id="user_pw_check" name="user_pw_check" pattern="^[0-9]*$" title="숫자만 입력 가능합니다." required="required">
					</div>
					<span class="pw_no" style="display: none; color: red;">비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</span> 
					<span class="pw_ok" style="display: none; color: blue;">비밀번호가 일치합니다.</span>
					
					<div class="form-group">
						<label for="user_name" class="form-label mt-4">이름</label>
						<input type="text" class="form-control" name="user_name" value='${member.user_name}' readonly="readonly">
					</div>
					<div class="bir_wrap">
						<label class="form-label mt-4">생년월일</label>
						<div class="bir_yy">
							<span class="ps_box">
								<input type="text" class="form-control" placeholder="년(4자)" maxlength="4" name="user_birth_year" value='${member.user_birth_year}' readonly="readonly">
							</span>
						</div>
						<div class="bir_mm">
							<span class="ps_box focus">
								<select class="form-select" name="user_birth_month">
									<option>월</option>
									<option value="1" <c:if test="${member.user_birth_month eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${member.user_birth_month eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${member.user_birth_month eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${member.user_birth_month eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${member.user_birth_month eq '5'}">selected</c:if>>5</option>
									<option value="6" <c:if test="${member.user_birth_month eq '6'}">selected</c:if>>6</option>
									<option value="7" <c:if test="${member.user_birth_month eq '7'}">selected</c:if>>7</option>
									<option value="8" <c:if test="${member.user_birth_month eq '8'}">selected</c:if>>8</option>
									<option value="9" <c:if test="${member.user_birth_month eq '9'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${member.user_birth_month eq '10'}">selected</c:if>>10</option>
									<option value="11" <c:if test="${member.user_birth_month eq '11'}">selected</c:if>>11</option>
									<option value="12" <c:if test="${member.user_birth_month eq '12'}">selected</c:if>>12</option>
								</select>
							</span>
						</div>
						<div class="bir_dd">
							<span class="ps_box">
								<input type="text" class="form-control" placeholder="일" maxlength="2" name="user_birth_day" value='${member.user_birth_day}' readonly="readonly">
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="user_gender" class="form-label mt-4">성별</label> 
						<select class="form-select" name="user_gender" disabled="disabled">
							<option>남자</option>
							<option>여자</option>
						</select>
					</div>
					<div class="form-group">
						<label for="user_email" class="form-label mt-4">본인 확인 이메일</label>
						<input type="email" class="form-control" name="user_email" placeholder="선택입력" value='${member.user_email}' readonly="readonly">
					</div>
					<br/>
					<div class="form-group">
						<button class="btn btn-outline-primary me-2" id ="button1" type="submit" onclick="update_check()">수정하기</button>
						<button class="btn btn-outline-warning me-2" type="button" onclick="history.back(-1)">뒤로가기</button>
						<button class="btn btn-outline-danger me-2" type="submit" onclick="user_Delete()" formaction="user_Delete" formmethod="get">탈퇴하기</button>
					</div>
				</form>
			</div>
		</section>
	</main>

	<!-- 부트스트랩(bootstrap_footer)푸터 -->  
<c:import url="/WEB-INF/views/footer/footer.jsp"/>

<script>
//비밀번호 일치하는지 확인
$('#user_pw_check').blur(function() {
		if($('#user_pw').val() != '' || $('#user_pw_check').val() != ''){
			if($('#user_pw').val() == $('#user_pw_check').val()){
				$('.pw_ok').show();
				$('.pw_no').hide();
				$('#user_name').focus();
			}
			else{
				$('.pw_no').show();
				$('.pw_ok').hide();
				//$('#user_pw_check').focus();
			}
		}
})
</script>

</body>
</html>