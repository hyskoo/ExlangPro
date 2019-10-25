package kr.ac.exlang.dao;

import java.util.List;

import kr.ac.exlang.model.Member;

public interface MemberDao {

	Member list(String mId);

	void update(Member member);

	void delete(String mId);
	
	Member login(Member member) throws Exception;

	void signup(Member member);

	int idch(String mId);

}
