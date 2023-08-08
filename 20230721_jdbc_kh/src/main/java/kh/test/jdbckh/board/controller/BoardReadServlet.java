package kh.test.jdbckh.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.board.model.dto.BoardDto;
import kh.test.jdbckh.board.model.service.BoardService;

/**
 * Servlet implementation class BoardReadController
 */
@WebServlet("/board/read")
public class BoardReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		service = new BoardService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if(bnoStr != null && !bnoStr.trim().equals("")) {
			try {
				bno = Integer.parseInt(bnoStr);
			}catch (Exception e) {
				request.getSession().setAttribute("successFailMsg", "존재하지 않는 게시글입니다. 목록에서 다시 선택해주세요.");
				response.sendRedirect(request.getContextPath()+"/board/list");
				return;
			}
		}
		
		BoardDto dto = service.selectOne(bno);
		request.setAttribute("bvo", dto);
		request.getRequestDispatcher("/WEB-INF/view/board/read.jsp").forward(request, response);
	}

	private  void getWorknet(String region, String occupation) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("authKey","UTF-8") + "=WNLBET6R0WPQK95R8VLU02VR1HJ"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml)*/
	        urlBuilder.append("&" + URLEncoder.encode("callTp","UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /*L(목록), D(상세)*/
	        urlBuilder.append("&" + URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*페이지번호 - 수정4!!*/
	        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//	        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("11000", "UTF-8")); /*지역-서울*/
	        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("41000", "UTF-8")); /*지역-경기*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("024", "UTF-8")); /*직종-소프트웨어*/
	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("025", "UTF-8")); /*직종-데이터&네트워크*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("017", "UTF-8")); /*직종-경영지원*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("018", "UTF-8")); /*직종-회계,경리*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026201", "UTF-8")); /*직종-인사*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026301", "UTF-8")); /*직종-총무*/
	 
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        // XML parse 통해서 VO 형태에 담기
	        
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	    }
}
