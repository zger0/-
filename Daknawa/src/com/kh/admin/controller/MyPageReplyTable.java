package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.Reply;
import com.kh.common.model.vo.SubNav;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyPagePostTable
 */
@WebServlet("/replylist.mp")
public class MyPageReplyTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageReplyTable() {
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
		sn.setTitle2("매장 관리");
		sn.setTitle2Addr("adlist.st");
		sn.setTitle3("전체 매장 조회");
		sn.setActive1("1");
		sn.setActive2("active");
		sn.setActive3("1");
		sn.setActive4("1");
		
		
		request.setAttribute("sn", sn);
		
		int userNo = (((Member)request.getSession().getAttribute("loginUser")).getUserNo());

		ArrayList<Reply> list = new AdminService().selectReplyList(userNo);

		System.out.println(list);

		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/myPageReplyTable.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
