package kh.test.jdbckh.el.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.board.model.dao.BoardDao;
import kh.test.jdbckh.board.model.service.BoardService;
import kh.test.jdbckh.student.model.service.StudentService;

/**
 * Servlet implementation class ElTestController
 */
@WebServlet("/eltest")
public class ElTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		request.setAttribute("a1", "aaa");
		request.setAttribute("volist", new BoardService().selectList());
		request.setAttribute("vo", new StudentService().selectOneStudent("A213046"));
		request.getRequestDispatcher("/WEB-INF/view/eltest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	}

}
