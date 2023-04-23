package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.model.vo.SubNav;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberListController
 */
@WebServlet("/list.me")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Member> list = new MemberService().selectMemberList();
		
		SubNav sn = new SubNav();
		
		sn.setTitle1("ADMIN PAGE");
		sn.setTitle1Addr("admin.me");
		sn.setTitle2("회원 관리");
		sn.setTitle2Addr("list.me");
		sn.setTitle3("회원정보 조회");
		sn.setActive1("active");
		sn.setActive2("1");
		sn.setActive3("1");
		sn.setActive4("1");
		
		request.setAttribute("sn", sn);
		
		request.setAttribute("list", list);
		
		// 응답페이지 포워딩
		request.getRequestDispatcher("views/admin/memberListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
