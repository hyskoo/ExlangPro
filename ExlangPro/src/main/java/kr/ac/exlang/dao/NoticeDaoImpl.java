package kr.ac.exlang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.exlang.model.Notice;
import kr.ac.exlang.utill.Pager;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list(Pager pager) {
		return sql.selectList("notice.list", pager);
	}

	@Override
	public void add(Notice notice) {
		sql.insert("notice.add", notice);
	}

	@Override
	public Notice item(int nId) {
		return sql.selectOne("notice.item", nId);
	}

	@Override
	public void update(Notice notice) {
		
//		System.out.println(notice.getmId());
//		System.out.println(notice.getnId());
		
			
		sql.update("notice.update", notice);
	}

	@Override
	public void delete(int nId) {
		sql.delete("notice.delete", nId);
	}

}
