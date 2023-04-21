<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.post.model.vo.Category" %>    
 
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
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
	
	<form id="penroll-form" action="<%= contextPath %>/pinsert.bo" method="post" enctype="multipart/form-data">
		<table>
			<thead>
				<tr>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" name="postTitle" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="postContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="upfile">
					</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button onclick="location.href='<%= contextPath %>/plist.bo?currentPage=1'">목록</button>
			<button type="submit">작성</button>
			<button type="reset">취소</button>
		</div>
		
	</form>
	
</body>
</html>
