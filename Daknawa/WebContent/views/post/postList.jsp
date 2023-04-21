<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.post.model.vo.Post, com.kh.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post List</title>
<style>

    .outer {
        margin: 10%;
        margin-top: 3%;
    }
    
    table {
    border-collapse: collapse;
    width: 100%;
    }

    td, th {
    border: 1px solid #ddd;
    padding: 20px;
    text-align: left;
    }

    .btn-group { float: right; }

    #list, #insertList { /* 버튼크기를 지정 */
        height : 40px; 
        width : 90px;
    }

    #left-btn, #right-btn { float : right; } 

    #page-numbers { float : left; }

    .search-container { float : right }

    .post-1:hover { 
    color : lightgray;
    cursor : pointer;  }

    </style>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
    
            <div class="outer">
            <table id="list-area">
                <thead>
                    <tr>
                        <th colspan="8">
                            <div class="category">
                                <label for="category"></label>
                                <select id="category">
									<option value="selectList">이동할 카테고리 선택</option>
                                    <option value="notice">공지사항</option>
                                    <option value="free">자유게시판</option>
                                    <option value="review">리뷰게시판</option>
                                </select>
                            </div>
	    			
	    					<script>
	    					
	    					var category = document.getElementById("category");

	    					category.addEventListener("change", function() {
	    					    var selectedOption = category.value;
	    					  
	    					    var pageUrl = "";
	    					    
	    					    switch(selectedOption) {
	    					        case 'notice':
	    					            pageUrl = "nlist.no?currentPage=1";
	    					            break;
	    					        case 'free':
	    					            pageUrl = "plist.bo?currentPage=1";
	    					            break;
	    					        case 'review':
	    					            pageUrl = "review.bo?currentPage=1#1";
	    					            break;
	    					        default:
	    					            pageUrl = "";
	    					            break;
	    					    }
	    					  
	    					    if (pageUrl !== "") {
	    					        window.location.href = pageUrl;
	    					    }
	    					});
	    					
	    					</script>
	    
	    	
	    
	    
                            <h1>자유게시판</h1> 자유롭게 당신의 의견을 전해주세요!  
    						
    					 <% if(loginUser != null) { %> 		                        
                            <span class="btn-group"> <!-- 버튼 관련 class -->
                                <a id="insertList" class="btn btn-secondary" href="<%= contextPath %>/penrollform.bo">글작성</button>
                            </th>
                            </span>
                         <% } %>     
                    </tr>
                    <tr>
                        <th width="1%" class="table-active">번호</th>
                        <th width="60%" class="table-active">글제목</th>
                        <th width="10%" class="table-active">작성자</th>
                        <th width="3%" class="table-active">조회수</th>
                        <th width="10%" class="table-active">작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(list.isEmpty()) { %>
                	<tr>
                		<td colspan="5">
                			조회된 리스트가 없습니다.
                		</td>
                	</tr>
                	<% } else { %>
                		<% for(Post p : list) { %>
                    <tr class="post-1">
                        <td><%= p.getPostNo() %></td>
                        <td><%= p.getPostTitle() %></td>
                        <td><%= p.getMemberNickname() %></td>
                        <td><%= p.getPostView() %></td>
                        <td><%= p.getPostDate() %></td>
                    </tr>
                    	<% } %>
                    <% } %>	
                    
                    
                    
                    
                    
                    
                </tbody> 
            </table>    
            
            <script>
            	$(function() {
            		$("#list-area>tbody>tr").click(function() {
            		
            		let pno = $(this).children().eq(0).text();
            		
            		location.href = "<%= contextPath %>/pDetail.bo?pno=" + pno;
            	});            		
            });   
            </script>
            
          
    
            <br><br>
            
            <div align="center" class="paging-area">
            
            	<% if(currentPage != 1) { %>
            		 <button onclick="location.href = '<%= contextPath %>/plist.bo?currentPage=<%= currentPage - 1 %>';">
            		 	<
            		 </button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            		<% if(p != currentPage) {  %>
            			<button onclick="location.href = '<%= contextPath %>/plist.bo?currentPage=<%= p %>';">
           					<%= p %> 			
            			</button>
            		<% } else { %>
            			<button disabled><%= p %><</button>
            		<% } %>
            	<% } %>
            
            	<% if(currentPage != maxPage) { %>
            		<button onclick="location.href = '<%= contextPath %>/plist.bo?currentPage=<%= currentPage + 1%>';">
            			>
            		</button>
            	<% } %>
            
            </div>
    	</div>
  
</body>
</html>