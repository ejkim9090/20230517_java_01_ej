package kh.lclass.db1.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.lclass.db1.member.model.service.MemberService;
import kh.lclass.db1.member.model.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/list")
	public String list(Model model
			//, HttpServletRequest request, HttpServletResponse response
			) {
		List<MemberVo> volist = memberService.selectList();
		//request.setAttribute("memberList", volist);   
		model.addAttribute("memberList", volist);   
		return "member/list";
	}
	@GetMapping("/member/get")
	public String get(Model model) {
		//TODO: model.addAttribute("membervo", memberService.selectOne());
		return "member/get";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "login";
	}
}
