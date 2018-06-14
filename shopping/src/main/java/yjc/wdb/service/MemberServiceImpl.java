package yjc.wdb.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Member;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.alrListDTO;
import yjc.wdb.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public Member login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public Integer loginCheck(LoginDTO dto) throws Exception {
		dto.setMember_id(dto.getMember_id());
		dto.setMember_pw(dto.getMember_pw());


		int result = dao.loginCheck(dto);

		System.out.println(result);

		return result;

	}

	@Override
	public String getToken(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getToken(member_id);
	}

	@Override
	public String getNoToken(int member_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getNoToken(member_no);
	}

	@Override
	public void insertAlram(alrListDTO dto) throws Exception {
		dao.insertAlram(dto);
		
	}




	

}