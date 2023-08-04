package kh.test.jdbckh.student.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.department.model.dto.DepartmentDto;
import kh.test.jdbckh.department.model.service.DepartmentService;
import kh.test.jdbckh.professor.model.service.ProfessorService;
import kh.test.jdbckh.professor.model.vo.Professor;
import kh.test.jdbckh.student.model.service.StudentService;

/**
 * Servlet implementation class StudentInsertServlet
 */
@WebServlet("/student/insert")
public class StudentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DepartmentService serviceDept = new DepartmentService();
	private ProfessorService serviceProf = new ProfessorService();
//	private StudentService serviceStd = new StudentService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. session 객체에 실린 msg 처리
		if(request.getSession().getAttribute("msg") instanceof String) {
			String msg = (String)request.getSession().getAttribute("msg");
			request.getSession().removeAttribute("msg");
			request.setAttribute("msg", msg);
		}		
		
		// 1. 전달받은 parameter 읽어내기
		// 2. 전달받은 데이터를 활용해 DB 정보 가져오기
		// 학과번호, 지도교수번호 
		List<DepartmentDto> deptList = serviceDept.selectListForStudent();
		List<Professor> profList = serviceProf.selectList();
		// 3. DB로부터 전달받은 데이터를 JSP에 전달함.
		if(deptList != null && deptList.size()>0) {
			request.setAttribute("deptList", deptList);
		}
		if(profList != null && profList.size() > 0) {
			request.setAttribute("profList", profList);
		}
		// 4. JSP 파일 forward로 열기		
		request.getRequestDispatcher("/WEB-INF/view/student/insert.jsp").forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}
}
