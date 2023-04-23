package com.kh.member.controller;

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
		
		request.setCharacterEncoding("UTF-8");
		
		// 필요한 변수들
		int listCount; // 현재 총 회원의 수
		int currentPage; // 현재 페이지 (즉, 사용자가 요청하는 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 페이지 갯수
		int boardLimit; // 한 페이지에 보여질 회원의 최대 수 (몇개 단위씩 끊어서 볼거냐)
		
		int maxPage; // 가장 마지막 페이지가 몇번째 페이지인지 (즉, 총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		String nickName = request.getParameter("userNickname");
		
		// * listCount : 총 회원 수 (탈퇴한 회원은 제외하고 카운트)
		listCount = new MemberService().selectListCount(nickName);
		
		// System.out.println(listCount);
		
		// * currentPage : 현재페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // "1" -> 1
		
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		//				 (페이지 목록들을 몇개씩 보여지게 할거냐)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 회원의 최대 수
		//				  (회원을 몇명씩 보여지게 할거냐)
		boardLimit = 10;
		
		// * maxPage : 가장 마지막 페이지가 몇번째 페이지인지 (총 페이지 수)
		/*
		 * listCount, boardLimit 에 영향을 받음
		 * 
		 * - 공식 구하기
		 *   단, boardLimit 가 10 이라는 가정 하에 구해보자
		 *   
		 *   	회원의 총 수			boardLimit		maxPage
		 *   	100.0 개		/   10 개 => 10.0		10번 페이지
		 * 		101.0 개		/   10 개 => 10.1		11번 페이지
		 * 		105.0 개		/   10 개 => 10.5		11번 페이지
		 * 		109.0 개		/   10 개 => 10.9		11번 페이지
		 * 		110.0 개		/   10 개 => 11.0		11번 페이지
		 * 		111.0 개		/   10 개 => 11.1		12번 페이지
		 * 		119.0 개		/   10 개 => 11.9		12번 페이지
		 * 		120.0 개		/   10 개 => 12.0		12번 페이지
		 * 		121.0 개		/   10 개 => 12.1		13번 페이지
		 *   => 나눗셈 연산한 결과를 올림처리 해버리면 maxPage 값이 나온다.
		 *   
		 *   1) listCount 를 double 로 형변환
		 *   2) listCount / boardLimit
		 * 	 3) 결과에 올림처리 Math.ceil() 메소드 호출
		 * 	 4) 결과값을 int 로 형변환
		 *   
		 *   maxPage = (int)Math.ceil((double)listCount / boardLimit);
		 */
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// System.out.println(maxPage);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		/*
		 * pageLimit, currentPage 에 영향을 받음
		 * 
		 * - 공식 구하기
		 *   단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자
		 * 
		 * 	 pageLimit 가 10 일 경우
		 * 	 startPage : 1, 11, 21, 31, 41, ...
		 *   => n * 10 + 1 (즉, 10 의 배수값 + 1)
		 * 
		 *   pageLimit 가 5 일 경우
		 *   startPage : 1, 6, 11, 16, 21, ...
		 *   => n * 5 + 1 (즉, 5 의 배수값 + 1)
		 *   
		 *   pageLimit 가 7 일 경우
		 *   startPage : 1, 8, 15, 22, 29, ...
		 *   => n * 7 + 1 (즉, 7 의 배수값 + 1)
		 * 
		 *   즉, startPage = n * pageLimit + 1
		 *   
		 *   pageLimit 가 10 일 경우
		 *   
		 *   currentPage 	startPage
		 *   1				1			=> 0 * pageLimit + 1
		 *   5				1			=> 0 * pageLimit + 1
		 *   9				1			=> 0 * pageLimit + 1
		 *   10				1			=> 0 * pageLimit + 1
		 *   11				11			=> 1 * pageLimit + 1
		 *   15				11			=> 1 * pageLimit + 1
		 *   20				11			=> 1 * pageLimit + 1
		 *   21				21			=> 2 * pageLimit + 1
		 * 
		 *   => 1 ~ 10 : n = 0
		 *   => 11 ~ 20 : n = 1
		 *   => 21 ~ 30 : n = 2
		 *   => 31 ~ 40 : n = 3
		 * 		...
		 * 
		 *   n = (currentPage - 1) / pageLimit
		 * 
		 * 	 공식 합체하기
		 *   startPage = n * pageLimit + 1;
		 *   		   = (currentPage - 1) / pageLimit * pageLimit + 1;
		 */
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝수
		/*
		 * startPage, pageLimit 에 영향을 받음
		 * 단, 종종 maxPage 도 영향을 주긴 함
		 * 
		 * - 공식 구하기
		 *   단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자
		 *   
		 *   startPage : 1 => endPage : 10
		 *   startPage : 11 => endPage : 20
		 * 	 startPage : 21 => endPage : 30
		 *   startPage : 31 => endPage : 40
		 *   ...
		 *   
		 *   endPage = startPage + pageLimit - 1;
		 */
		
		endPage = startPage + pageLimit - 1;
		
		// 만약 startPage 가 51 이여서 endPage 가 60 인데
		// 이 상황에서 애초에 maxPage 가 56 이였다면?
		// => endPage 가 곧 maxPage 로 잡혀야함
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이지 정보들을 하나의 VO 객체로 담아서 보내자
		// => 페이지 정보들을 담을 VO 객체를 정의 
		//    (공지사항, 일반게시판 등에서 공통적으로 쓰일 수 있기에 common 패키지에 만듬)
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
								   boardLimit, maxPage, startPage, endPage);
		
		// pi 를 넘기면서 서비스로 요청 후 결과 받기
		ArrayList<Member> list = new MemberService().selectList(nickName, pi);
		
		// System.out.println(list);
		// System.out.println(pi);
		
		// 응답페이지에서 필요로 하는 데이터 먼저 담기
		// 실제 조회된 리스트 (list), 페이징바 (pi)
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		SubNav sn = new SubNav();
		
		sn.setTitle1("ADMIN PAGE");
		sn.setTitle1Addr("admin.me");
		sn.setTitle2("회원 관리");
		sn.setTitle2Addr("list.me");
		sn.setTitle3("회원정보 조회");
		sn.setActive1("1");
		sn.setActive2("active");
		sn.setActive3("1");
		sn.setActive4("1");
		
		request.setAttribute("sn", sn);
		
		// 응답페이지 포워딩
		request.getRequestDispatcher("views/member/memberListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
