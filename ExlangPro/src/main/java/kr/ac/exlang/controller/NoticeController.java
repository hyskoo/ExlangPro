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
	
	@RequestMapping("/list")
	String list(Pager pager, Model model, HttpSession session) {
		
		session.getAttribute("auth");
		session.getAttribute("login_id");
		session.getAttribute("login_pw");
		
		List<Notice> list = service.list(pager);
				
		model.addAttribute("list",list);
		
//		System.out.println(session.getAttribute("auth"));
//		System.out.println(session.getAttribute("login_id"));
		return path + "list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add() {
		
		return path + "add";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	String add(Notice notice, HttpSession session) {
		
		//session에서 넘어오는 값은 전부 object값이므로 형변환을 해야한다.
		notice.setmId((String) session.getAttribute("login_id"));
		
		
		service.add(notice);
		
		return "redirect:list";
	}
	
	@ResponseBody
	@RequestMapping(value="/upload", method=RequestMethod.POST, produces="application/json; charset=utf8")
	String upload(FileUpload fileupload, Notice notice) throws JsonProcessingException {
		if(fileupload.transferTo("d://upload/notice/")) {
			filelist.add(fileupload);
			
			notice.setnImg(fileupload.getFilename());
			
			logger.info("파일이름 : " + fileupload.getFilename());
			
			ObjectMapper mapper = new ObjectMapper(); String json2 = ""; 
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("result", "true"); 
			map2.put("url", "${pageContext.request.contextPath}d://upload/notice/" + fileupload.getFilename()); 
			
			json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map2);
			json2 = mapper.writeValueAsString(map2);
			System.out.println(json2);

			return json2;
			
			

		}
		
		
		return "(\"redirect\": false)";
		
	}
	
	
	@RequestMapping("/view")
	String view(int nId, Model model) {
		
		Notice notice = service.item(nId);
		
		model.addAttribute("item", notice);
		
		return path + "view";
	}	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(int nId, Model model) {
		
		Notice notice = service.item(nId);
		
		model.addAttribute("item", notice);
		
		return path + "update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	String update(Notice notice, HttpSession session) {
		
		//session에서 넘어오는 값은 전부 object값이므로 형변환을 해야한다.
		notice.setmId((String) session.getAttribute("login_id"));
		
		service.update(notice);
		
		return "redirect:list";
	}
	
	
	@RequestMapping("/delete")
	String delete(int nId) {
		
		service.delete(nId);
		
		return "redirect:list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

