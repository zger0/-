<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.qna.model.vo.Qna" %>
<%
	// 필요한 데이터 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int maxPage = pi.getMaxPage();
	int endPage = pi.getEndPage();

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /* MY PAGE 타이틀 부분 */
        #container .title {
        padding-top: 80px;
        height: 200px;
        position: relative;
        min-width: 1000px;
      }
      #container .sub_title {
        font-size: 44px;
        line-height: 54px;
        color: #000;
        margin-bottom: 0px;
        text-align: center;
        text-transform: uppercase;
      }
      h2 {
        margin:0;
        font-weight: normal;
        display: block;
      }
      #mini_title {
        width: 100%;
        text-align: center;
        margin-bottom: 44px;
        position: absolute;
        top: 134px;
        left: 0;
      }
      ol {
        list-style: none;
        margin: 0;
        padding: 0;
        display: block;
      }
      li {
        display: inline-block;
        margin: 0;
        padding: 0;
        list-style: none;
        vertical-align: middle;
        text-transform: uppercase;
      }
      a {
        text-decoration: none;
        color: #000;
      }

      /* 메뉴바 부분 */
      #mnb {
        width: 100%;
        min-width: 1000px;
        border-bottom: 1px solid #888686;
        background-color: #fff;
        margin-bottom: 60px;
      }

      #mnb .mnb_header {
        width: 100%;
        min-width: 1000px;
        background-color: #ebebeb;
        border-top: 1px solid #9d9d9d;
      }

      #mnb .mnb_header ul {
        width: 1000px;
        margin: 0 auto;
        padding: 0;
        display: block;
        list-style-type: disc;
      }

      #mnb.menubar .mnb_header ul li {
        width: 25%;
      }
      #mnb .mnb_header ul li {
        text-align: center;
        float: left;
        position: relative;
        line-height: 41px;
      }
      b .mnb_header ul li a {
        font-size: 14px;
        vertical-align: middle;
      }

      #mnb .mnb_header ul li.active {
        background-color: #000;
      }
      #mnb .mnb_header ul li.active a {
        color: #ffffff;
      }
    /* 서브 메뉴바 부분 */
    #mnb_sub a:hover {
        color: #888686;
        font-size: 15px;
    }
    #mnb_sub>li>ul {
        padding: 0%;
        display: none !important; /* 숨김처리 */
                      /* 해당 스타일의 적용 우선순위를 최상위에 두겠다. */
    }
    #mnb_sub>li:hover>ul {
        display: block !important; /* 마우스올라갔을때 처리 */
    }
    #mnb_sub>li>ul:hover {
        display: block;
    }
    #mnb_sub a {
        width: 100%;
        height: 100%;
        display: block;
        text-align: center;
        line-height: 35px;
    }
    .outer {
        width : 1000px;
        height : 550px;
        border : 1px dotted gray;
        margin : auto;
        margin-top : 50px;
    }
    .list-area {
        border : 1px solid gray;
        text-align : center;
    }
    .list-area>tbody>tr:hover {
        background-color : lightgray;
        cursor : pointer;
    }

    .ask1 {
        width: 150px;
        height: 50px;
        text-align: center;
        background-color: white;
        border: 2px solid;
    }


    /* 문의글 리스트 부분 */
    .list-area {
      width: 1000px;
      height: 200px;
      border: 1px solid gray;
      margin: auto;
      text-align:center;
    }
    .list-area>tbody>tr:hover {
      background-color: rgb(239, 239, 239);
      cursor: pointer;
    }
    
    /* 답변 부분 */
    .list-area .answer {
    	display : none;
    }
    </style>


