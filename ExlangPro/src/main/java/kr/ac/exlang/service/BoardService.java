package kr.ac.exlang.service;

import java.util.List;

import kr.ac.exlang.model.Board;
import kr.ac.exlang.utill.Pager;

public interface BoardService {

	List<Board> list(Pager pager);

}
