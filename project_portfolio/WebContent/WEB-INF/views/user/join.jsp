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

<style>
/* 섹션 크기 */
.bg-light {
	height: 1053px;
	padding-top: 55px;
	padding-bottom: 75px;
}

.flex-fill.mx-xl-5.mb-2 {
	margin: 0 auto;
	width: 700px;
	padding-right: 7rem;
	padding-left: 7rem;
}
/* 입력창 */
.container.py-4 {
	margin: 0 auto;
	width: 503px;
}
/* 가입하기 */
.d-grid.gap-2 {
	padding-top: 30px;
}
/* 생년월일 */
.bir_yy, .bir_mm, .bir_dd {
	width: 160px;
	display: table-cell;
}

.bir_mm+.bir_dd, .bir_yy+.bir_mm {
	padding-left: 10px;
}
</style>
</head>
<body>
	<!-- 부트스트랩(bootstrap_header)헤더 -->
	<c:import url="/WEB-INF/views/header/header.jsp" />
	<br />

	<!-- 회원가입 -->
	<main class="container">
		<section class="bg-light">
			<div class="container py-4">
				<div class="row align-items-center justify-content-between">
					<a class="navbar-brand h1 text-center"> <span class="text-primary h4">회원</span> <span class="text-primary h4">가입</span>
					</a>
				</div>
				<c:url var="path" value="User_Join_pro" />
				<form method="post" action='${path }'>
					<div class="form-group">
						<input type="hidden" class="form-control" value='${user_idx}'>
					</div>

					<div class="form-group">
						<label for="user_id" class="form-label mt-4">아이디</label>
						<div class="input-group">
							<input name="user_id" id="user_id" class="form-control" pattern="^[a-zA-Z0-9]*$" title="영문자,숫자만 가능합니다." required="required" />
						</div>
						<!-- 아이디중복확인 -->
						<button class="btn btn-outline-primary me-2" type="button" onclick="fn_id_Check()" style="margin-top: 5px;">중복확인</button>
						<span class="id_null" style="display: none; color: red;">아이디를 입력해 주세요.</span> <span class="id_ok" style="display: none; color: blue;">사용 가능한 아이디입니다.</span> <span class="id_no" style="display: none; color: red;">중복된 아이디 입니다. 다시 입력해 주세요.</span> <span class="id_chk" style="display: none; color: red;">아이디는 공백없이 영문자와 숫자만으로 이루어진 형태여야 합니다. 다시 입력해 주세요.</span>
					</div>

					<div class="form-group">
						<label class="form-label mt-4" for="user_pw">비밀번호</label>
						<input type="password" class="form-control" id="user_pw" name="user_pw" pattern="^[0-9]*$" title="숫자만 가능합니다." required="required" />
					</div>
					<div class="form-group">
						<label class="form-label mt-4" for="user_pw_check">비밀번호 확인</label>
						<input type="password" class="form-control" id="user_pw_check" name="user_pw_check" required="required" />
					</div>
					<span class="pw_no" style="display: none; color: red;">비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</span> 
					<span class="pw_ok" style="display: none; color: blue;">비밀번호가 일치합니다.</span>

					<div class="form-group">
						<label for="user_name" class="form-label mt-4">이름</label>
						<input type="text" class="form-control" id="user_name" name="user_name" pattern="^[가-힣]*$" title="이름은 한글만 가능합니다." required="required" />
					</div>

					<div class="bir_wrap">
						<label class="form-label mt-4">생년월일</label>
						<div class="bir_yy">
							<span class="ps_box"> <input type="text" class="form-control" placeholder="년(4자)" maxlength="4" name="user_birth_year" required="required" />
							</span>
						</div>
						<div class="bir_mm">
							<span class="ps_box focus"> <select class="form-select" name="user_birth_month" required="required">
									<option>월</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</span>
						</div>
						<div class="bir_dd">
							<span class="ps_box"> <input type="text" class="form-control" placeholder="일" maxlength="2" name="user_birth_day" required="required" />
							</span>
						</div>
					</div>

					<div class="form-group">
						<label for="user_gender" class="form-label mt-4">성별</label>
						<select class="form-select" name="user_gender" required="required">
							<option>남자</option>
							<option>여자</option>
						</select>
					</div>

					<div class="form-group">
						<label for="user_email" class="form-label mt-4">e-mail</label>
						<input type="email" class="form-control" name="user_email" placeholder="선택입력" />
					</div>

					<br />
					<div class="form-group">
						<button class="btn btn-outline-primary me-2" type="submit">가입하기</button>
						<button class="btn btn-outline-warning me-2" type="button" onclick="history.back(-1)">뒤로가기</button>
					</div>

				</form>
			</div>
		</section>
	</main>

	<!-- 부트스트랩(bootstrap_footer)푸터 -->
	<c:import url="/WEB-INF/views/footer/footer.jsp" />

	<script type="text/javascript">
		
		/* 아이디 중복확인 */
		function fn_id_Check() {
			// 입력한 아이디 값을 넘겨주기 위해
			var user_id = $("#user_id").val();
			// 유효성 검사 특수문자x, 공백x, 영문자와 숫자만 입력가능 
			var user_id_chk = /^[a-zA-Z0-9]*$/;
			
			// 공백입력
			if(user_id == null || user_id == ''){
				$('.id_null').css('display', 'inline-block');
        		$('.id_ok').css('display', 'none');
        		$('.id_no').css('display', 'none');
        		$('.id_chk').css('display', 'none');
        		$('#user_id').focus();
        		return false;
			} 
			// 유효성 검사 - 공백없이 영문자와 숫자만 입력가능
			if(!user_id_chk.test(user_id)){
				$('.id_null').css('display', 'none');
        		$('.id_ok').css('display', 'none');
        		$('.id_no').css('display', 'none');
        		$('.id_chk').css('display', 'inline-block');
        		$('#user_id').focus();
        		return false;
			}

			//아이디 중복확인 ajax
			$.ajax({
	            url:'id_Check', //Controller에서 요청 받을 주소
	            type:'post', //POST 방식으로 전달
	            data: {user_id : user_id},
	            dataType : "text",
	            success:function(idCheck){
	            	if(idCheck == 1){
	            		$('.id_null').css('display', 'none');
	            		$('.id_ok').css('display', 'none');
	            		$('.id_no').css('display', 'inline-block');
	            		$('.id_chk').css('display', 'none');
	            		$('#user_id').focus();
	            	}else{
	            		$('.id_null').css('display', 'none');
	            		$('.id_ok').css('display', 'inline-block');
	            		$('.id_no').css('display', 'none');
	            		$('.id_chk').css('display', 'none');
	            		$('#user_id').attr('readonly', true);
	            	}
	            }
	        });
		};
		
		// 비밀번호 일치하는지 확인
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