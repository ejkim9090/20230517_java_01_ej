package kh.test.jdbckh.student.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.student.model.service.StudentService;
import kh.test.jdbckh.student.model.vo.StudentVo;

/**
 * Servlet implementation class StudentInsertDoServlet
 */
@WebServlet("/student/insert.do")
public class StudentInsertDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentInsertDoServlet() {
        super();
    }
// doGet() 메소드 삭
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentNo = request.getParameter("studentNo");
		String departmentNo = request.getParameter("departmentNo");
		String studentName = request.getParameter("studentName");
		String studentSsn = request.getParameter("studentSsn");
		String studentAddress = request.getParameter("studentAddress");
		//오류 Date entranceDate = request.getParameter("entranceDate");
		String entranceDateStr = request.getParameter("entranceDate");
		String absenceYn = request.getParameter("absenceYn");
		String coachProfessorNo = request.getParameter("coachProfessorNo");
		StudentVo vo = new StudentVo(studentNo, departmentNo, studentName, studentSsn, studentAddress, absenceYn, coachProfessorNo);
//		StudentVo vo = new StudentVo();
//		vo.setAbsenceYn(absenceYn);
//		vo.setCoachProfessorNo(coachProfessorNo);
//		vo.setDepartmentNo(departmentNo);
//		vo.setEntranceDate(null);
//		vo.setStudentAddress(studentAddress);
//		vo.setStudentAddress(studentAddress);
//		vo.setStudentName(studentName);
//		vo.setStudentNo(studentNo);
//		vo.setStudentSsn(studentSsn);
		System.out.println("[insert servlet] "+vo);
		
		
		
		StudentService service = new StudentService();
		int result = service.insertStudent(vo);
		
//		if(result < 1) {
//		//TODO
//		}
		response.sendRedirect(request.getContextPath()+"/student/list");		
	
	}

}
