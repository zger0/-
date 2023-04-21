<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
    text-align: center;
    margin-bottom: 4%;
}
.accordion-item {
    width: 700px;
}

.ask1 {
    width: 150px;
    height: 50px;
    text-align: center;
    background-color: white;
    border: 2px solid;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	
    <div class="div1">
        <h1><b>고객센터</b></h1>
        <h3><b>FAQ</b></h3>
        <h5>자주 찾는 질문</h5>


    </div>
    <div class="accordion" id="accordionPanelsStayOpenExample"> 
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
              회원 등급 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
            <div class="accordion-body">
              <strong>회원등급 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
              이벤트 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
            <div class="accordion-body">
              <strong>이벤트 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong> 
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
              사이트 이용 안내
            </button>
          </h2>
          <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
            <div class="accordion-body">
              <strong>사이트 이용 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong> 
            </div>
          </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingFour">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                기타 안내
              </button>
            </h2>
            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
              <div class="accordion-body">
                <strong>기타 안내 사항은 고객센터 FAQ 를 참고 해주세요.</strong>
             </div>
            </div>
          </div>
      </div>


    <div class="div3">
    <h2><b>문의가 해결되지 않으신가요?</b></h2>
    <h5>자세한 문의는 1:1 문의 게시판을 이용하세요.</h5>
    <button class="ask1" onclick="location.href='<%= contextPath %>/questionForm.qna';">1:1 문의하기 ></button>
    </div>

	
	

</body>
</html>