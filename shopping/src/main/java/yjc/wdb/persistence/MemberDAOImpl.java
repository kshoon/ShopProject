package yjc.wdb.persistence;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import yjc.wdb.domain.Member;

import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.alrListDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mapper.memberMapper";

	@Override
	public Member login(LoginDTO dto) throws Exception {

		// TODO Auto-generated method stub

		return session.selectOne(NAMESPACE + ".login", dto);

	}

	@Override
	public Integer loginCheck(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".loginCheck", dto);

	}

	@Override
	public String getToken(String member_id) throws Exception {
		return session.selectOne(NAMESPACE+".getToken", member_id);
	}

	@Override
	public String getNoToken(int member_no) throws Exception {
		return session.selectOne(NAMESPACE+".getNoToken", member_no);
	}

	@Override
	public void insertAlram(alrListDTO dto) throws Exception {
		session.insert(NAMESPACE+".insertAlram", dto);
		
	}



}