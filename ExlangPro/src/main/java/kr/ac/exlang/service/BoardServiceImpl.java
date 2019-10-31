package kr.ac.exlang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.exlang.dao.BoardDao;
import kr.ac.exlang.model.Board;
import kr.ac.exlang.utill.Pager;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<Board> list(Pager pager) {
		//Pagination 처리 (total)
		int total = dao.total(pager);
		pager.setTotal(total);

		return dao.list(pager);
	}

}
