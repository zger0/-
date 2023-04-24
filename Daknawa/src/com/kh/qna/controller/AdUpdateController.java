package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class AdUpdateController
 */
@WebServlet("/adUpdate.ask")
public class AdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int askNo = Integer.parseInt(request.getParameter("ano"));
		String answer = request.getParameter("answerContent");
		
		Qna q = new QnaService().updateAnswer(askNo, answer);
		
		request.setAttribute("q", q);
		
		request.getRequestDispatcher("views/admin/answerUpdateForm.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
