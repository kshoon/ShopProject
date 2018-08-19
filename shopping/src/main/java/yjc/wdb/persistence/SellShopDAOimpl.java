package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.ShopSearchDTO;
import yjc.wdb.dto.shopSellWishDTO;
import yjc.wdb.dto.wishNewDTO;



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
	@Override
	public void deleteSPP(int prod_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("prod_no", prod_no);
		map.put("shop_no", shop_no);
		session.delete(NAMESPACE+".deleteSPP", map);
		
	}
	@Override
	public List<Product> getPlist(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".plist", shop_no);
	}
	@Override
	public void insertSPP(int prod_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("prod_no", prod_no);
		map.put("shop_no", shop_no);
		session.insert(NAMESPACE+".insertSPP", map);
		
	}
	@Override
	public List<shopSellWishDTO> shopSellWish(int shop_no) throws Exception {
		return session.selectList(NAMESPACE+".shopSellWish", shop_no);
	}
	@Override
	public void updateSPU(int prod_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("prod_no", prod_no);
		map.put("shop_no", shop_no);
		session.update(NAMESPACE+".updateSPU", map);
		
	}
	@Override
	public List<Product> getSold(int shop_no) throws Exception {
		return session.selectList(NAMESPACE+".getSold",shop_no);
	}
	@Override
	public void updateSPUO(int prod_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("prod_no", prod_no);
		map.put("shop_no", shop_no);
		session.update(NAMESPACE+".updateSPUO", map);
		
	}
	@Override
	public List<Alram> getAlram(int mem_no) throws Exception {
		return session.selectList(NAMESPACE+".getAlram", mem_no);
	}
	@Override
	public List<Product> getPWlist(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".pwlist", shop_no);
	}
	@Override
	public void remAlr(int alram_no) throws Exception {
		session.delete(NAMESPACE+".remAlr", alram_no);
		
	}
	@Override
	public List<Product> IpSearch(int shop_no, String keyword) throws Exception {
		ShopSearchDTO ssdto = new ShopSearchDTO(shop_no, keyword);
		return session.selectList(NAMESPACE+".insertPsearch",ssdto);
	}
	@Override
	public List<Product> selectNos() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".selectNos");
	}
	@Override
	public List<shopSellWishDTO> selectSsw(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".selectSsw",shop_no);
	}
	


	

	

}
