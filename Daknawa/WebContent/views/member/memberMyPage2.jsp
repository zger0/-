<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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

	<div class="div1">
	
		<br><br><br><br>

        <h1 style="font-size : 50px;">마이페이지</h1>

        <h5 style="font-size : 20px; font-weight : 500;">아래의 항목 중 원하시는 메뉴를 선택하세요.</h5>

        <br><br>

        <table>
            <tr>
                <td width="270" height="270">
                    <div class="div2" onclick="location.href = '<%= contextPath %>/checkPwdForm.me';">
                        <b style="font-size : 30px;">내 정보</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(조회 / 수정 / 탈퇴)</h4>
                    </div>
                </td>
                <td width="180">

                </td>
                <td width="270">
                    <div class="div3">
                        <b style="font-size : 30px;">내 신고</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(조회 / 수정 / 삭제)</h4>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="180">

                </td>
                <td>

                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td height="270">
                    <div class="div4">
                        <b style="font-size : 26px;">내가 쓴 게시글 / 댓글</b> <br><br>
                        <h4 style="font-size : 18px; color : gray; margin-top : 0px;">(조회 / 수정 / 삭제)</h4>
                    </div>
                </td>
                <td>

                </td>
                <td>
                    <div class="div5">
                        <b style="font-size : 26px;">내가 좋아요 누른 게시글</b> <br><br>
                    </div>
                </td>
            </tr>
        </table>

    </div>

</body>
</html>