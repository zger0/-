package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.SubNav;

/**
 * Servlet implementation class AdminPageController
 */
@WebServlet("/admin.me")
public class AdminPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SubNav sn = new SubNav();
		
		sn.setTitle1("ADMIN PAGE");
		sn.setTitle1Addr("admin.me");
		sn.setTitle2("회원 관리");
		sn.setTitle2Addr("admin.me");
		sn.setTitle3("정보 조회 및 수정");
		sn.setActive1("active");
		sn.setActive2("1");
		sn.setActive3("1");
		sn.setActive4("1");
		
		request.setAttribute("sn", sn);
		
		response.sendRedirect(request.getContextPath() + "/list.me");
		
		// request.getRequestDispatcher("views/member/memberListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
