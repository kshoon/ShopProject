package yjc.wdb.persistence;


import yjc.wdb.domain.Member;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.alrListDTO;


public interface MemberDAO {

	public Member login(LoginDTO dto) throws Exception;
	public Integer loginCheck(LoginDTO dto) throws Exception;
	public String getToken(String member_id) throws Exception;
	public String getNoToken(int member_no) throws Exception;
	public void insertAlram(alrListDTO dto) throws Exception;
}