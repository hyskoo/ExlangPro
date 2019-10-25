package kr.ac.exlang.dao;

import java.util.List;

import kr.ac.exlang.model.Board;
import kr.ac.exlang.utill.Pager;

public interface BoardDao {

	List<Board> list(Pager pager);

	int total(Pager pager);

	
}
