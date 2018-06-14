package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.MyWishShopDTO;
import yjc.wdb.dto.WishDTO;

@Repository
public class SellMobileDAOImpl implements SellMobileDAO{
	@Inject
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mapper.sellMobileMapper";
	@Override
	public List<Shop> myshop(int mem_no) throws Exception {
		return session.selectList(NAMESPACE+".Myshop", mem_no);
	}
	@Override
	public List<MakDTO> shophaveProduct(int mem_no) throws Exception {
		return	session.selectList(NAMESPACE+".ShophaveProduct", mem_no);
	}
	@Override
	public List<Product> shophaveProduct2(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".ShophaveProduct2", shop_no);
	}
	@Override
	public List<WishDTO> wlistNoProduct(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".wlistNoProduct", shop_no);
	}
	@Override
	public void shopProductIns(int shop_no, int prod_no) throws Exception {
		System.out.println("등록");
		Map<String,Integer> map = new HashMap<>();
		map.put("shop_no", shop_no);
		map.put("prod_no", prod_no);
		session.insert(NAMESPACE+".ShopProductIns", map);
		
	}
	@Override
	public void ShopProductRem(int shop_no, int prod_no) throws Exception {
		System.out.println("삭제");
		Map<String,Integer> map = new HashMap<>();
		map.put("shop_no", shop_no);
		map.put("prod_no", prod_no);
		session.insert(NAMESPACE+".ShopProductRem", map);
		
	}
	@Override
	public List<Product> plist(int shop_no) throws Exception {
		return session.selectList(NAMESPACE+".plist", shop_no);
	}
	@Override
	public List<Shop> AllShop() throws Exception {
		return session.selectList(NAMESPACE+".Allshop");
		
	}
	@Override
	public List<MyWishShopDTO> MyWishShop(int mem_no) throws Exception {
		return session.selectList(NAMESPACE+".MyWishShop", mem_no);
	}
}
