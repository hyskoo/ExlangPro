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
	
	/**
 	 * @param Model, HttpSession, mId
 	 * @return update.jsp
 	 * @brief 회원 정보 수정을 위해서 mId에 해당하는 회원의 정보를 가져온다.
 	 * mId는 update.jsp에서 ${SessionScope.login_id}를 통해 url과 함께 보내준다
 	 */
	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(String mId, Model model) {

		Member list = service.list(mId);
		
		model.addAttribute("list", list);
		
		return path + "update";
	}
	
	/**
 	 * @param Member
 	 * @return RequestMapping("/")
 	 * @brief 변경된 회원의 정보를 Member.java통해 Get Set후에 DB에 저장
 	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	String update(Member member) {
		
		service.update(member);
		
		return "redirect:/";
	}
	
	/**
 	 * @param mId
 	 * @return RequestMapping("/")
 	 * @brief Session에 있는 내용을 삭제 한후 mId에 해당하는 회원의 정보를 모두 삭제. 
 	 */
	@RequestMapping("/delete")
	String delete(String mId, HttpSession session) {
		session.invalidate();
		service.delete(mId);
		
		return "redirect:/";
	}
	

	
}
