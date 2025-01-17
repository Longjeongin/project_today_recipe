<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!--회원가입 -->
	<!-- Contact Section-->
    <section class="page-section" style="margin-top:100px" id="contact">
        <div class="container">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
            <!-- Contact Section Form-->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <form id="" action="/registDo" method="post">
                        <!-- Id input-->
                        <div class="form-floating mb-3 mt-5">
                            <input class="form-control" id="id" name="memId" type="text" placeholder="아이디를 입력하세요..."/>
                            <label for="id">아이디</label>
                        </div>
                        <!-- Pw  input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="password" name="memPw" type="password" placeholder="비밀번호를 입력하세요..."  />
                            <label for="password">비밀번호</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="password-check" name="memPwCheck" type="password" placeholder="비밀번호를 입력하세요..."  />
                            <label for="password-check">비밀번호 확인</label>
                        </div>
           
                        <!-- Nm input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="name" name="memNm" type="text" placeholder="이름을 입력하세요..."  />
                            <label for="name">이름</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="memEmail" type="email" placeholder="이름을 입력하세요..."  />
                            <label for="email">이메일</label>
                        </div>
                        
                        <button class="btn btn-primary btn-xl mt-5" id="submitButton" type="submit">가입하기</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<!--회원가입 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>