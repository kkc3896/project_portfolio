# project_portfolio 
실제 호스팅서버 이용중인 url = http://kkc38966.cafe24.com/project_portfolio/  
로그인 필요시 아래를 참고  
아이디 : aaaa  /   비밀번호 : 1234  
12월 28일 크롤링 개발중.. 원하는 정보(실시간 차트 순위)는 db에 저장완료
화면에 불러오는 작업 중에 랭크(1위,2위...), 노래 제목은 정상적으로 불러와지는데 썸네일이 안보임

--------------------------------------------------------------------------------------------
코드 구성

java - /src/com/test/...  에 있다.

패키지는 기능별이 아닌 bean, controller, service, dao끼리 분리했다.
/com/test/util 은 게시판에서 제목부분이 길어지면 레이아웃이 흐트러지는걸 방지하기 위해 만들었다. 
일정 글자수 넘어가면 ...으로 표시됨

용어 간단한 설명
coment - 말풍선
crawling - 크롤링
job - 게시판(조회,수정,삭제,입력)
page - 페이징
search - 검색

jsp(view) -  /WebContent/WEB-INF/views
board - 게시판
chart - 자바스크립트로 차트그리기(미구현 상태)
coment - 말풍선 형태의 insert기능
crawling - 크롤링(개발중)
footer - 화면 하단부분 편의성을 위해 분리시켰다.
header - 화면 상단부분 편의성을 위해 분리시켰다.
main - 홈페이지 실행시 첫 화면
paging - 페이징
search - 검색 
user - 로그인,로그아웃,회원가입
