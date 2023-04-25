<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.menu.model.vo.Menu, com.kh.common.model.vo.Attachment"%>
<%
	Menu m = (Menu) request.getAttribute("m");
    Attachment at = (Attachment) request.getAttribute("at");
    int mno = Integer.parseInt(request.getParameter("mno"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닭나와</title>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
    <div class="form-example-area">
        <div class="container" style="width: 500px;">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-example-wrap" >
                        <form id="update-form" action="<%=contextPath%>/update.mn" method="post">
                            <input type="hidden" name="mno" value="<%=mno%>">
                            <div class="cmp-tb-hd" style="margin-bottom: 25px; margin-top: 40px; text-align: center;">
                                <h2>메뉴 수정 페이지</h2>
                            </div>
                            <div class="form-example-int">
                                <div class="form-group">
                                    <label>메뉴 이름</label>
                                    <div class="nk-int-st">
                                        <input type="text" class="form-control input-sm" name="name" value="메뉴값가져오셈">
                                    </div>
                                </div>
                            </div>
                            <div class="form-example-int">
                                <div class="form-group">
                                    <label>메뉴 가격</label>
                                    <div class="nk-int-st">
                                        <input type="text" class="form-control input-sm" name="price" value="<%=m.getMenuPrice()%>" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-example-int">
                                <div class="form-group">
                                    <label>카테고리</label>
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select class="selectpicker" name="category" style="margin-top: 5px; margin-bottom: 5px;">
                                            <option value="치킨"
                                                <%=m.getMenuCategory().equals("치킨") ? "selected" : ""%>>치킨</option>
                                            <option value="감자튀김"
                                                <%=m.getMenuCategory().equals("감자튀김") ? "selected" : ""%>>감자튀김</option>
                                            <option value="떡볶이"
                                                <%=m.getMenuCategory().equals("떡볶이") ? "selected" : ""%>>떡볶이</option>
                                            <option value="기타"
                                                <%=m.getMenuCategory().equals("기타") ? "selected" : ""%>>기타</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-example-int">
                                <div class="form-group">
                                    <label>브랜드</label>
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select class="selectpicker" name="askType" style="margin-top: 5px; margin-bottom: 5px;">
                                            <option value="1">BBQ</option>
                                            <option value="2">BHC</option>
                                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="floating-numner form-rlt-mg">
                                        <p>메뉴설명</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px;">
                                    <div class="form-group">
                                        <div class="nk-int-st">
                                            <textarea class="form-control" rows="5" name="askContent"><%=m.getMenuDesc()%></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-example-int mg-t-15">
                                <div class="form-group">
                                    <label>이미지</label>
                                    <div class="nk-int-st">
                                        <input type="file" class="form-control input-sm" name="reupfile" onchange="document.getElementById('image-label').innerHTML = this.value.split('\\').pop()" >
                                    </div>
                                </div>
                            </div>
                            <%
                            if (at != null) {
                            %>
                            <!-- 기존 게시글에 첨부파일이 있다면 원본명을 보여주기 -->
                            <%=at.getOriginName()%>
            
                            <!-- 
                                            기존 게시글에 딸린 원래 첨부파일의 파일번호 (PK), 수정명을 hidden 으로 같이 넘기기 
                                            => 파일번호 : ATTACHMENT UPDATE 를 위해서 넘길 것
                                            => 수정명 : 파일도 수정된 경우 기존의 파일은 삭제하기 위해 넘길 것
                                        -->
                            <input type="hidden" name="originFileNo"
                                value="<%=at.getFileNo()%>"> <input type="hidden"
                                name="originFileName" value="<%=at.getChangeName()%>">
            
                            <%
                                }
                            %>
                            <div class="form-example-int mg-t-15" style="text-align: center; margin-top: 25px;">
                                <button class="btn btn-success notika-btn-success" style="margin: 0 2px;" type="submit">입력</button>
                                <button class="btn btn-success notika-btn-success" style="margin: 0 2px;">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp"%>
    
</body>
</html>