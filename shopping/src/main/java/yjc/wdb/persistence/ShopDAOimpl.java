package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Bookmark;
import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.GpsDTO;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.alrListDTO;
import yjc.wdb.dto.makLDTO;
import yjc.wdb.dto.wishNewDTO;

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
	public void insertBtnWish(String keyval) throws Exception {
		session.insert(NAMESPACE+".insertB",keyval);		
	}

	@Override
	public WishDTO selectProductList(String keyval) throws Exception {
		System.out.println("selectProductListDAO : "+keyval);
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

	@Override
	public List<Shop> getShopMem(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".getShopMem", mem_no);
	}

	@Override
	public List<alrListDTO> alrList(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".alrList", prod_no);
	}

	@Override
	public List<String> ShopPName(int shop_no, int mem_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("shop_no", shop_no);
		map.put("mem_no", mem_no);
		return session.selectList(NAMESPACE+".ShopPName", map);
	}

	@Override
	public List<Integer> wishPno(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".wishPno", prod_no);
	}

	@Override
	public void InsAlrTest(Alram alram) throws Exception {
		session.insert(NAMESPACE+".insAlrTest", alram);
		
	}

	@Override
	public int prodName(String product_name) throws Exception {
		return session.selectOne(NAMESPACE+".prodName",product_name);
	}

	@Override
	public List<WishDTO> wishNew(int member_no, String order) throws Exception {
		wishNewDTO wishNew = new wishNewDTO(member_no, order);
		System.out.println("wishNew: "+wishNew.getOrder());
		return session.selectList(NAMESPACE+".wlistNew", wishNew);
	}

	@Override
	public List<Shop> modSearch(String opt, String keyval) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("option", opt);
		map.put("keyval", keyval);
		return session.selectList(NAMESPACE+".modSearch",map);
	}

	@Override
	public void insertBm(int mem_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("mem_no", mem_no);
		map.put("shop_no", shop_no);
		session.insert(NAMESPACE+".insertBm",map);
		
	}

	@Override
	public void deleteBm(int mem_no, int shop_no) throws Exception {
		Map<String,Integer> map = new HashMap<>();
		map.put("mem_no", mem_no);
		map.put("shop_no", shop_no);
		session.delete(NAMESPACE+".deleteBm",map);
		
	}
	@Override
	public List<Bookmark> selectBm(int mem_no) throws Exception {

		return session.selectList(NAMESPACE+".selectBm",mem_no);
		
	}

	@Override
	public int selectBm1(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".selectBm1", mem_no);
	}

	@Override
	public List<Shop> selectBookSN(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".selectBookSN",mem_no);
	}

	@Override
	public GpsDTO selectGps(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".selectGps", shop_no);
	}

	@Override
	public void updateNos(int prod_no) throws Exception {
		session.update(NAMESPACE+".nosP",prod_no);
		
	}


	

}
