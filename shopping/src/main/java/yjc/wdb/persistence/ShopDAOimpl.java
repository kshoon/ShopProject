package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.makLDTO;

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

	@Override
	public List<WishDTO> getwish(int mem_no) throws Exception {
		return session.selectList(NAMESPACE+".wlist", mem_no);
	}

	@Override
	public void insertWish(WishDTO dto) throws Exception {
		session.insert(NAMESPACE+".insertW", dto);		
	}

	@Override
	public List<MakDTO> makList(int product_no) throws Exception {
		return session.selectList(NAMESPACE+".makList", product_no);
	}

	@Override
	public List<MakDTO> shopList() throws Exception {
		return session.selectList(NAMESPACE+".shopList");
	}

	@Override
	public void insertBtnWish(InsertDTO dto) throws Exception {
		System.out.println("ㅎㅇ");
		session.insert(NAMESPACE+".insertB",dto);		
	}

	@Override
	public WishDTO selectProductList(String keyval) throws Exception {
		System.out.println(keyval);
		return session.selectOne(NAMESPACE+".selectPL", keyval);
	}

	@Override
	public void deleteW(int wish_no, int mem_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("wish_no", wish_no);
		map.put("mem_no", mem_no);
		session.delete(NAMESPACE+".deleteW", map);		
	}

	
	@Override
	public Member getMem(int mem_no) throws Exception {
		return session.selectOne(NAMESPACE+".getM",mem_no);
	}

	@Override
	public List<Shop> getShop() throws Exception {
		return session.selectList(NAMESPACE+".getS");
	}

	@Override
	public Shop getShopOne(int shop_no) throws Exception {
		return session.selectOne(NAMESPACE+".getShopOne",shop_no);
	}

	@Override
	public List<Product> getShopProd(int member_no) throws Exception {
		return session.selectList(NAMESPACE+".getShopProdMem", member_no);
	}

	@Override
	public Wishlist checkWish(int mem_no, int prod_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("member_no", mem_no);
		map.put("product_no", prod_no);
		return session.selectOne(NAMESPACE+".checkWish", map);
	}

	@Override
	public void updateWish(int wish_no) throws Exception {
		session.update(NAMESPACE+".updateWish", wish_no);
		
	}

	@Override
	public int productbool(String searchText) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".productbool", searchText);
	}

	@Override
	public Product getProdOne(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".getProdOne", prod_no);
	}

	@Override
	public int whisInProd(String product_name) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE +".whisInProd", product_name);
	}

	

}
