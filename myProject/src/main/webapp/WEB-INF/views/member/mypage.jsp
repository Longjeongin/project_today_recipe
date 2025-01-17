<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>mypage</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- Contact Section-->
	<section class="page-section" id="contact" style="margin-top: 150px">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">mypage</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<c:if test="${sessionScope.login.profileImg == null}">
					<img src="${pageContext.request.contextPath}/assets/img/non.png"
						id="myImage" class="rounded-circle img-thumbnail shadow-sm"
						style="cursor: pointer; width: 200px; height: 200px; object-fit: cover;">
					</c:if>
					<c:if test="${sessionScope.login.profileImg != null}">
						<img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}"
						id="myImage" class="rounded-circle img-thumbnail shadow-sm"
						style="cursor: pointer; width: 200px; height: 200px; object-fit: cover;">
					</c:if>
					<form id="profileForm" enctype="multipart/form-data">
						<input type="file" name="uploadImage" id="uploadImage"
							accept="image/*" style="display: none;">
					</form>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<form method="post" action="<c:url value="/registDo" />">
						<div class="form-floating mb-3">
							<input type="hidden" name="memPw" value="${sessionScope.login.memPw}">
							<input class="form-control" name="memId" type="text" disabled
								value="${sessionScope.login.memId}" placeholder="아이디를 입력해주세요 "> <label>아이디</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="memNm" name="memNm" type="text" value="${sessionScope.login.memNm}"
								placeholder="이름을 입력해주세요 "> <label>이름</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="memEmail" name="memEmail" type="text" value="${sessionScope.login.memEmail}"
								placeholder="이름을 입력해주세요 "> <label>이메일</label>
						</div>
						<button id="changeProfile" class="btn btn-primary btn-xl" type="button">수정하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#myImage").click(function(){
				$("#uploadImage").click();
			});
			// 이미지 업로드
			$("#uploadImage").on("change", function(){
				let file = $(this)[0].files[0]
				if(file){
					let fileType = file['type'];
					let valTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
					if(!valTypes.includes(fileType)){
						alert("유효한 이미지 타입이 아닙니다.");
						$(this).val('');
					}else{
						// FromData HTML 폼 데이터를 쉽게 가져오도록하는
						// submit이 아닌 비동기로 폼 데이터를 전송하기 위해
						let formData = new FormData($("#profileForm")[0]);
						$.ajax({
							url : '<c:url value="/files/upload" />'
						  , type : 'POST'
						  , data : formData
						  , dataType : 'json'
						  , processData : false // formData 객체를 URL 인코딩하지 않고록
						  , contentType : false // 디폴트 전송인 application/x-www-form-urlencoded로 전송하지 않도록
						  						// 파일은 multipart/form-data 이진 데이터 형태로 전송
						  , success : function(res){
							  console.log(res);
							  if(res.message == 'success'){
								  $("#myImage").attr("src", "${pageContext.request.contextPath}" + res.imagePath);
							  }
						  }, error : function(e){
							  console.log(e)
						  }
						})
					}
				}
			});
 			$("#changeProfile").click(function(){
 				let memNewNm = $("#memNm").val()
				let memNewEmail = $("#memEmail").val()
				$.ajax({
		            type: "POST"
		            ,url: "/changeProfile"
		            ,contentType: "application/json"
		            ,data: JSON.stringify({
		                    "memNm": memNewNm,
		                    "memEmail": memNewEmail
		             })
		           	,success: function(response) {
		            	alert("정보가 수정되었습니다");
		            	location.reload();
		            },error : function(e){
		            	console.log(e)
		            }
 				})
				
 			})
		});
	</script>
</body>
</html>