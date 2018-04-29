package yjc.wdb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.dto.LoginDTO;

@Repository
public class ShopDAOimpl implements ShopDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mapper.testMapper";

	@Override
	public List<Product> searchPro(SearchKeyword sk) throws Exception{
		List<Product> list = session.selectList(NAMESPACE+".search", sk);
		return list;
	}

	@Override
	public Member login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".login", dto);
	}

}
