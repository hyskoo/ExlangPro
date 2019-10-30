package kr.ac.exlang.service;

import java.util.List;

import kr.ac.exlang.model.Member;

public interface MemberService {
	
	Member list(String mId);

	void update(Member member);

	void delete(String mId);

	Member login(Member member) throws Exception;

	void signup(Member member);

	int idch(String mId);

	List<Member> indexlist();

}
