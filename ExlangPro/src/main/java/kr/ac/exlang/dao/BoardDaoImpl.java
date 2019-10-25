package kr.ac.exlang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.exlang.model.Board;
import kr.ac.exlang.utill.Pager;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> list(Pager pager) {

		return sql.selectList("board.list", pager);
	}

	@Override
	public int total(Pager pager) {		
		return sql.selectOne("board.total", pager);
	}

}
