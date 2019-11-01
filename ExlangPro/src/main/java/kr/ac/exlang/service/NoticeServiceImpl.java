package kr.ac.exlang.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.exlang.dao.NoticeDao;
import kr.ac.exlang.model.Notice;
import kr.ac.exlang.utill.Pager;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> list(Pager pager) {
		//Pagination 처리 (total)
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Notice notice) {

		dao.add(notice);
	}

	@Override
	public void update(Notice notice) {

		dao.update(notice);
	}

	@Override
	public Notice item(int nId) {

		return dao.item(nId);
	}

	@Override
	public void delete(int nId) {

		dao.delete(nId);
	}


}
