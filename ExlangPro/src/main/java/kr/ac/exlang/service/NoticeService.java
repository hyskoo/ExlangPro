package kr.ac.exlang.service;

import java.util.List;

import kr.ac.exlang.model.Notice;
import kr.ac.exlang.utill.Pager;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice notice);

	Notice item(int nId);

	void update(Notice notice);

	void delete(int nId);

	

}