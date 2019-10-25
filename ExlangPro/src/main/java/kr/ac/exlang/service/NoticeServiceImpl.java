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

		return dao.list(pager);
	}

	@Override
	public void add(Notice notice) {

		dao.add(notice);
	}

	@Override
	public void update(Notice notice) {
//		String mid = notice.getmId();
//		int nid = notice.getnId();
//		Date date = notice.getnDate();
//		
//		System.out.println(mid);
//		System.out.println(nid);
//		System.out.println(date);
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
