package kh.test.jdbckh.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxTestController
 */
@WebServlet("/ajax1")
public class AjaxTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax1 doGet");
		String n1 = request.getParameter("n1");
		String n2 = request.getParameter("n2");
		System.out.println("n1:"+n1);
		System.out.println("n2:"+n2);
		// JSP로 데이터 전달
		// request.setAttribute 사용 불가
		// out는 원래 browser화면 display 용도 였으나, 그 쓸모가 없어져서.. 지금은 ajax 경우 데이터 전달용으로 사용됨.
		// javascript가 인지할 수 있는 자료형으로 전달해야함.
		PrintWriter out = response.getWriter();
		//out.print("ctrl-jsp로전달함");
		out.print("학생 실패하였습니다.");
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax1 doPost");
		String n1 = request.getParameter("n1");
		String n2 = request.getParameter("n2");
		System.out.println("n1:"+n1);
		System.out.println("n2:"+n2);
	}

}
