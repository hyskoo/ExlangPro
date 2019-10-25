package kr.ac.exlang.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.exlang.model.Member;
import kr.ac.exlang.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	final String path = "member/";
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(String mId, Model model, HttpSession session) {
		
		session.getAttribute("login");
		
		Member list = service.list(mId);
		
		model.addAttribute("list", list);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	String update(Member member) {
		
		System.out.println(member.getmImg());
		System.out.println(member.getmGender());
		
		service.update(member);
		
		return "redirect:/";
	}
	
	@RequestMapping("/delete")
	String delete(String mId) {
		
		service.delete(mId);
		
		return "/";
	}
	

	
}
