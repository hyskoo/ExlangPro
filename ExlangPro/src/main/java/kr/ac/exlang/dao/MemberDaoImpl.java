package kr.ac.exlang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.ac.exlang.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public Member list(String mId) {
		
		return sql.selectOne("member.list", mId);
	}

	@Override
	public void update(Member member) {
		
		sql.update("member.update", member);
	}

	@Override
	public void delete(String mId) {

		sql.delete("member.delete", mId);
	}

	@Override
	public void signup(Member member) {
		
		sql.insert("member.signup", member);
	}

	@Override
	public int idch(String mId) {

		return sql.selectOne("member.idcheck", mId);
	}

	@Override
	public Member login(Member member) throws Exception {
		
		
		return sql.selectOne("member.login", member);
	}

}
