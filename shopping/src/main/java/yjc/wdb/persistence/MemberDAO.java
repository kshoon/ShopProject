package yjc.wdb.persistence;


import yjc.wdb.domain.Member;
import yjc.wdb.dto.LoginDTO;


public interface MemberDAO {

	public Member login(LoginDTO dto) throws Exception;
	public Integer loginCheck(LoginDTO dto) throws Exception;
	public String getToken(String member_id) throws Exception;
}