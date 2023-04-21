<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>상품 등록 페이지</title>
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
		<h1 class="my-4">메뉴등록 페이지</h1>
		<form id="enroll-form" action="<%=contextPath%>/insert.mn"
			method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label for="product-name" class="form-label">메뉴 이름</label> <input
					type="text" class="form-control" id="product-name" name="name"
					placeholder="메뉴 이름을 입력하세요" />
			</div>
			<div class="form-group">
				<label for="product-price" class="form-label">메뉴 가격</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">₩</span>
					</div>
					<input type="number" class="form-control" id="product-price"
						name="price" placeholder="메뉴 가격을 입력하세요" />
				</div>
			</div>
			<div class="form-group">
				<label for="product-category" class="form-label">카테고리</label> <select
					class="form-control" id="product-category" name="category">
					<option value="치킨">치킨</option>
					<option value="감자튀김">감자튀김</option>
					<option value="떡볶이">떡볶이</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="product-store" class="form-label">매장</label> <input
					type="text" class="form-control" id="product-store" name="store"
					placeholder="매장을 입력하세요" />
			</div>
			<div class="form-group">
				<label for="product-description" class="form-label">메뉴 설명</label>
				<textarea class="form-control" id="product-description" name="desc"
					rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="product-image" class="form-label">이미지</label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="product-image"
						name="upfile"
						onchange="document.getElementById('image-label').innerHTML = this.value.split('\\').pop()" />
					<label class="custom-file-label" for="product-image"
						id="image-label">이미지를 선택하세요</label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
	<script>
	$(document).ready(function() {
		  $('form#enroll-form').submit(function(event) {
		    var fileInput = $('input#product-image');
		    if(fileInput.get(0).files.length === 0) {
		      event.preventDefault();
		      alert('이미지를 선택하세요.');
		    }
		  });
		});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
