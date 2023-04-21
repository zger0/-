package com.kh.menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.menu.model.service.MenuService;
import com.kh.menu.model.vo.Menu;

/**
 * Servlet implementation class MenuSearchController
 */
@WebServlet("/search.mn")
public class MenuSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String query = request.getParameter("query");
		
		ArrayList<Menu> list = new MenuService().searchMenu(query);
		System.out.println(list.size());

		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/menu/menuSearchView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "메뉴 검색에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
