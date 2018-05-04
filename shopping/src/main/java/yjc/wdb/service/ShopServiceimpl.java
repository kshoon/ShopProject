package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.persistence.ShopDAO;

@Service
public class ShopServiceimpl implements ShopService {
	@Inject
	private ShopDAO dao;

	@Override
	public List<Product> searchPro(SearchKeyword sk) throws Exception {
		return dao.searchPro(sk);
	}

	@Override
	public Member login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public List<WishDTO> getwish(int mem_no) throws Exception {
		return dao.getwish(mem_no);
	}

	@Override
	public void insertWish(WishDTO dto) throws Exception {
		dao.insertWish(dto);
		
	}

	@Override
	public List<MakDTO> makList(int product_no) throws Exception {
		return dao.makList(product_no);
	}

	@Override
	public List<MakDTO> shopList() throws Exception {
		return dao.shopList();
	}

	@Override
	public void insertBtnWish(InsertDTO dto) throws Exception {
		dao.insertBtnWish(dto);
		
	}

	@Override
	public WishDTO selectProductList(String keyval) throws Exception {
		return dao.selectProductList(keyval);
	}

	@Override
	public void deleteW(int wish_no, int mem_no) throws Exception{
		dao.deleteW(wish_no, mem_no);
		
	}

	@Override
	public Member getMem(int mem_no) throws Exception {
		
		return dao.getMem(mem_no);
	}

}
