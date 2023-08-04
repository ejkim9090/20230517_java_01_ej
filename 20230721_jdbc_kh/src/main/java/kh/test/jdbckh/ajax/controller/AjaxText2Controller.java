package kh.test.jdbckh.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.test.jdbckh.department.model.dto.DepartmentDto;
import kh.test.jdbckh.department.model.service.DepartmentService;
import kh.test.jdbckh.professor.model.service.ProfessorService;
import kh.test.jdbckh.professor.model.vo.Professor;

/**
 * Servlet implementation class AjaxText2Controller
 */
@WebServlet("/ajax2")
public class AjaxText2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax2 doGet");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax2 doPost");
		List<DepartmentDto> deptList = new DepartmentService().selectList();
		List<Professor> professorList = new ProfessorService().selectList();
		int startPage = 2;
		int endPage = 4;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptList", deptList);
		map.put("profList", professorList);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		Gson gson =  new Gson();
		//String gsonDeptList = gson.toJson(deptList);
		//System.out.println(gsonDeptList);
		System.out.println(gson.toJson(map));
		PrintWriter out = response.getWriter();
		//out.append("{\"k1\":\"abc\",\"k2\":\"12\"}");
//		out.print(gson.toJson(deptList));
		out.print(gson.toJson(map));
		out.flush();
		out.close();
	}

}