</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	 <section id="container">
        <div class="title">
          <h2 class="sub_title">
            <span>MY PAGE</span>
            </h2>
            <ol id="mini_title">
            <li><a href="<%= contextPath %>">Home</a>
            </li>
            <li>></li>
            <li><a href="<%= contextPath %>/myPage.me">MY PAGE</a>
            </li>
            <li>></li>
            <li><a href="<%= contextPath %>/list.ask?currentPage=1">문의내역</a>
            </li>
            <li>></li>
            <li>1:1 문의</li>
            </ol>
        </div>
        <div id="mnb" class="menubar">
    <div class="mnb_header">
        <ul id="mnb_sub">
               <li>
                    <a href="">내 정보 관리</a>
                    <ul>
                        <li><a href="">정보 조회 및 수정</a></li>
                        <li><a href="">탈퇴</a></li>                   
                    </ul>
                </li>
                <li>
                    <a href="">내 활동 관리</a>
                    <ul>
                        <li><a href="">게시글 관리</a></li>
                        <li><a href="">댓글 관리</a></li>
                        <li><a href="">좋아요 관리</a></li>                   
                    </ul>
                </li>
                <li>
                    <a href="">내 신고 관리</a>
                    <ul>
                        <li><a href="">A</a></li>
                        <li><a href="">B</a></li>
                        <li><a href="">C</a></li>                   
                    </ul>
                </li>
                <li class="active">
                    <a href="<%= contextPath %>/list.ask">문의내역</a>
                    <ul>
                        <li><a href="<%= contextPath %>/list.ask">1:1문의내역관리</a></li>
                        <li><a href="<%= contextPath %>/faq.qna">FAQ</a></li>
                        <li><a href="">C</a></li>                
                    </ul>
                </li>
        </ul>
    </div>
    <br>
    
    <% if(loginUser != null) { %>
    <div align="right" style="width : 850px">
	    <a href="<%= contextPath %>/questionForm.qna" class="ask1">1:1 문의하기 </a>
		<br><br>
    </div>
    <% } %>
    <div class="outer">

        
        <table align="center" class="list-area">
            <thead>
                <tr>
                    <th width="70">글번호</th>
                    <th width="70">문의유형</th>
                    <th width="200">제목</th>
                    <th width="300">문의내용</th>
                    <th width="100">작성자</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
            
            	<% if(list.isEmpty()) {%>
                    <tr>
                        <td colspan="6">
                                                             조회된 리스트가 없습니다.
                        </td>
                    </tr>
                    <% } else { %>
                    	<% for(Qna q : list) { %>
                    	
	                        <tr>
	                            <td><%= q.getAskNo() %></td>
	                            <td><%= q.getAskType() %></td>
	                            <td><%= q.getAskTitle() %></td>
	                            <td><%= q.getAskContent() %></td>
	                            <td><%= q.getMemberNo() %></td>
	                            <td><%= q.getAskDate() %></td>
	                            <td><button><a href="<%= contextPath %>/updateForm.ask?ano=<%= q.getAskNo() %>" class="updateAsk">수정하기</a></button></td>
	                            <td><button><a href="<%= contextPath %>/delete.ask?ano=<%= q.getAskNo() %>" class="deleteAsk">삭제하기</a></button></td>
	                         </tr>
	                         
	
		                    <% if(q.getAnswerContent() == null && q.getAnswerDate() == null) { %>
		                    	<tr class="answer"> <!-- 클릭 시 보여지게, 다시클릭 시 사라지게 -->
		                    		<td colspan="6" align="center">답변 대기중입니다.</td>
		                    	</tr>
		                    <% } else { %>
		                        <tr class="answer">
		                        	<td colspan="5">
		                        		<%= q.getAnswerContent() %>
		                        	</td><!-- 여기에 답변 출력 -->
		                        	<td>
		                        		<%= q.getAnswerDate() %>
		                        	</td><!-- 여기에 답변일출력 -->
		                        </tr> 
		                     <% } %>
	                     
                      <% } %>
                   <% } %>
                        
            </tbody>
        </table>
        <br><br>
        
         <!-- 페이징바 -->
        <div align="center" class="paging">
          
          <% if(currentPage != 1) { %>
          <button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= currentPage - 1 %>';">&lt;</button>
          <% } %>
          
          
          <% for(int p = startPage; p <= endPage; p++) { %>
          		<% if (p != currentPage) { %>
				<button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= p %>';">
				<%= p %>
				</button>
				<% } else { %>
				<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게 -->
				<button disable><%= p %></button>
				<% } %>
		  <% } %>
		  
		  <% if(currentPage != maxPage) { %>
		  <button onclick="location.href = '<%= contextPath %>/list.ask?currentPage=<%= currentPage + 1 %>';">&gt;</button>
		  <% } %>
        </div>
    </div>
  </section>
  
                         

</body>
</html>