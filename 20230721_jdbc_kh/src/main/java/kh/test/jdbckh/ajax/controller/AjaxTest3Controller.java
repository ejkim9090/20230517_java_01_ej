package kh.test.jdbckh.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.member.model.dto.Member;
import kh.test.jdbckh.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxTest3Controller
 */
@WebServlet("/ajax3")
public class AjaxTest3Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ajax3 doGet()");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/ajax3 doPost()");
		String mid = request.getParameter("mid");
		String mpwd = request.getParameter("mpwd");
		System.out.println(mid);
		System.out.println(mpwd);
		
		
		
		Member vo = new Member(mid, mpwd);
		//String result = new MemberService().login(mid);
		int result = 1;
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
	}

}
