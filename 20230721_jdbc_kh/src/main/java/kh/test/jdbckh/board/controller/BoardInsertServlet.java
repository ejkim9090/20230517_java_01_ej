package kh.test.jdbckh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.test.jdbckh.board.model.dto.AttachFileDto;
import kh.test.jdbckh.board.model.dto.BoardDto;
import kh.test.jdbckh.board.model.service.BoardService;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService service = new BoardService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/board/insert doGet()");
		
		String mid = (String)request.getSession().getAttribute("SsLoginId");  // TODO: 임시작성자 - 로그인한 id로 변경
		if(mid == null || mid.equals("")) {
			request.getSession().setAttribute("msg", "로그인하여야 글등록이 가능합니다.");
			response.sendRedirect(request.getContextPath()+"/login");
		}
		
		
		// 답글작성시 참조글번호
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if(bnoStr != null && !bnoStr.equals("")) {
			try {
				bno = Integer.parseInt(bnoStr);
				request.setAttribute("bno", bnoStr);
			}catch (Exception e) {
				e.printStackTrace();
				// 숫자로 못바꾸면 답글작성에 실패한것으로 간주함.
				// 오류 페이지로 이동함.
				// TODO
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/view/board/insert.jsp").forward(request, response);
	}

// file 이 request에 실려오는 경우 
// common-io.jar + common-upload.jar 라는 jar 의 도움
// cos.jar 의 도움을 받아야함.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/board/insert POST!!!!");
		
		// file이 저장될 위치는 서버WAS 안에 넣어줘야 하므로 위치는 getRealPath() 메소드를 활용함.
		String uploadPath = getServletContext().getRealPath("resources/upload");
		//System.out.println(getServletContext().getRealPath("./"));
		System.out.println(uploadPath);
		// 폴더만들기
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		int uploadSizeLimit = 10485760; // 10M라면 10*1024*1024, 업로드 파일 크기 제한
		String encType ="UTF-8";// 인코딩 방식
		MultipartRequest multiReq = new MultipartRequest(
				request,
				uploadPath, // 서버WAS상 업로드 될 디렉토리
				uploadSizeLimit, // 업로드 파일 크기 제한
				encType, // 인코딩 방식
				new DefaultFileRenamePolicy()// 동일한 이름이 업로드될 디렉토리에 있을때 새 이름 부여방식
				);   // new MultipartRequest ()로 객체생성하면 이미 uploadPath 에 file들은 이미 저장 끝.
		List<AttachFileDto> attachFileList = new ArrayList<AttachFileDto>();
		// 이미 저장이된 파일이름들을 찾아오기
		Enumeration<?> files = multiReq.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();  // a1 // input type="file" name="a1"
			String filename = multiReq.getFilesystemName(name);  // 서버에 저장된 파일명
			String filenameOrignal = multiReq.getOriginalFileName(name);  // 클라이언트가 선택한 파일명
			System.out.println(name+ " : "+ filename +" : " + filenameOrignal);
			AttachFileDto dto = new AttachFileDto("resources/upload/"+filename);
			attachFileList.add(dto);
		}
		
		String btitle = multiReq.getParameter("btitle");
		String bcontent = multiReq.getParameter("bcontent");
// request.getParameter 로 읽어올수 없음.		
//		String btitle = request.getParameter("btitle");
//		String bcontent = request.getParameter("bcontent");
//		String[] fileList = request.getParameterValues("a1");
		System.out.println(btitle);
		System.out.println(bcontent);
		System.out.println(attachFileList);
		
		String mid = (String)request.getSession().getAttribute("SsLoginId");  // TODO: 임시작성자 - 로그인한 id로 변경
		if(mid == null || mid.equals("")) {
			request.getSession().setAttribute("msg", "로그인하여야 글등록이 가능합니다.");
			response.sendRedirect(request.getContextPath()+"/login");
		}
		
		// 답글작성시 참조글번호
		String bnoStr = multiReq.getParameter("bno");
		System.out.println("bnoStr: "+ bnoStr);
		int bno = 0;
		if(bnoStr != null && !bnoStr.equals("")) {
			try {
				bno = Integer.parseInt(bnoStr);
			}catch (Exception e) {
				e.printStackTrace();
				// 숫자로 못바꾸면 답글작성에 실패한것으로 간주함.
				// 오류 페이지로 이동함.
				// TODO
			}
		}
		
		// bno : 0이면 원본글, 그외 답글의 참조번호a
		int result  = service.insert(new BoardDto(bno, btitle, bcontent, mid), attachFileList);
		if(result < 0) {
			// 오류 발생
			// 오류 페이지로 이동함.
			// TODO
		}
		response.sendRedirect(request.getContextPath()+"/board/list");
	}

}
