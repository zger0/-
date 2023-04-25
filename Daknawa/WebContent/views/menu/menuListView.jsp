<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.menu.model.vo.Menu, com.kh.common.model.vo.Attachment"%>
<%@ page import="com.kh.common.model.vo.PageInfo"%>

<%
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
ArrayList<Attachment> ilist = (ArrayList<Attachment>) request.getAttribute("ilist");
PageInfo pi = (PageInfo) request.getAttribute("pi");
String userId = request.getParameter("userId");
// 자주 쓰일법한 변수들 셋팅
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
/* 모달 전체를 가운데로 정렬합니다. */
.modal {
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 모달 배경 스타일을 지정합니다. */
.modal-backdrop {
	background-color: rgba(0, 0, 0, 0.6);
}

/* 모달창 스타일을 지정합니다. */
.modal-content {
	border-radius: 20px;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	background-color: #fff;
	max-width: 600px;
	margin: 0 20px;
}

/* 모달창 제목 스타일을 지정합니다. */
.modal-title {
	font-size: 24px;
	font-weight: bold;
	margin: 0;
	padding: 20px;
	color: #fff;
	background-color: #f39c12;
	border-radius: 20px 20px 0 0;
	text-align: center;
}

/* 모달창 닫기 버튼 스타일을 지정합니다. */
.close {
	font-size: 24px;
	font-weight: bold;
	color: #fff;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	opacity: 0.8;
}

.close:hover {
	opacity: 1;
}

/* 모달창 이미지 스타일을 지정합니다. */
.modal-body img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

/* 모달창 하단의 체크박스와 레이블 스타일을 지정합니다. */
.modal-footer input[type="checkbox"] {
	margin-right: 5px;
}

.modal-footer label {
	font-size: 14px;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>CMS</title>

<!-- swiper.js 라이브러리추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.0/swiper-bundle.min.css" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	
</script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div id="content_1">
		<!-- Slider main container -->
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide">
					<img src="resources/img/1.png"
						style="display: block; margin: 0 auto" />
				</div>
				<div class="swiper-slide">
					<img src="resources/img/2.png"
						style="display: block; margin: 0 auto" />
				</div>
				<div class="swiper-slide">
					<img src="resources/img/3.png"
						style="display: block; margin: 0 auto" />
				</div>
				<div class="swiper-slide">
					<img src="resources/img/4.png"
						style="display: block; margin: 0 auto" />
				</div>
			</div>

			<!-- If we need pagination -->
			<div class="swiper-pagination"></div>
			<!-- If we need navigation buttons -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<!-- If we need scrollbar -->
			<div class="swiper-scrollbar"></div>
		</div>
	</div>

	<script>
		// 슬라이더 동작 정의
		const swiper = new Swiper(".swiper", {
			autoplay : {
				delay : 3000, // 3초마다 이미지 변경
			},
			loop : true, //반복 재생 여부
			slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
			pagination : {
				// 페이징 버튼 클릭 시 이미지 이동 가능
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				// 화살표 버튼 클릭 시 이미지 이동 가능
				prevEl : ".swiper-button-prev",
				nextEl : ".swiper-button-next",
			},
		});
	</script>
	<br />
	<div style="display: flex; justify-content: center"
		class="navbar navbar-expand-lg navbar-light bg-light">
		<nav class="navbar">
			<div class="container-fluid">
				<a class="navbar-brand" href="<%=contextPath%>/menu.mn">전체메뉴</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							id="chicken-menu" aria-current="page"
							href="<%=contextPath%>/list.ch?type=치킨">치킨메뉴</a></li>
						<li class="nav-item"><a class="nav-link" href="#"></a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								사이드 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="<%=contextPath%>/list.ch?type=감자튀김">감자튀김</a></li>
								<li><a class="dropdown-item"
									href="<%=contextPath%>/list.ch?type=떡볶이">떡볶이</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item"
									href="<%=contextPath%>/list.ch?type=기타">기타</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="window.open('<%=contextPath%>/views/menu/menuChat.jsp', 'chatWindow', 'width=500, height=500')">채팅방</a>
						</li>
					</ul>
				</div>
				<form class="d-flex" method="POST" action="search.mn">
					<div class="input-group">
						<input type="hidden" name="type">
						<input class="form-control" type="search" name="query"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</form>
				&nbsp;<%
					if (loginUser != null && loginUser.getUserId().equals("admin")) {
				%>
				<button onclick="location.href='<%=contextPath%>/enrollForm.mn'"
					type="button" class="btn btn-outline-dark" style="margin: 0 auto">메뉴
					생성</button>
				<%
					}
				%>
			</div>
		</nav>
	</div>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
					for (Menu m : list) {
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<%
							for (Attachment i : ilist) {
						%>
						<%
							if (m.getMenuNo() == i.getMenuNo()) {
						%>
						<img class="card-img-top"
							src="<%=contextPath%>/<%=i.getFilePath() + i.getChangeName()%>"
							alt="..." style="width: 268px; height: 160px" />
						<%
							}
						%>
						<%
							}
						%>
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=m.getMenuName()%></h5>
								<!-- Product price-->
								<%=m.getMenuPrice()%>원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="<%=contextPath%>/list.mn?
				mno=<%=m.getMenuNo()%>">자세히
									보기</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!-- 페이징바 -->
			<div align="center" class="paging-area">
				<%
					if (currentPage != 1) {
				%>
				<button
					onclick="location.href = ' <%=contextPath%>/menu.mn?currentPage=<%=currentPage - 1%>';">
					&lt;</button>
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<%
					if (p == currentPage) {
				%>
				<button
					onclick="location.href = '<%=contextPath%>/menu.mn?currentPage=<%=p%>';"
					disabled>
					<b><%=p%></b>
				</button>
				<%
					} else {
				%>
				<!--  현재 내가 보고 있는 페이지일 경우에는 클릭이 안되게끔 -->
				<button
					onclick="location.href = '<%=contextPath%>/menu.mn?currentPage=<%=p%>';">
					<%=p%>
				</button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage != maxPage) {
				%>
				<button
					onclick="location.href = ' <%=contextPath%>/menu.mn?currentPage=<%=currentPage + 1%>';">
					&gt;</button>
				<%
					}
				%>
			</div>
		</div>
	</section>

	<%@ include file="../common/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- 광고 팝업용 모달창-->
	<!-- The Modal -->
	<div class="modal" id="adModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">오늘의 치킨!</h4>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" style="padding: 0;">
					<img src="<%=request.getContextPath()%>/resources/img/ad.png" />
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="checkbox" id="mainPop" name="mainPop" /> <label
						for="mainPop">24 시간 동안 보지 않기</label>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(function() {
		  $("#mainPop").click(function() {
		    $("#adModal").modal("hide");
		    let today = new Date();
		    today.setDate(today.getDate() + 1); // 하루 뒤의 날짜를 구함
		    document.cookie = "mainPop=n; expires=" + today.toUTCString();
		  });

		  if (document.cookie.includes("mainPop=n")) {
		    $("#adModal").modal("hide");
		  } else {
		    $("#adModal").modal("show");
		  }

		  document.querySelector('#adModal .close').addEventListener('click', function() {
		    $("#adModal").modal("hide");
		  });
		});
	</script>
</body>
</html>
