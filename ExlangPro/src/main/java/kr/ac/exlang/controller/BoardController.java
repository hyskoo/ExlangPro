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
	
	@RequestMapping("/list")
	String list(Model model, Pager pager) {

		List<Board> list = service.list(pager);
		
		model.addAttribute("list", list);		
		
		return path + "list";
	}
	
	@RequestMapping("/InformationUse")
	String info() {
		
		return path + "InformationUse";
	}
}
