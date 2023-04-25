<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.qna.model.vo.Qna"%>
<%
	Qna q = (Qna)request.getAttribute("q");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닭나와</title>
<link rel="shortcut icon" type="resources/admin/image/x-icon" href="resources/css/public/playground_assets/logo.png">
<style>
  hr {
    height: 1px;
    background-color: rgb(198, 201, 205);
    border: solid 0px;
  }
  label {
    margin-right: 100px;
    display: inline-block; 
    text-align: left;
    font-size: 14px;
    padding-left: 43px;

  }
  input[type="text"],
  input[type="email"],
  textarea {
    width: 400px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 16px;
  }
  input[type="submit"] {
    background-color: #000;
    color: #fff;
    padding: 10px 30px;
    border: none;
    font-size: 16px;
    cursor: pointer;
    width: 130px;
  }
  input[type="reset"] {
    background-color: #ffffff;
    color: #000000;
    padding: 10px 30px;
    border: 1px solid;
    font-size: 16px;
    cursor: pointer;
    width: 130px;
  }
  input[type="submit"]:hover {
    background-color: #333;
  }
  div[class="radio"] {
    background-color: #f2f2f2;
  }

  section {
    border: 1px soled red;
    box-sizing: border-box;
  }
  /* 화면 구조 부분 */
  .section {
    width: 1000px;
    height: 800px;
    margin: auto;
  }
  .section>title {
    width:100%;
  }
  #sub_title {
    height: 50%;
  }
  #mini_title {
    height: 15%;
  }
  /* 고객센터 타이틀 부분 */
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
    text-align: -webkit-match-parent;
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
    width: 33%;
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

  
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<section id="container">
    <form action="<%= contextPath %>/update.ask" method="POST">   

      <div class="customer">
        <div class="page_title">
          <h3>1:1 문의 수정</h3>
        </div>
        <div class="ask_content">
          <table>
            <colgroup>
            <col style="width: 295px;">
            <col>
            </colgroup>       
            <tbody>
              
            </tbody>

          </table>
        </div>
      <div>
      <label>아이디입력</label>
      <input type="hidden" name="memberNo" value="<%= q.getMemberNo() %>"> <!-- 회원번호 -->
      <input type="hidden" name="ano" value="<%= q.getAskNo() %>"> <!-- 회원번호 -->
      <input type="text" id="id" name="id" style="background-color: #f2f2f2; width:300px; border:none;" value="<%= loginUser.getUserId() %>" required>
      </div>
      <br><hr><br>

      <div class="ask-type" >
        <label>문의 유형</label>
        <select id="exampleSelect1" name="askType" style="background-color: #f2f2f2; width:300px; height:50px;">
          <option value="0">문의 유형 선택</option>
          <option value="1">홈페이지 이용 관련 문의</option>
          <option value="2">회원 관련 문의</option>
          <option value="3">커뮤니티 관리자에게 문의</option>
          <option value="4">기타 문의</option>
        </select>
      </div> 
      <br><hr><br>
      
     <div>
      <label>문의제목</label>
      <input type="text" id="askTitle" name="askTitle" value="<%= q.getAskTitle() %>" style="background-color: #f2f2f2;  border:none;" placeholder="제목을 입력하세요." required>
    </div>
      <br><hr><br>

      <div style="display: flex;">
      <label for="message" style="display: inline-block; height: 200px;">문의 내용</label>
      <textarea id="askContent" name="askContent" cols="50" rows="15" style="display: inline-block; resize:none; background-color: #f2f2f2; width: 800px; border:none;" placeholder="문의 내용을 상세하게 적어주세요."required><%= q.getAskContent() %></textarea>
      </div>
      <br><hr><br>
      
      <div class="radio">
      <input type="radio" id="checkAgree" style="margin-top:20px; margin-bottom: 20px; margin-left:30px;"> 개인정보 수집 및 이용에 대한 동의(필수)
      </div>
      <br><br> 


      <div style="text-align: center; padding: 5%;">
      <button type="button" onclick="history.back();" style="display: inline-block;">취소</button>
      <input type="submit" value="수정" style="display: inline-block;" onclick="return checkAgree();">
      
      
	  <script>
	  	function checkAgree() {
	  		
	  		// 문의유형도 체크해야함
	  		
	  		// 동의여부를 체크
			let state = document.getElementById("checkAgree").checked;
	  		
			if(!state) {
				alertMsg("개인정보 수집 및 이용에 대한 동의를 해주세요.");
				return false;
			}
			
			return true;
	  	}
	  </script>
      </div>
    </div>
      </div>
    </form>
   </section>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>