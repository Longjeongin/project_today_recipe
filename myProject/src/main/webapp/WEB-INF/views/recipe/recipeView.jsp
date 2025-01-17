
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>${recipeVO.recipeName}</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<header class="masthead bg-light text-black">
		<div class="recipeDiv mx-auto" style="width: 1000px;">
			<div class="input-group mb-3">
				<img class="main_img"
					style="width: 500px; height: 500px; float: left;"
					src="${recipeVO.recipeImg}">
				<div class="recipe_ingr"
					style="width: 450px; float: left; margin-left: 50px;">
					<h2>${recipeVO.recipeName}</h2>
					<c:if test="${recipeVO.recipeDes == null}">
						<p>${recipeVO.recipeLevel}</p>
					</c:if>
					<c:if test="${recipeVO.recipeDes != null}">
						<p>${recipeVO.recipeLevel}&nbsp; &nbsp; ${recipeVO.recipeDes}</p>
					</c:if>
					<hr>
					<c:forEach items="${ingrType}" var="ingrType">
						<div class="mt-4" style="overflow: hidden; height: auto;">
							<div style="width: 225px; float: left;">
								<h5>${ingrType.ingrType}</h5>
							</div>
							<div style="width: 225px; float: right;">
								<c:forEach items="${recipeDetailVO}" var="detail">
									<c:if test="${detail.ingrType eq ingrType.ingrType}">
										<p>${detail.ingrName}&nbsp; ${detail.ingrEa}</p>
									</c:if>	
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
				<hr style="width:1000px; heigth:2px; border: 1px solid black; margin-top: 5px;">
				<div class="input-group mb-3">
					<h4 style="margin-top:10px; margin-bottom:20px;">조리과정</h4>
					<c:forEach items="${recipeStepVO}" var="step">
						<div style="width: 1000px;">
							<p style="width: 28px; float: left; margin-left: 2px; text-align: right;">${step.recipeStepNo} . &nbsp;</p>
							<p>&nbsp; ${step.recipeStep}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</header>



	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>