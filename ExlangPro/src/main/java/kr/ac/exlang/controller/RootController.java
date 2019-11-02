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
	
	/**
 	 * @param Model
 	 * @return index.jsp
 	 * @brief Member의 내용을 index.jsp에 보여주기 위해서 Model을 활용
 	 */
	@RequestMapping("/")
	String index(Model model) {
		
		List <Member> list = service.indexlist();
		
		model.addAttribute("list", list);
		
		return "index";
	}
	
	/**
 	 * @param 
 	 * @return signup.jsp
 	 * @brief 회원가입을 위한 signup.jsp를 보여주기 위한것
 	 */
	@RequestMapping(value="signup", method=RequestMethod.GET)
	String signup() {
		return "signup";
	}
	/**
 	 * @param Member
 	 * @return RequestMapping("/")
 	 * @brief 변경된 회원의 정보를 Member.java통해 Get Set후에 DB에 저장
 	 */
	@RequestMapping(value="signup", method=RequestMethod.POST)
	String signup(Member member) {

		service.signup(member);
		
		return "redirect:/";
	}
	/**
 	 * @param FileUpload
 	 * @return Json
 	 * @brief 한글깨짐을 위해 produces 설정. 업로드 된 파일의 위치를 D://upload/signup 폴더에 저장. 
 	 * 		  Json형태로 값을 보내기 위해서 return 형식을 json형식으로 강제로 입력. 
 	 * 		  @ResponseBody는 Ajax통신을 위해사용.
 	 */
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
	
	/**
 	 * @param 
 	 * @return login.jsp
 	 * @brief 로그인을 위한 login.jsp를 보여주기 위한것
 	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	String loginGET() {	

		return "/login";
	} 
	
	/**
 	 * @param Member, HttpSession, Model
 	 * @return Stirng "1" or "0"
 	 * @brief 입력받은 mId와 mPw를 DB와의 통신을 통하여 가져온후 값이 null이 아니면 "1"을 return. Session에 값을 저장
 	 * 		  @ResponseBody는 Ajax통신을 위해사용.
 	 */
	@ResponseBody
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPOST(Member member, HttpSession session, Model model) throws Exception {
		
		Member login = service.login(member);
		
		model.addAttribute("member", login);
		
		if(login != null) {
			session.setAttribute("login_id", login.getmId());
			session.setAttribute("login_pw", login.getmPw());
			session.setAttribute("auth", login.getmAuth());

			return "1";
		} else {
			
			return "0";
		}
//		"login" 이름은 Interceptor에서 받아오는 Session의 이름 login에서 id값만 세션에 저장
	
		
	}
	
	/**
 	 * @param HttpSession
 	 * @return RequestMapping("/")
 	 * @brief Session값을 초기화 시킨다.
 	 */
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	/**
 	 * @param mId
 	 * @return 1 or null
 	 * @brief 회원가입시 ID 중복확인. @ResponseBody는 Ajax통신을 위해사용.
 	 */
	@ResponseBody
	@RequestMapping(value="/ajax/idch", method=RequestMethod.POST)
	int idch(String mId) {
		
		return service.idch(mId);
	}
	
}
