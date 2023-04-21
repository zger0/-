<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
    .div1>h1, .div1>h5 { text-align: center; }

    .div1>table div {
        width : 270px;
        height : 270px;
        border-radius : 10px;
        box-sizing : border-box;
        background-color : #EDF1D6;
        text-align : center;
        padding-top : 140px;
    }

    .div1>table { margin : auto; }

    .div2:hover, .div3:hover, .div4:hover, .div5:hover {
        background-color : #e2e7c9;
        cursor : pointer;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%@ include file="../common/adminPageNavbar.jsp" %>

	<div class="div1">
	
		<br><br><br><br>

        <h1 style="font-size : 50px;">관리자 페이지</h1>

        <h5 style="font-size : 20px; font-weight : 500;">아래의 항목 중 원하시는 메뉴를 선택하세요.</h5>

        <br><br>

        <table>
            <tr>
                <td width="270" height="270">
                    <div class="div2">
                        <b style="font-size : 30px;">회원 관리</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(조회 / 수정 / 탈퇴)</h4>
                    </div>
                </td>
                <td width="180">

                </td>
                <td width="270">
                    <div class="div3" onclick="location.href='<%= contextPath %>/adlist.st?currentPage=1'">
                        <b style="font-size : 30px;">매장 관리</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(추가 / 수정 / 삭제)</h4>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="180">

                </td>
                <td>
                    <img src="myPageLogo.png" alt="">
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td height="270">
                    <div class="div4">
                        <b style="font-size : 28px;">신고내역 관리</b> <br><br>
                    </div>
                </td>
                <td>

                </td>
                <td>
                    <div class="div5">
                        <b style="font-size : 28px;">문의내역 관리</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(조회 / 답변)</h4>
                    </div>
                </td>
            </tr>
        </table>

    </div>

</body>
</html>