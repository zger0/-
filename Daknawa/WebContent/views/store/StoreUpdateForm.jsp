<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.store.model.vo.*"%>
<%
	Store s = (Store)request.getAttribute("s");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width : 1000px;
		height : 550px;
		margin : auto;
		margin-top : 50px;
	}

	#update-form>table { border : 1px solid lightgray; width : 500px; }
	#update-form input {
		width : 100%;
		box-sizing : border-box;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		
		<br>
		<h2 align="center">매장 정보 수정하기</h2>
		<br>
		
		<form id="update-form" action="<%= contextPath %>/update.st" method="post" >

			<!-- 매장 정보를 hidden 으로 넘기기 -->
			<input type="hidden" name="sno" value="<%= s.getStoreNo() %>">
			
			<table align="center">
				
				<tr>
					<th>브랜드명</th>
					<td>
						<input type="text" name="bname" value="<%= s.getBrandName() %>" required>
					</td>
				</tr>
				<tr>
					<th>매장명</th>
					<td>
						<input type="text" name="sname" value="<%= s.getStoreName() %>" required>
					</td>
				</tr>
				<tr>
					<th>매장주소</th>
					<td>
						<input type="text" name="address" value="<%= s.getStoreAddress() %>" required>
					</td>
				</tr>
				<tr>
					<th>매장전화번호</th>
					<td>
						<input type="text" name="phone" value="<%= s.getStorePhone() %>" required>
					</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>
						<input type="text" name="time" value="<%= s.getStoreTime() %>" >
					</td>
				</tr>
				
			</table>

			<br>

			<div align="center">
				<button type="submit">수정하기</button>
				<button onclick="location.href = '<%= contextPath %>/delete.st?sno=<%= s.getStoreNo() %>'">삭제하기</button>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
			
		</form>
			
			
		
	</div>

</body>
</html>
			