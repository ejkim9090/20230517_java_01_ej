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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax1 doPost");
		String n1 = request.getParameter("n1");
		String n2 = request.getParameter("n2");
		System.out.println("n1:"+n1);
		System.out.println("n2:"+n2);
	}

}
