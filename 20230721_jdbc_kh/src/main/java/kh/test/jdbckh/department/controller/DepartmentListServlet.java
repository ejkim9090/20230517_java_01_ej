package kh.test.jdbckh.department.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.department.model.dto.DepartmentDto;
import kh.test.jdbckh.department.model.service.DepartmentService;

/**
 * Servlet implementation class DepartmentListServlet
 */
@WebServlet("/dept/list")
public class DepartmentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private final int PAGE_SIZE = 10;
	private final int PAGE_BLOCK = 5;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DepartmentService service = new DepartmentService();
/* paging, search 기능
		String searchWord = request.getParameter("searchWord");
		String pageNoStr = request.getParameter("pageNo");
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(pageNoStr);
		} catch (Exception e) {
		}
		List<DepartmentDto> deptList = service.selectList(currentPage, PAGE_SIZE, searchWord);
*/
		List<DepartmentDto> deptList = service.selectList();
		if(deptList != null && deptList.size() > 0) {
			request.setAttribute("deptList", deptList);
			request.getRequestDispatcher("/WEB-INF/view/dept/list.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/main");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
