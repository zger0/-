<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.common.model.vo.Attachment, com.kh.post.model.vo.*" %>

<% Post p = (Post)request.getAttribute("p"); %>
<% Attachment at = (Attachment)request.getAttribute("at"); %>
	
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .outer {
            width : 300px;
            height: 600px;
            margin: 0 auto;

        }
    </style>
</head>
<body>


    <%@ include file="../common/menubar.jsp" %>
    
    <br>
    <h2 align="center">게시판 상세 조회</h2>
    <br>
    

        <div>
         <table class="outer" border="1" style="text-align: center;">
            <div>
            	<form>
                <thead>
                    <tr>
                        <th widtd="30"><%= p.getPostTitle() %></th>
                        <th><%= p.getMemberNickname() %></th>
                        <th><%= p.getPostDate() %></th>
                    </tr>
                    </thead>
                    <tr> 
                        <td id="contnet-1" colspan="4">
                            <p>
                            <%= p.getPostContent() %>
                            </p>
                        </td>
                    </tr>   
                        <tr>
                            <th width="30">첨부파일</th>
                            <td colspan="4">
                                <% if(at == null) { %>
                                    첨부파일이 없습니다
                                <% } else { %>
                                   <a download="<%= at.getOriginName() %>"
                                      href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>">
                                       <%= at.getOriginName() %>
                                   </a> 
                                <% } %>
                        </td>
                    </tr>
                   </form>
            </div>
         </table>
        </div>

        <br>

        <div align="center">
            <a href="plist.bo?currentPage=1" class="btn btn-secondary btn-sm">목록</a>
				
              <% if(loginUser != null && loginUser.getUserNickName().equals(p.getMemberNickname())) { %>
                <a href="<%= contextPath %>/pupdateForm.po?pno=<%= p.getPostNo() %>" class="btn btn-warning btn-sm">수정하기</a>
                <a href="<%= contextPath %>/pdelete.po?pno=<%= p.getPostNo() %>" class="btn btn-danger btn-sm">삭제하기</a>
              <% } %> 
        </div>

        <div id="reply-area">
            <table align="center">
                <thead>
                    <% if(loginUser != null) { %>
                    <tr>
                        <th>댓글</th>
                        <td>
                            <textarea id="replyContent" cols="50" rows="3" style="resize : none;"></textarea>
                        </td>
                        <td>
                            <button onclick="insertReply();">댓글등록</button>
                        </td>
                    </tr>
                <% } else { %>
                    <tr>
                        <th>댓글</th>
                        <th>
                            <textarea cols="50" rows="3" style="resize : none;" readonly>로그인 후 가능한 서비스 입니다.</textarea>
                        </th>
                        <td>
                            <button disabled>댓글등록</button>
                        </td>
                    </tr> 
                <% } %> 
                </thead>
                <tbody>
    				            	
	
                </tbody>
                
               
            </table>
            

            <script>
            	
            
                $(function() {
                    selectReplyList();

                    // 실시간 댓글 조회, 5초 간격으로 조회
                    setInterval(selectReplyList, 500000);
                });

                function insertReply() {

                    $.ajax({
                        url : "reinsert.po",
                        type : "post",
                        data : {
                            content : $("#replyContent").val(),
                            pno : <%= p.getPostNo() %>
                        },
                        success : function(result) {

                             console.log(result); //성공했다면 1, 실패했다면 0

                            if(result > 0) { // 댓글 작성 성공

                                // 갱식된 댓글 리스트 조회
                                selectReplyList();

                                // 댓글 작성용 textarea 조회
                                $("#replyContent").val("");
                            }
                        },
                        error : function() {
                            console.log("댓글 작성 실패!");
                        }
                    });
                }

                // 댓글 조회 요청용 함수
                function selectReplyList() {
                    $.ajax({
                        url : "relist.po",
                        type : "get",
                        data : {pno : <%= p.getPostNo() %> },
                        success : function(list) {

                            // console.log(list); // [{}, {}, {}]

                            let result = "";

                            for(let i in list) {

                                result += "<tr>"
                                result += "<td>" + list[i].memberNo + '<i class"fa-regular"></i>' + "</td>";
                                result += "<td id='reply'>" + list[i].replyContent + "</td>";
                                result += "<td>" + list[i].createDate + "</td>"; 
                                
                                <% String loginUserNickname = (loginUser != null) ? loginUser.getUserNickName() : ""; %>
                                if ("<%= loginUserNickname %>" === list[i].memberNo) {
                                	result += "<td><span style='cursor : pointer;' onClick=Reply('" + list[i].replyContent + "','" + list[i].replyNo + "'); >수정</span></td>";
                                	result += "<td><span style='cursor : pointer;' onClick=deleteReply(" + list[i].replyNo + ");>삭제</span></td>";
                                } 
                                result += "</tr>"
                                
                                $("#reply-area tbody").html(result);    
                            }
                        },
                        error : function() {
                            alert("댓글 조회를 실패하셨습니다");
                        }
                    });
                }
                
                function Reply(content, rno) {
                	console.log(content);
                	console.log(rno);
                	$("#reply").html("<textarea id='replyContent1' cols='50' rows='1' style=' width: 350px; resize: none; border: 1px solid black;'>"+ content +"</textarea><button style='width : 50px' onclick='updateReply("+ rno + ");'>완료</button>");	
                };
                
                // 댓슬 수정용 함수
                function updateReply(rno) {
                	// 댓글 수정용 AJAX
                	$.ajax({
                		url : "reupdate.po",
                		type : "post",
                		data : {
                			rno : rno,
                			content : $("#replyContent1").val()
                		},
                		success : function(result) {
                			// 댓글 수정 성공 시 댓글 목록 다시 조회
                			// console.log(result);
                			if(result > 0) {
                				selectReplyList();
                				
                				// 댓글 수정 후 댓글 내용 초기화
                				$("#replyContent").val("");
                			} else {
                				alert("댓글 수정 실패!");
                			}
                		},
                		error : function() {
                			alert("댓글 수정 실패!")
                		}        
                	});
                }
                
                
                // 댓글 삭제용 함수
                function deleteReply(rno) {
                	// 댓글 삭제용 AJAX
                	$.ajax({
                		url : "redelete.po",
                		type : "post",
                		data : {rno : rno},
                		success : function(result) {
                			// 댓글 삭제 성공시 댓글 목록 다시 조회
                			// console.log(result);
                			if(result > 0) {
                				alert("댓글 삭제 성공!");
                				 selectReplyList();
                			} else {
                				alert("댓글 삭제 실패!");
                			}
                		},
                		error : function() {
                			alert("댓글 삭제 실패!");
                		}
                	});
                }
            </script>

            <br><br>
        </div>

    
</body>
</html>