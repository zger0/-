package com.kh.menu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.menu.model.service.MenuService;

/**
 * Servlet implementation class AjaxMenuHeartController
 */
@WebServlet("/heart.mn")
public class AjaxMenuHeartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMenuHeartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(); // 세션 객체 가져오기
		 int mbno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		 int mno = Integer.parseInt(request.getParameter("menuNo"));
		 response.setContentType("application/json;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print("{\"success\": true}");
	        out.flush();
	        out.close();

		 new MenuService().heart(mbno, mno);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
