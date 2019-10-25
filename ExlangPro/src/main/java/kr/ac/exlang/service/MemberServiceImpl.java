package kr.ac.exlang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.exlang.dao.MemberDao;

import kr.ac.exlang.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public Member list(String mId) {

		return dao.list(mId);
	}

	@Override
	public void update(Member member) {
		
		dao.update(member);
	}

	@Override
	public void delete(String mId) {
		
		dao.delete(mId);
	}

	@Override
	public void signup(Member member) {

		dao.signup(member);
	}

	@Override
	public int idch(String mId) {

		return dao.idch(mId);
	}

	@Override
	public Member login(Member member) throws Exception {
		
		return dao.login(member);
	}

}
