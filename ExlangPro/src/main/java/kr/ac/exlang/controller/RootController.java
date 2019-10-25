package kr.ac.exlang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.exlang.model.FileUpload;
import kr.ac.exlang.model.Member;
import kr.ac.exlang.service.MemberService;

@Controller
@RequestMapping("/")
public class RootController {

	ArrayList<FileUpload> filelist = new ArrayList<FileUpload>();
	
	Logger logger = LoggerFactory.getLogger(RootController.class);
	
	@Autowired
	MemberService service;	
	
	@RequestMapping("/")
	String index() {
		
		return "index";
	}

	@RequestMapping(value="signup", method=RequestMethod.GET)
	String signup(Model model) {
		
		model.addAttribute("list", filelist);
		
		return "signup";
	}
	
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	String signup(Member member) {
		
		System.out.println(member.getmName());
		System.out.println(member.getmImg());
		
		service.signup(member);
		
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value="/upload", method=RequestMethod.POST, produces="application/json; charset=utf8")
	String upload(FileUpload fileupload) {
		if(fileupload.transferTo("d://upload/signup/")) {
			filelist.add(fileupload);
			
			logger.info("파일이름 : " + fileupload.getFilename());
			
			return "{\"result\": true, \"filename\": \"" + fileupload.getFilename() + "\"}";
//			return "{\"result\": true, \"filename\": \"" + fileupload.getFilename() + "\", \"filesize\": "+fileupload.getFilesize() +"}";
		}
		
		
		return "(\"redirect\": false)";
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
//	public void loginGET(@ModelAttribute("loginlist") Member member, Model model) {
//		
//		
//	} 
	//	@ModelAttribute (객체) 는 해당객체를 자동으로 view까지 보내주는 역할을 한다.
	String loginGET() {	

		return "/login";
	} 
	
	@ResponseBody
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPOST(Member member, HttpSession session, Model model) throws Exception {
		
		Member login = service.login(member);
		
		model.addAttribute("member", login);
		
		if(login != null) {
			session.setAttribute("login_id", login.getmId());
			session.setAttribute("login_pw", login.getmPw());
			session.setAttribute("auth", login.getmAuth());
			
//			System.out.println(session.getAttribute("login_id"));
//			System.out.println(session.getAttribute("login_pw"));
//			System.out.println(session.getAttribute("auth"));
			
			return "1";
		} else {
			
			return "0";
		}
//		"login" 이름은 Interceptor에서 받아오는 Session의 이름 login에서 id값만 세션에 저장
	
		
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax/idch", method=RequestMethod.POST)
	int idch(String mId) {
		
		return service.idch(mId);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax/loginch", method=RequestMethod.POST)
	int loginch(String mId) {
		
		return service.idch(mId);
	}
	
}
