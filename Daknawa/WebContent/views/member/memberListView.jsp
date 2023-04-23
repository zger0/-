<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.Member, com.kh.common.model.vo.PageInfo" %>
<%
	// 필요한 데이터들 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");

	// 자주 쓰일법한 변수들 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	.outer {
		width : 1200px;
		height : 800px;
		margin : auto;
		margin-top : 50px;
		border : 1px solid black;
		
	}
	
	.h1 {
		text-align : center;
        font-size : 50px;
	}
	
	.input {
		width : 200px;
        height : 45px;
        border-style : solid;
        border-width : 2px;
        border-radius : 5px;
        font-size : 16px;
	}
	
	.submit {
		width : 45px;
		height : 45px;
		padding : 0px;
	}
	
	.button {
		width : 70px;
        height : 45px;
        box-sizing : border-box;
        background-color : black;
        border-radius : 5px;
        color : white;
	}
	
	.list-area {
		text-align : center;
		border : 1px solid lightgray;
	}
	
	.list-area tr {
		text-align : center;
		border : 1px solid lightgray;
	}
	
	.list-area>tbody>tr:hover {
		background-color : lightgray;
		cursor : pointer;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%@ include file="../common/adminPageNavbar.jsp" %>

	<div class="outer">
		
		<form class="memberSelectForm" action="<%= contextPath %>/list.me?currentPage=1" method="post">
		
			<br><br><br>
			
			<h1 class="h1">회원 정보</h1>
			
			<br>
			
			<div style="text-align : center;">
				<input type="text" name="userNickname" class="input" placeholder="닉네임 검색">
				<button type="submit" class="button">검색</button>
			</div>
		
		</form>
		
		<br><br>
		
		<div>
			
			<table align="center" class="list-area">
				<thead>
					<tr>
						<th width="80">회원 번호</th>
						<th width="120">아이디</th>
						<th width="200">닉네임</th>
						<th width="150">이름</th>
						<th width="300">이메일</th>
						<th width="150">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
						<tr>
							<td colspan="6">
								조회된 리스트가 없습니다.
							</td>
						</tr>
					<% } else { %>
						<% for(Member m : list) { %>
							<tr>
								<td><%= m.getUserNo() %></td>
								<td><%= m.getUserId() %></td>
								<td><%= m.getUserNickName() %></td>
								<td><%= m.getUserName() %></td>
								<td><%= m.getEmail() %></td>
								<td><%= m.getPhone() %></td>
							</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
						
			
			
		</div>
		
		<!-- 페이징바 -->
		<div align="center" class="paging-area">

			<% if(currentPage != 1) { %>
           		 <button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= currentPage - 1 %>';">
           		 	&lt;
           		 </button>
           	<% } %>
           	
           	<% for(int p = startPage; p <= endPage; p++) { %>
           		<% if(p != currentPage) {  %>
           			<button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= p %>';">
          					<%= p %> 			
           			</button>
           		<% } else { %>
           			<button disabled><%= p %></button>
           		<% } %>
           	<% } %>
           
           	<% if(currentPage != maxPage) { %>
           		<button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= currentPage + 1 %>';">
           			&gt;
           		</button>
           	<% } %>

		</div>
		
		
	</div>

</body>
</html>