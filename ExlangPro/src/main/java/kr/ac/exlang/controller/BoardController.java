package kr.ac.exlang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.exlang.model.Board;
import kr.ac.exlang.service.BoardService;
import kr.ac.exlang.utill.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";
	 
	@Autowired
	BoardService service;
	
	/**
 	 * @param Model, Pager
 	 * @return list.jsp
 	 * @brief path라는 스트링 변수 선언으로 "board/"대신 path를 이용 
 	 */
	@RequestMapping("/list")
	String list(Model model, Pager pager) {

		List<Board> list = service.list(pager);
		
		model.addAttribute("list", list);		
		
		return path + "list";
	}
	
	/**
 	 * @param 
 	 * @return Info.jsp
 	 * @brief 
 	 */
	@RequestMapping("/Info")
	String info() {
		
		return path + "Info";
	}
}
