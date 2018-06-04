package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;



@Repository
public class SellShopDAOimpl implements SellShopDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mapper.sellShopMapper";
	@Override
	public List<Shop> myshop(int mem_no) throws Exception {
		return session.selectList(NAMESPACE+".Myshop", mem_no);
	}
	@Override
	public void updateShop(Shop shop) throws Exception {
		session.update(NAMESPACE+".updateShop", shop);
		
	}
	@Override
	public List<Product> getProd(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".getProd", shop_no);
	}
	


	

	

}
