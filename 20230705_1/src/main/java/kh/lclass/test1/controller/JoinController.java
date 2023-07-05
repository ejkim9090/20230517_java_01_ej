package kh.lclass.test1.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기 Get 들어왔음!!!");
		request.getRequestDispatcher("/WEB-INF/view/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기 POST 들어왔음!!!");
		String id = request.getParameter("mid");
		String pwd = request.getParameter("mpwd");
		System.out.println("id:"+id);
		System.out.println("pwd:"+pwd);
		// DB에 저장함 // TODO
		int result = 1; // 0 이면 저장실패. 1이면 저장성공
		
		if(result > 0) {
			// DB에 잘 저장했다면
			// 1-메인 화면으로 이동
			// 2-로그인 화면으로 이동
			// .jsp 열어주는 것이 아님. url을 /login으로 이동함.
			// 오류 !!! response.sendRedirect("/login");  // 오류
			response.sendRedirect(request.getContextPath()+"/login");
		} else {
			// DB에 저장하지 못했다면
			// 경고창 띄우고 회원가입 화면으로 이동
			// 경고창 띄우고 메인 화면으로 이동
		}
	}

}
