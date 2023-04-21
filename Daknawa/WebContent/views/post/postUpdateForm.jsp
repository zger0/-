<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.post.model.vo.Post, com.kh.common.model.vo.Attachment"%>
 
    
<%
	Post p = (Post)request.getAttribute("p");
	
	Attachment at = (Attachment)request.getAttribute("at");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
	table {
		width: 600px;
		height: 400px;
		border-collapse: collapse;
		margin: 20px;
	}

	th, td {
		padding: 10px;
		text-align: center;
		border: 1px solid #ddd;
	}

	thead th {
		background-color: #f5f5f5;
	}

	textarea {
		width: 100%;
		height: 200px;
	}

	input[type="text"] {
		width: 100%;
		height: 30px;
		box-sizing: border-box;
	}

	.file-link {
		display: inline-block;
		margin-top: 10px;
		padding: 5px;
		border: 1px solid #ddd;
		background-color: #f5f5f5;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<h2>게시글 작성</h2>
	
	<form id="update-form" action="<%= contextPath %>/pupdate.po" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="pno" value="<%= p.getPostNo() %>">
		<table>
			<thead>
				<tr>
					<th width="200">카테고리 선택</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<select>
							<option value="1">카테고리 1</option>
							<option value="2">카테고리 2</option>
							<option value="3">카테고리 3</option>
						</select>
					</td>
					<td>
						<input type="text" name="title" value="<%= p.getPostTitle() %>" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" required><%= p.getPostContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>
					<% if(at != null) { %>
						<%= at.getOriginName() %>
						
						<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
						<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">	
					<% } %>
					<input type="file" name="reUpfile">
					</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button type="submit">수정하기</button>
		</div>
		
	</form>
	
</body>
</html>
