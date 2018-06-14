package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.alrListDTO;

public interface ShopDAO {
	public List<Product> searchPro(SearchKeyword sk) throws Exception;
	public Member login(LoginDTO dto) throws Exception;
	public List<WishDTO> getwish(int mem_no) throws Exception;
	public void insertWish(WishDTO dto) throws Exception;
	public List<MakDTO> makList(int product_no) throws Exception;
	public List<MakDTO> shopList() throws Exception;
	public void insertBtnWish(String keyval) throws Exception;
	public WishDTO selectProductList(String keyval) throws Exception;
	public void deleteW(int wish_no, int mem_no) throws Exception;
	public Member getMem(int mem_no)throws Exception;
	public List<Shop> getShop() throws Exception;
	public Shop getShopOne(int shop_no) throws Exception;
	public List<Product> getShopProd(int member_no) throws Exception;
	public Wishlist checkWish(int mem_no, int prod_no) throws Exception;
	public void updateWish(int wish_no) throws Exception;
	public int productbool(String searchText)throws Exception;
	public Product getProdOne(int prod_no) throws Exception;
	public List<alrListDTO> alrList(int prod_no) throws Exception;
	
	//sj
	public int whisInProd(String product_name) throws Exception;
	public List<Shop> getShopMem(int mem_no) throws Exception;
}
