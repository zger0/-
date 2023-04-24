package com.kh.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class AdInsertAnswerController
 */
@WebServlet("/adAnswer.ask")
public class AdInsertAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdInsertAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		int askNo = Integer.parseInt(request.getParameter("askNo"));
		String answerContent = request.getParameter("answerContent");
				
		int result = new QnaService().insertAnswer(askNo, answerContent);
		
		if(result > 0) { // 성공
			
			request.getSession().setAttribute("alertMsg", "답변 등록에 성공했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/adAnswerList.ask");
			
		} else { // 실패
			
			request.getSession().setAttribute("alertMsg", "답변 등록에 실패했습니다. 다시 시도해 주세요.");
			
			response.sendRedirect(request.getContextPath() + "/adAnswerForm.ask");
			
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
