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
                        <div class="form-floating mb-3 mt-5" style="position: relative;">
						        <input class="form-control" id="id" name="memId" type="text" placeholder="" style="display: inline-block; width: calc(100% - 120px); vertical-align: middle;" required />
						        <button id="idCheck" class="btn btn-primary pt-2" type="button" style="display: inline-block; position: absolute; right: 0; bottom: 0; width: 100px;">중복 확인</button>				       
                            <label for="id">아이디</label>
                            <div class="invalid-feedback">
						      	사용중인 아이디입니다
						    </div>
                        </div>
                        <!-- Pw  input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="password" name="memPw" type="password" placeholder="비밀번호를 입력하세요..." required />
                            <label for="password">비밀번호</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="password-check" name="memPwCheck" type="password" placeholder="비밀번호를 입력하세요..." required />
                            <label for="password-check">비밀번호 확인</label>
                            <div class="invalid-feedback">
						      	비밀번호가 다릅니다
						    </div>
                        </div>
           
                        <!-- Nm input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="name" name="memNm" type="text" placeholder="이름을 입력하세요..." required />
                            <label for="name">이름</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="memEmail" type="text" placeholder="이름을 입력하세요..." required />
                            <label for="email">이메일</label>
                            <div class="invalid-feedback">
						      	이메일 형태가 아닙니다.
						    </div>
                        </div>
                        
                        <button class="btn btn-primary btn-xl mt-5" id="submitButton" type="submit">가입하기</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<!--회원가입 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	<script>
		$(document).ready(function(){
			let pw = $("#password");
			let pwck = $("#password-check");
			let eml = $("#email");
			$("#password").on("change", function(){
				if(pw.val() == pwck.val() && pw.val()!=""){
	                $('#password-check').removeClass('is-invalid');
	            }else if(pw.val()=="" && pwck.val()==""){
	            	$('#password-check').removeClass('is-invalid');
	            }else {
	            	$('#password-check').addClass('is-invalid');
	            }	
			});
			$("#password-check").on("change", function(){
				if(pw.val() == pwck.val() && pw.val()!=""){
	                $('#password-check').removeClass('is-invalid');
	            }else if(pw.val()=="" && pwck.val()==""){
	            	$('#password-check').removeClass('is-invalid');
	            }else {
	            	$('#password-check').addClass('is-invalid');
	            }	
			});
			$("#email").on("change", function(){
				if(eml.val().indexOf('@') != -1 && eml.val().length != eml.val().indexOf('@') + 1 && eml.val().match(/@/g).length == 1){
					$('#email').removeClass('is-invalid');
				}else if(eml.val() == ""){
					$('#email').removeClass('is-invalid');
				}else{
					$('#email').addClass('is-invalid');
				}
			});
			$("#idCheck").click(function(){
		        let inputId = $("#id").val();
		        if (inputId.trim() == "") {
		            alert("아이디를 입력해주세요.");
		            return;
		        }
		        $.ajax({
		            type: "POST",
		            url: "/idCheck",
		            data: { "memId": inputId },
		            success: function(response) {
		            	cnt = response['cnt'];
		                if (cnt == 1) {
		                    $("#id").addClass("is-invalid");
		                } else {
		                    alert("사용 가능한 아이디입니다.");
		                    $("#id").removeClass("is-invalid")
		                }
		            },error: function() {
		                alert("아이디 중복 확인 실패.");
		                return;
		            }
		        });
		    });	
			
			
		})
	
	</script>
</body>
</html>