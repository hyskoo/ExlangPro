package kr.ac.exlang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.exlang.model.FileUpload;
import kr.ac.exlang.model.Notice;
import kr.ac.exlang.service.MemberService;
import kr.ac.exlang.service.NoticeService;
import kr.ac.exlang.utill.Pager;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	
	ArrayList<FileUpload> filelist = new ArrayList<FileUpload>();
	
	Logger logger = LoggerFactory.getLogger(RootController.class);
	
	@Autowired
	NoticeService service;
	
	@Autowired
	MemberService mservice;
	
	/**
 	 * @param Pager, Model
 	 * @return list.jsp
 	 * @brief 공지사항에 대한 리스트를 보여주는 페이지 Session_auth를 통해서 권한을 확인하여 글작성 여부 확인
 	 */
	@RequestMapping("/list")
	String list(Pager pager, Model model) {

		List<Notice> list = service.list(pager);
		
		model.addAttribute("list",list);

		return path + "list";
	}
	
	/**
 	 * @param Model, Pager, nId
 	 * @return view.jsp
 	 * @brief 공지사항 글내용을 보여줌. Pager는 list에서 사용하는것을 사용 
 	 * @see
 	 */
	@RequestMapping("/view")
	String view(int nId, Model model, Pager pager) {
		
		Notice notice = service.item(nId);
		
		model.addAttribute("item", notice);
		
		//타 게시물 확인 및 Paging 처리
		List<Notice> list = service.list(pager);
		
		model.addAttribute("list",list);
		
		return path + "view";
	}	
	
	/**
 	 * @param 
 	 * @return add.jsp
 	 * @brief add.jsp를 보여주기 윈한 맵핑. GET방식
 	 */
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add() {
		
		return path + "add";
	}
	/**
 	 * @param Notice., Session
 	 * @return RequestMapping("/list")
 	 * @brief 글작성시 작성자를 알기하기 위해 Session에 있는 login_id값을 Notice에 있는 mId에 Set.
 	 * 		  변경된 회원의 정보를 Notice.java통해 Get Set후에 DB에 저장
 	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	String add(Notice notice, HttpSession session) {
		
		//session에서 넘어오는 값은 전부 object값이므로 형변환을 해야한다.
		notice.setmId((String) session.getAttribute("login_id"));
		
		
		service.add(notice);
		
		return "redirect:list";
	}
	
	/**
 	 * @param FileUpload, Notice
 	 * @return Json
 	 * @brief 한글깨짐을 위해 produces 설정. 업로드 된 파일의 위치를 D://upload/notice 폴더에 저장. 
 	 * 		  Json형태로 값을 보내기 위해서 Map을 이용해서 변경. 
 	 * 		  Pom.xml에 jackson Dependency추가 
 	 * 		  @ResponseBody는 Ajax통신을 위해사용.
 	 */
	@ResponseBody
	@RequestMapping(value="/upload", method=RequestMethod.POST, produces="application/json; charset=utf8")
	String upload(FileUpload fileupload, Notice notice) throws JsonProcessingException {
		if(fileupload.transferTo("d://upload/notice/")) {
			filelist.add(fileupload);
			
//			logger.info("파일이름 : " + fileupload.getFilename());
			
			ObjectMapper mapper = new ObjectMapper(); String json2 = ""; 
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("result", "true"); 
			map2.put("url", "/upload/notice/" + fileupload.getFilename()); 
			//데이터를 넘길때 servlet-context에서 upload로 잡혀있으므로 파일경로를 위와같이 잡아줘야한다.
			
			json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map2);
			json2 = mapper.writeValueAsString(map2);
//			System.out.println(json2);

			return json2;
		}
		return "(\"redirect\": false)";
		
	}

	/**
 	 * @param Model, nId
 	 * @return update.jsp
 	 * @brief 글수정을 위해서 update.jsp페이지를 보여주기 위한것. nId를 통해서 회원의 정보를 가져와서 페이지에 보여준다.
 	 */
	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(int nId, Model model) {
		
		Notice notice = service.item(nId);
		
		model.addAttribute("item", notice);
		
		return path + "update";
	}
	/**
 	 * @param Notice., Session
 	 * @return RequestMapping("/list")
 	 * @brief 글수정시 작성자를 알기하기 위해 Session에 있는 login_id값을 Notice에 있는 mId에 Set
 	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	String update(Notice notice, HttpSession session) {
		
		//session에서 넘어오는 값은 전부 object값이므로 형변환을 해야한다.
		notice.setmId((String) session.getAttribute("login_id"));
		
		service.update(notice);
		
		return "redirect:list";
	}
	
	/**
 	 * @param nId
 	 * @return RequestMapping("/list")
 	 * @brief 글삭제를 위해서 nId값을 이용
 	 */
	@RequestMapping("/delete")
	String delete(int nId) {
		
		service.delete(nId);
		
		return "redirect:list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

