package yjc.wdb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;

@Repository
public class ShopDAOimpl implements ShopDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mapper.testMapper";

	@Override
	public List<Product> searchPro(SearchKeyword sk) {
		List<Product> list = session.selectList(NAMESPACE+".search", sk);
		return list;
	}

}
