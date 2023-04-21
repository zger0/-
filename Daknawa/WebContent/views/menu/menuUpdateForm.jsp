<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.menu.model.vo.Menu, com.kh.common.model.vo.Attachment"%>

<%
	Menu m = (Menu) request.getAttribute("m");
Attachment at = (Attachment) request.getAttribute("at");
int mno = Integer.parseInt(request.getParameter("mno"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>상품 수정 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 40px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 40px;
}

.form-label {
	font-weight: bold;
}

.form-control:focus {
	border-color: #ffc107;
	box-shadow: none;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0069d9;
	border-color: #0062cc;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="container">
		<h1 class="my-4">메뉴 수정 페이지</h1>
		<form id="update-form" action="<%=contextPath%>/update.mn"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="m-name" class="form-label">메뉴 이름</label> <input
					type="text" class="form-control" id="m-name" name="name"
					value="<%=m.getMenuName()%>" placeholder="메뉴 이름을 입력하세요" />
			</div>
			<div class="form-group">
				<label for="m-price" class="form-label">메뉴 가격</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">₩</span>
					</div><input type="hidden" name="mno" value="<%=mno%>"> <!-- 메뉴 ID 값 -->
					<input type="number" class="form-control" id="m-price" name="price"
						value="<%=m.getMenuPrice()%>" placeholder="메뉴 가격을 입력하세요" />
				</div>
			</div>
			<div class="form-group">
				<label for="m-category" class="form-label">카테고리</label> <select
					class="form-control" id="m-category" name="category">
					<option value="치킨"
						<%=m.getMenuCategory().equals("치킨") ? "selected" : ""%>>치킨</option>
					<option value="감자튀김"
						<%=m.getMenuCategory().equals("감자튀김") ? "selected" : ""%>>감자튀김</option>
					<option value="떡볶이"
						<%=m.getMenuCategory().equals("떡볶이") ? "selected" : ""%>>떡볶이</option>
					<option value="기타"
						<%=m.getMenuCategory().equals("기타") ? "selected" : ""%>>기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="m-store" class="form-label">매장</label> <input
					type="text" class="form-control" id="m-store" name="store"
					placeholder="매장을 입력하세요" value="<%=m.getStoreNo()%>" />
			</div>
			<div class="form-group">
				<label for="m-description" class="form-label">메뉴 설명</label>
				<textarea class="form-control" id="m-description" name="desc"
					rows="3"><%=m.getMenuDesc()%></textarea>
			</div>
			<div class="form-group">
				<label for="m-image" class="form-label">이미지</label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="product-image"
						name="reupfile"
						onchange="document.getElementById('image-label').innerHTML = this.value.split('\\').pop()" />
					<label class="custom-file-label" for="product-image"
						id="image-label">이미지를 선택하세요</label>
				</div>
			</div>
			<div class="form-group">

				<%
					if (at != null) {
				%>
				<!-- 기존 게시글에 첨부파일이 있다면 원본명을 보여주기 -->
				<%=at.getOriginName()%>

				<!-- 
								기존 게시글에 딸린 원래 첨부파일의 파일번호 (PK), 수정명을 hidden 으로 같이 넘기기 
								=> 파일번호 : ATTACHMENT UPDATE 를 위해서 넘길 것
								=> 수정명 : 파일도 수정된 경우 기존의 파일은 삭제하기 위해 넘길 것
							-->
				<input type="hidden" name="originFileNo"
					value="<%=at.getFileNo()%>"> <input type="hidden"
					name="originFileName" value="<%=at.getChangeName()%>">

				<%
					}
				%>
				

				<button type="submit" class="btn btn-primary">수정완료</button>
		</form>
	</div>
	<script
		src="https://code.jquery.com/jquery-3
        .3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>


