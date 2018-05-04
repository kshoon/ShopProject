package yjc.wdb.service;

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

public interface ShopService {
	public List<Product> searchPro(SearchKeyword sk) throws Exception ;
	public Member login(LoginDTO dto) throws Exception;
	public List<WishDTO> getwish(int mem_no)throws Exception;
	public void insertWish(WishDTO dto)throws Exception;
	public List<MakDTO> makList(int product_no) throws Exception;
	public List<MakDTO> shopList() throws Exception;
	public void insertBtnWish(InsertDTO dto) throws Exception;
	public WishDTO selectProductList(String keyval) throws Exception;
	public void deleteW(int wish_no, int mem_no) throws Exception;
	public Member getMem(int mem_no) throws Exception;
	}
