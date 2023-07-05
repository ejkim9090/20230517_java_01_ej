package kh.lclass.first.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstController
 */
@WebServlet("/first")
public class FirstController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstController() {
        super();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 문자 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 테스트 방법은 브라우저 url에 127.0.0.1:8090/20230704_first/first?n1=v1 입력하고 request함
		System.out.println(request.getParameter("n1"));
//		response.getWriter().append("<!DOCTYPE html>");
//		response.getWriter().append("<html lang=\"en\">");
//		response.getWriter().append("<head>");
//		//... 위 코드처럼 
//		response.getWriter().append("<h1>당신은 n1에 "+ request.getParameter("n1")+"에 대한 요청을 하셨군요.</h1> 그 대답은 ");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		// js document.write("");
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
