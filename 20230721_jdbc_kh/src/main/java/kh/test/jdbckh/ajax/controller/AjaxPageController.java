package kh.test.jdbckh.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.test.jdbckh.department.model.dto.DepartmentDto;
import kh.test.jdbckh.department.model.service.DepartmentService;

/**
 * Servlet implementation class AjaxPageController
 */
@WebServlet("/ajaxtest")
public class AjaxPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		out.print("ctrl-jsp로전달함");
//		out.flush();
//		out.close();
		List<DepartmentDto> deptList = new DepartmentService().selectList();
		Gson gson = new Gson();
		request.setAttribute("deptList", gson.toJson(deptList));
		request.getRequestDispatcher("/WEB-INF/view/ajaxtest.jsp").forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
