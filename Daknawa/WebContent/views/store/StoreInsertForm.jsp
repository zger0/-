<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		
		<br>
		<h2 align="center">매장 정보 추가하기</h2>
		<br>
		
		<form id="update-form" action="<%= contextPath %>/insert.st" method="post" >

			<!-- 매장 정보를 hidden 으로 넘기기 -->
			<input type="hidden" name="sno" >
			
			<table align="center">
				
				<tr>
					<th>브랜드명</th>
					<td>
						<input type="text" name="bname" required>
					</td>
				</tr>
				<tr>
					<th>매장명</th>
					<td>
						<input type="text" name="sname" required>
					</td>
				</tr>
				<tr>
					<th>매장주소</th>
					<td>
						<input type="text" name="address" required>
					</td>
				</tr>
				<tr>
					<th>매장전화번호</th>
					<td>
						<input type="text" name="phone" required>
					</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>
						<input type="text" name="time" required>
					</td>
				</tr>
				
			</table>

			<br>

			<div align="center">
				<button type="submit">작성하기</button>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
			
		</form>

</body>
</html>