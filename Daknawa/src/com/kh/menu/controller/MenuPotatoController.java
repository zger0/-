package com.kh.menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.menu.model.service.MenuService;
import com.kh.menu.model.vo.Menu;

/**
 * Servlet implementation class MenuPotatoController
 */
@WebServlet("/list.po")
public class MenuPotatoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuPotatoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; // 현재 총 게시글의 갯수
	    int currentPage; // 현재 페이지 (즉, 사용자가 요청하는 페이지)
	    int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 페이지 갯수
	    int PostLimit; // 한 페이지에 보여질 게시글의 최대 객수 (몇개 단위씩 끊어서 볼거냐)

	    int maxPage; // 가장 마지막 페이지가 몇번째페이지인지 (즉, 총 페이지 수)
	    int startPage; // 페이징 하단에 보여질 페이징바의 시작수
	    int endPage; // 페이징 하단에 보여질 페이징바의 끝수

	    // * listCount : 총 게시글의 갯수
	    listCount = new MenuService().selectListCount();
	    // 만약 currentPage=1 이거를 생략하면 무조건 그냥 1 페이지가 보여지고싶은경우에는
	    String tmp = request.getParameter("currentPage"); // 키값이 없으면 null
	       
	    if(tmp == null) {
	    	currentPage = 1;
	    } else {
	    	currentPage = Integer.parseInt(tmp);
	    }

	    pageLimit = 10;

	    PostLimit = 12;

	    maxPage = (int) Math.ceil((double) listCount / PostLimit);

	    startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

	    endPage = startPage + pageLimit - 1;

	    if (endPage > maxPage) {
	      endPage = maxPage;
	    }

	    PageInfo pi = new PageInfo(
	      listCount,
	      currentPage,
	      pageLimit,
	      PostLimit,
	      maxPage,
	      startPage,
	      endPage
	    );

	    ArrayList<Menu> list = new MenuService().selectPagePoList(pi);

	    request.setAttribute("list", list);
	    request.setAttribute("pi", pi);

	    request
	      .getRequestDispatcher("views/menu/menuPoView.jsp")
	      .forward(request, response);
	  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
