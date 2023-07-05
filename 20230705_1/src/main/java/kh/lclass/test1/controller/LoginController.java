package kh.lclass.test1.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login GET 진입");
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login POST 진입");
		
		// DB 확인하고 오기// TODO
		int result = 1; // 0 이면 로그인실패. 1이면 로그인성공
		if(result > 0) {
			// 로그인 성공하면 
			// 1-메인(/index) 화면으로 이동
			response.sendRedirect(request.getContextPath()+"/index");
		} else {
			// 로그인 실패하면
			// 경고창 띄우고 로그인(/login) 화면으로 이동
			// 경고창 띄우고 메인(/index) 화면으로 이동
		}
		
	}

}
