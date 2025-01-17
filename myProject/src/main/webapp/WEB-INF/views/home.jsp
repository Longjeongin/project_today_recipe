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
<title>개인프로젝트</title>
</head>
<body id="page-top">
	
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	
	<!-- Masthead-->
	<header class="masthead bg-light text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<div class="input-group mb-3" style="width:1280px;">
				<c:if test="${searchVO.searchType == 1}">
					<button type="button" class="btn btn-outline-secondary" id="searchTypeSelect" value="${searchVO.searchType}">이름</button>
				</c:if>
				<c:if test="${searchVO.searchType == 2}">
					<button type="button" class="btn btn-outline-secondary" id="searchTypeSelect" value="${searchVO.searchType}">재료</button>
				</c:if>
				
				<button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
					<span class="visually-hidden"></span>
				</button>
				<ul class="dropdown-menu">
				    <li><a class="dropdown-item" id="typeSet1" href="/?type=1">이름</a></li>
				    <li><a class="dropdown-item" id="typeSet2" href="/?type=2">재료</a></li>
				</ul>
			  	<c:if test="${searchVO.searchType == 1}">
				  	<c:if test="${searchVO.searchWordString == null || searchVO.searchWordString == ''}">
				  		<input type="text" id="searchBar" class="form-control" placeholder="원하는 요리를 입력해주세요...">
				  	</c:if>
				  	<c:if test="${searchVO.searchWordString != null && searchVO.searchWordString != ''}">
				  		<input type="text" id="searchBar" class="form-control" placeholder="원하는 요리를 입력해주세요..." value="${searchVO.searchWordString}">
				  	</c:if>
			  	</c:if>
			  	<c:if test="${searchVO.searchType == 2}">
				  	<c:if test="${searchVO.searchWordString == null || searchVO.searchWordString == ''}">
				  		<input type="text" id="searchBar" class="form-control" placeholder="사용하고 싶은 식재료를 입력해주세요...">
				  	</c:if>
				  	<c:if test="${searchVO.searchWordString != null && searchVO.searchWordString != ''}">
				  		<input type="text" id="searchBar" class="form-control" placeholder="사용하고 싶은 식재료를 입력해주세요..." value="${searchVO.searchWordString}">
				  	</c:if>
			  	</c:if>
			  	<span class="btn input-group-text" id="searchBtn" style="background-color: white; border: 2px solid #ced4da;">검색</span>
			</div>
			<nav id="filterBar" class="navbar navbar-expand-lg bg-body-tertiary">
 		    	<div class="container-fluid">
	    			<a class="navbar-brand" style="margin-inline:9px;">조리법</a>
	    			<input type="hidden" id="searchCategory" value="${searchVO.searchCategory}">
    				<input type="hidden" id="searchWord" value="${searchVO.searchWordString}">
	    			<input type="hidden" id="curPage" value="${searchVO.curPage}">
			    	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        		<c:if test="${searchVO.searchCategory == null || searchVO.searchCategory == ''}">
		        			<li class="nav-item">
			        			<a class="nav-link active bg-secondary" style="border-radius: 15px; mrgin-inline:3px;" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=&page=1">전체</a>
		        			</li>
		        		</c:if>
		        		<c:if test="${searchVO.searchCategory != null && searchVO.searchCategory != ''}">
		        			<li class="nav-item">
			        			<a class="nav-link" style="mrgin-inline:3px;" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=&page=1">전체</a>
		        			</li>
		        		</c:if>
			        	<c:forEach items="${catList}" var="cat">
			        		<c:if test="${cat.recipeCat != searchVO.searchCategory}">
								<li class="nav-item">
				        			<a class="nav-link" style="margin-inline:3px;" id="cat${cat.recipeCat}" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${cat.recipeCat}&page=1">${cat.catName}</a>
			        			</li>
							</c:if>
							<c:if test="${cat.recipeCat == searchVO.searchCategory}">
								<li class="nav-item">
				        			<a class="nav-link active bg-secondary" style="border-radius: 15px; margin-inline:3px;" id="cat${cat.recipeCat}" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${cat.recipeCat}&page=1">${cat.catName}</a>
			        			</li>
							</c:if>
			        	</c:forEach>
			      	</ul>
			      	<c:if test="${searchVO.searchCategory != null || searchVO.searchWordString != null || searchVO.curPage != 1}">
			      		<a class="navbar-brand" style="margin-inline:9px;" href="/">초기화</a>
			      	</c:if>
			      	<c:if test="${searchVO.searchCategory == null && searchVO.searchWordString == null && searchVO.curPage == 1}">
			      		<a class="navbar-brand" style="margin-inline:9px; visibility: hidden;" href="/">초기화</a>
			      	</c:if>
			 	</div>
			</nav>
			<div class="recipe_li_div mb-3">
				<p class="recipeTotalCount" style="color:black; text-align:left; margin-bottom:0px; padding-left: 32px; padding-top:20px;">레시피 총 ${searchVO.totalRowCount}개</p>
				<ul class="recipe_li row">
					<c:forEach items="${recipeList}" var="recipe">
						<li class="col-md-3 mb-4" style="width: 322px; height: 300px; ">
							<div class="card" style="width: 250px; height: 300px;">
								<a href="/recipeView/${recipe.recipeToken}">
									<img class="recipe_img mt-3" style="width: 210px; height: 210px; border-radius: 4px;" src="${recipe.recipeImg}">
								</a>
								<div class="card-body" style="-webkit-line-clamp: 2; overflow: hidden; text-overflow: ellipsis;">
									<p class="card-title mt-2" style="color: black; font-size: 18px; font-weight: bold;">${recipe.recipeName}</p>
									<c:if test="${recipe.recipeDes == null}">
										<p class="card-text" style="color: black;">${recipe.recipeLevel}</p>
									</c:if>
									<c:if test="${recipe.recipeDes != null}">
										<p class="card-text" style="color: black;">${recipe.recipeLevel} &nbsp; | &nbsp; ${recipe.recipeDes}</p>
									</c:if>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		
		
		<!-- START : 페이지네이션  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- prev -->
					<c:if test="${searchVO.firstPage != 1}">
						<li class="page-item">
							<a class="page-link" aria-lable="Previous" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${searchVO.searchCategory}&page=${searchVO.firstPage - 1}">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<!-- prev -->
					<!-- paging -->
					<c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
						<c:if test="${searchVO.curPage != i}">
							<li class="page-item">
								<a class="page-link" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${searchVO.searchCategory}&page=${i}">${i}</a>
							</li>
						</c:if>
						<c:if test="${searchVO.curPage == i}">
							<li class="page-item active">
								<a class="page-link" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${searchVO.searchCategory}&page=${i}">${i}</a>
							</li>
						</c:if>
					</c:forEach>				
					<!-- paging -->
					<!-- next -->
					<c:if test="${searchVO.lastPage != searchVO.totalPageCount}">
						<li class="page-item">
							<a class="page-link" aria-lable="Next" href="/?type=${searchVO.searchType}&words=${searchVO.searchWordString}&cat=${searchVO.searchCategory}&page=${searchVO.lastPage + 1}">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<!-- next -->
				</ul>
			</nav>
			<!-- END : 페이지네이션  -->
			
			
			</header>
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	</body>

	<script type="text/javascript">
	$(document).ready(function(){
		
		$("")
		
		
		$("#searchBtn").click(function(){
			let category = $("#searchCategory").val();
			let search = $("#searchBar").val();
			let type = $("#searchTypeSelect").val();
			searchList = search.split(',')
			wordList = []
			
			for (let i=0; i<searchList.length; i++){
				le = searchList[i].trim()
				wordList.push(le)
			}
			window.location.href = "/?type="+type+"&words="+search+"&cat="+category+"&page=1"
		});
		
		
		$('#searchBtn').hover(function() {
	        $(this).css({'color': '#88D14F', 'border-color': '#88D14F'});
	    }, function() {
	        $(this).css({'color': 'black', 'border-color': '#ced4da'});
	    });
		
		
	});

</script>
	
