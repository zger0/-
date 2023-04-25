package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.SubNav;

/**
 * Servlet implementation class MyInfoController
 */
@WebServlet("/myInfo.me")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SubNav sn = new SubNav();
		
		sn.setTitle1("MY PAGE");
		sn.setTitle1Addr("myInfo.me");
		sn.setTitle2("내 정보 관리");
		sn.setTitle2Addr("myInfo.me");
		sn.setTitle3("정보 조회 및 수정");
		sn.setActive1("active");
		sn.setActive2("1");
		sn.setActive3("1");
		
		request.setAttribute("sn", sn);
		
		request.getRequestDispatcher("views/member/memberMyPage.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
