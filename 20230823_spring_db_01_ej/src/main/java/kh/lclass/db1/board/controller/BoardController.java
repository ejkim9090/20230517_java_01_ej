package kh.lclass.db1.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.db1.board.model.service.BoardService;
import kh.lclass.db1.board.model.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("boardList", boardService.selectList());
		return "board/list";
	}
	@GetMapping("/get")
	public String get(Model model
			// 방법 1 , HttpServletRequest request
			, int bno // 방법 2
			, String a
			) {
		System.out.println(bno);
		System.out.println(a);
		// 방법 1 		int bno = Integer.parseInt(request.getParameter("bno"));
		model.addAttribute("boardvo", boardService.selectOne(bno));
		return "board/get";
	}
	@GetMapping("/insert")
	public String insert() {
		return "board/insert";
	}
	@PostMapping("/insert")
	public String insertDo(
			// 방법 1 HttpServletRequest request
			BoardVo vo
			, String btitle
			) {
		// 방법 1
//		String btitle = request.getParameter("btitle");
//		String bcontent = request.getParameter("bcontent");
//		BoardVo vo = new BoardVo();
//		vo.setBcontent(bcontent);
//		vo.setBtitle(btitle);
		System.out.println(vo);
		System.out.println(btitle);
		
		// 절대위치 작성하면 됨.
		return "redirect:/board/list";
	}
}
