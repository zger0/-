package com.kh.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.post.model.service.PostService;
import com.kh.post.model.vo.Post;
import com.kh.store.model.service.StoreService;
import com.kh.store.model.vo.Store;

/**
 * Servlet implementation class StoreListController
 */
@WebServlet("/ldssssist.st")
public class StoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String brandName = request.getParameter("bname");
		String keyword = request.getParameter("keyword");
		
		int listCount; // 총 게시글 수
		int currentPage; // 사용자가 요청하는 현재 페이지
		int pageLimit; // 페이징바 최대 페이지 수
		int postLimit; // 한 페이지에 보여질 게시글의 최대 갯수

		int maxPage; // 가장 마지막 페이지 (총 페이지 수)
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝수
		
		// * listCount : 총 게시글 갯수 (삭제된 게시글은 제외하고 카운트)
		listCount = new StoreService().selectKeywordListCount(brandName, keyword);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 4;
		
		postLimit = 10; 
		
		maxPage = (int)Math.ceil((double)listCount /postLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Store s = new Store();
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,
				                    postLimit, maxPage, startPage, endPage);
		
		ArrayList<Store> list = new StoreService().selectKeywordList(pi, s, brandName , keyword);
		
		
		// System.out.println(pi);
		System.out.println(list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/store/StoreListView.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
